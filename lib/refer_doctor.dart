import 'package:flutter/material.dart';

class ReferDoctorScreen extends StatefulWidget {
  const ReferDoctorScreen({super.key});

  @override
  State<ReferDoctorScreen> createState() => _ReferDoctorScreenState();
}

class _ReferDoctorScreenState extends State<ReferDoctorScreen> {
  String? _selectedReason;
  String? _selectedHospital;
  final TextEditingController _notesController = TextEditingController();
  
  final List<String> _urgencyLevels = ['Immediate', 'Urgent', 'Normal'];
  String _selectedUrgency = 'Urgent';

  final List<String> _reasons = [
    'Severe symptoms',
    'Need specialized care',
    'Emergency case',
    'Follow-up required',
    'Advanced testing needed',
  ];

  final List<Map<String, String>> _hospitals = [
    {'name': 'City Primary Health Center', 'distance': '2.5 km'},
    {'name': 'District Hospital', 'distance': '5.2 km'},
    {'name': 'Apollo Clinic', 'distance': '3.8 km'},
    {'name': 'Lifeline Medical Center', 'distance': '4.1 km'},
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F7),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                children: [
                  _buildPatientCard(),
                  _buildReasonSection(),
                  _buildReasonDropdown(),
                  _buildUrgencyChips(),
                  _buildHospitalDropdown(),
                  _buildNotesSection(),
                  _buildAttachmentButtons(),
                  _buildInfoText(),
                ],
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
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      decoration: const BoxDecoration(color: Color(0xFFFCF9F7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Color(0xFF1C140C), size: 24),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 48),
              child: Text(
                'Refer to Doctor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1C140C),
                  fontSize: 18,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                  height: 1.28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 219,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0),
            Colors.black.withOpacity(0.4),
          ],
        ),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=400&h=220&fit=crop",
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Ramesh Kumar, 8 years',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'DENGUE Fever',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: const Text(
        'Why are you referring?',
        style: TextStyle(
          color: Color(0xFF1C140C),
          fontSize: 18,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w700,
          height: 1.28,
        ),
      ),
    );
  }

  Widget _buildReasonDropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      decoration: ShapeDecoration(
        color: const Color(0xFFFCF9F7),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE8DBCE)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedReason,
          hint: const Text(
            'Select Reason',
            style: TextStyle(
              color: Color(0xFF1C140C),
              fontSize: 16,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF99724C)),
          items: _reasons.map((reason) {
            return DropdownMenuItem(
              value: reason,
              child: Text(
                reason,
                style: const TextStyle(
                  color: Color(0xFF1C140C),
                  fontSize: 16,
                  fontFamily: 'Lexend',
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() => _selectedReason = value);
          },
        ),
      ),
    );
  }

  Widget _buildUrgencyChips() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: _urgencyLevels.map((level) {
          final isSelected = _selectedUrgency == level;
          return InkWell(
            onTap: () => setState(() => _selectedUrgency = level),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: ShapeDecoration(
                color: isSelected ? const Color(0xFFED7F11) : Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: isSelected ? 0 : 1,
                    color: const Color(0xFFE8DBCE),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  level,
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF1C140C),
                    fontSize: 14,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHospitalDropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      decoration: ShapeDecoration(
        color: const Color(0xFFFCF9F7),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE8DBCE)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedHospital,
          hint: const Text(
            'Select PHC/Hospital',
            style: TextStyle(
              color: Color(0xFF1C140C),
              fontSize: 16,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF99724C)),
          items: _hospitals.map((hospital) {
            return DropdownMenuItem(
              value: hospital['name'],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      hospital['name']!,
                      style: const TextStyle(
                        color: Color(0xFF1C140C),
                        fontSize: 16,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                  Text(
                    hospital['distance']!,
                    style: const TextStyle(
                      color: Color(0xFF99724C),
                      fontSize: 14,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() => _selectedHospital = value);
          },
        ),
      ),
    );
  }

  Widget _buildNotesSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(15),
      constraints: const BoxConstraints(minHeight: 144),
      decoration: ShapeDecoration(
        color: const Color(0xFFFCF9F7),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE8DBCE)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextField(
        controller: _notesController,
        maxLines: 5,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Add additional notes here...',
          hintStyle: TextStyle(
            color: Color(0xFF99724C),
            fontSize: 14,
            fontFamily: 'Lexend',
          ),
        ),
        style: const TextStyle(
          color: Color(0xFF1C140C),
          fontSize: 14,
          fontFamily: 'Lexend',
        ),
      ),
    );
  }

  Widget _buildAttachmentButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _attachmentButton('Add Test Report', Icons.insert_drive_file),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _attachmentButton('Add Case History', Icons.history),
          ),
        ],
      ),
    );
  }

  Widget _attachmentButton(String label, IconData icon) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label clicked')),
        );
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFF2EDE8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF1C140C)),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF1C140C),
                  fontSize: 14,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                  height: 1.50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 12),
      child: const Text(
        'Please check all information before referring',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF99724C),
          fontSize: 14,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          height: 1.50,
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: InkWell(
            onTap: () {
              if (_selectedReason == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a reason')),
                );
                return;
              }
              if (_selectedHospital == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a hospital')),
                );
                return;
              }
              
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Referral Sent'),
                  content: Text(
                    'Patient referred to $_selectedHospital\nUrgency: $_selectedUrgency\nReason: $_selectedReason',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                color: const Color(0xFFED7F11),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Center(
                child: Text(
                  'Send Referral',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1C140C),
                    fontSize: 16,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w700,
                    height: 1.50,
                  ),
                ),
              ),
            ),
          ),
        ),
        _buildNavigationBar(),
      ],
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const ShapeDecoration(
        color: Color(0xFFFCF9F7),
        shape: Border(top: BorderSide(width: 1, color: Color(0xFFF2EDE8))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, 'Home', true),
          _navItem(Icons.history, 'History', false),
          _navItem(Icons.notifications, 'Alerts', false),
          _navItem(Icons.person, 'Profile', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF1C140C) : const Color(0xFF99724C),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF1C140C) : const Color(0xFF99724C),
            fontSize: 12,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w500,
            height: 1.50,
          ),
        ),
      ],
    );
  }
}