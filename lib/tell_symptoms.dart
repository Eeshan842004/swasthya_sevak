import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'speak.dart';
import 'diagnosis.dart';

class TellSymptomsScreen extends StatefulWidget {
  const TellSymptomsScreen({super.key});

  @override
  State<TellSymptomsScreen> createState() => _TellSymptomsScreenState();
}

class _TellSymptomsScreenState extends State<TellSymptomsScreen> {
  String selectedGender = 'Male';
  double ageValue = 35;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController symptomController = TextEditingController();
  bool isRecordingSaved = false;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    symptomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildPatientInfo(),
                    _buildAgeSection(),
                    _buildGenderSelector(),
                    _buildPhoneNumberField(),
                    _buildSpeakButton(),
                    if (isRecordingSaved) ...[
                      _buildRecordingSavedBox(),
                      const SizedBox(height: 12),
                      _buildSymptomTextBox(),
                      const SizedBox(height: 12),
                      _buildUploadImageBox(),
                    ],
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Color(0xFF0C111C)),
          ),
          const Text(
            'Tell Symptoms',
            style: TextStyle(
              color: Color(0xFF0C111C),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const Icon(Icons.help_outline, color: Color(0xFF4C6B99)),
        ],
      ),
    );
  }

  Widget _buildPatientInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ramesh Sharma',
                  style: TextStyle(
                    color: Color(0xFF0C111C),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${ageValue.toInt()} · $selectedGender',
                  style: const TextStyle(
                    color: Color(0xFF4C6B99),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=260&h=128&fit=crop"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Age',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('${ageValue.toInt()}'),
            ],
          ),
          Slider(
            value: ageValue,
            min: 1,
            max: 100,
            activeColor: const Color(0xFF0C44A0),
            onChanged: (v) => setState(() => ageValue = v),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFE8EDF2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            _genderOption('Male'),
            _genderOption('Female'),
            _genderOption('Others'),
          ],
        ),
      ),
    );
  }

  Widget _genderOption(String gender) {
    final isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = gender),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? [const BoxShadow(color: Color(0x19000000), blurRadius: 4)]
                : null,
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                color:
                    isSelected ? const Color(0xFF0C111C) : const Color(0xFF4C6B99),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Phone Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EDF2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '+91',
                  hintStyle: TextStyle(color: Color(0xFF4C6B99))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeakButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SpeakPage()),
          );
          if (result == true) {
            setState(() {
              isRecordingSaved = true;
            });
          }
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF0C44A0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Press to Speak',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecordingSavedBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green, width: 1.2),
        ),
        child: const Center(
          child: Text(
            "🎙️ Voice recording saved!",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSymptomTextBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: symptomController,
        decoration: InputDecoration(
          hintText: "Type symptoms...",
          filled: true,
          fillColor: const Color(0xFFE8EDF2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _buildUploadImageBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFE8EDF2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF0C44A0), width: 1.5),
          ),
          child: Center(
            child: _selectedImage == null
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file, color: Color(0xFF0C44A0), size: 28),
                      SizedBox(height: 4),
                      Text("Upload Image",
                          style: TextStyle(color: Color(0xFF0C44A0))),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(_selectedImage!,
                        fit: BoxFit.cover, width: double.infinity, height: 100),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F9FC),
        border: Border(top: BorderSide(width: 1, color: Color(0xFFCED8E8))),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DiagnosisScreen()),
          );
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF0C44A0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Check with AI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
