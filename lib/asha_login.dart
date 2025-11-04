import 'package:flutter/material.dart';

class AshaLoginScreen extends StatefulWidget {
  const AshaLoginScreen({super.key});

  @override
  State<AshaLoginScreen> createState() => _AshaLoginScreenState();
}

class _AshaLoginScreenState extends State<AshaLoginScreen> {
  String? selectedVillage;
  String? selectedPHC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text(
              "Welcome ASHA Didi!",
              style: TextStyle(
                color: Color(0xFF0C111C),
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Let's get started",
              style: TextStyle(color: Color(0xFF0C111C), fontSize: 16),
            ),
            const SizedBox(height: 20),

            buildTextField("Name", "Enter your name"),
            buildTextField(
              "Mobile Number",
              "Enter your mobile number",
              keyboardType: TextInputType.phone,
            ),

            // 🔹 Village Dropdown
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Village/Area",
                    style: TextStyle(
                      color: Color(0xFF0C111C),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFCED8E8)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedVillage,
                        hint: const Text("Select"),
                        items: const [
                          DropdownMenuItem(
                            value: "Palampur",
                            child: Text("Palampur"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedVillage = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Nearest PHC Dropdown
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nearest PHC",
                    style: TextStyle(
                      color: Color(0xFF0C111C),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFCED8E8)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedPHC,
                        hint: const Text("Select"),
                        items: const [
                          DropdownMenuItem(
                            value: "2.5 KM away — Swasth Care Medical",
                            child:
                                Text("2.5 KM away — Swasth Care Medical"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedPHC = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C44A0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/helloAsha');
                },
                child: const Text(
                  "Start",
                  style: TextStyle(
                    color: Color(0xFFF7F9FC),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
            const Center(
              child: Text(
                "By continuing, you agree to our Terms & Conditions",
                style: TextStyle(color: Color(0xFF4C6B99), fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint,
      {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                color: Color(0xFF0C111C),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 8),
          TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF4C6B99)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFCED8E8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
