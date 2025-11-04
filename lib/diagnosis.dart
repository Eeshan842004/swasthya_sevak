import 'package:flutter/material.dart';
import 'start_treatment.dart';
import 'information.dart'; // ✅ Import information screen

class DiagnosisScreen extends StatelessWidget {
  const DiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTitle(),
                    _buildDiagnosisCard(),
                    _buildSymptomsMatching(),
                    _buildSymptomsGrid(),
                    _buildRiskLevel(),
                    _buildOtherPossibilities(),
                    _buildOtherDiseaseCard(),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Color(0xFF0C111C), size: 24),
          ),
          const Text(
            'AI Diagnosis',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0C111C),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: const Text(
        'Diagnosis Complete!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF0C111C),
          fontSize: 28,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildDiagnosisCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              "https://images.unsplash.com/photo-1584515933487-779824d29309?w=400&h=200&fit=crop",
              height: 201,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'DENGUE Fever',
                  style: TextStyle(
                    color: Color(0xFF0C111C),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Urgent',
                  style: TextStyle(
                    color: Color(0xFF4C6B99),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '78% Confidence',
                  style: TextStyle(
                    color: Color(0xFF4C6B99),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomsMatching() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: const Text(
        'Symptoms Matching',
        style: TextStyle(
          color: Color(0xFF0C111C),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildSymptomsGrid() {
    final symptoms = [
      {'name': 'Fever', 'match': true},
      {'name': 'Headache', 'match': true},
      {'name': 'Muscle Pain', 'match': true},
      {'name': 'Joint Pain', 'match': true},
      {'name': 'Rash', 'match': true},
      {'name': 'Nausea', 'match': false},
      {'name': 'Vomiting', 'match': false},
      {'name': 'Fatigue', 'match': false},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _symptomCard(symptoms[0])),
              const SizedBox(width: 8),
              Expanded(child: _symptomCard(symptoms[1])),
            ],
          ),
          Row(
            children: [
              Expanded(child: _symptomCard(symptoms[2])),
              const SizedBox(width: 8),
              Expanded(child: _symptomCard(symptoms[3])),
            ],
          ),
          Row(
            children: [
              Expanded(child: _symptomCard(symptoms[4])),
              const SizedBox(width: 8),
              Expanded(child: _symptomCard(symptoms[5])),
            ],
          ),
          Row(
            children: [
              Expanded(child: _symptomCard(symptoms[6])),
              const SizedBox(width: 8),
              Expanded(child: _symptomCard(symptoms[7])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _symptomCard(Map<String, dynamic> symptom) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E8EA), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            symptom['name'],
            style: const TextStyle(
              color: Color(0xFF4C6B99),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            symptom['match'] ? '✓' : '✗',
            style: const TextStyle(
              color: Color(0xFF0C111C),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskLevel() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 194,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0),
            Colors.black.withOpacity(0.6),
          ],
        ),
        image: const DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=400&h=200&fit=crop"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Risk Level: Urgent',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildOtherPossibilities() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: const Text(
        'Other Possibilities',
        style: TextStyle(
          color: Color(0xFF0C111C),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildOtherDiseaseCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'MALARIA',
                  style: TextStyle(
                    color: Color(0xFF0C111C),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '45% Confidence',
                  style: TextStyle(
                    color: Color(0xFF4C6B99),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://images.unsplash.com/photo-1628595351029-c2bf17511435?w=130&h=64&fit=crop",
              width: 130,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F9FC),
        border: Border(top: BorderSide(width: 1, color: Color(0xFFCED8E8))),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // ✅ Navigate to Information Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InformationScreen()),
                    );
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EDF2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'View Full Information',
                        style: TextStyle(
                          color: Color(0xFF0C111C),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartTreatmentScreen()),
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
                        'Start Treatment',
                        style: TextStyle(
                          color: Color(0xFFF7F9FC),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Disclaimer: This is an AI-based diagnosis and should be confirmed by a medical professional.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF4C6B99),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}