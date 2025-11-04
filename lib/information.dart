import 'package:flutter/material.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
            _buildTitle(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAIThinkingTab(),
                  _buildDiseaseInfoTab(),
                  _buildWarningSignsTab(),
                ],
              ),
            ),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
            'DENGUE Fever',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0C111C),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const Icon(Icons.share_outlined, color: Color(0xFF0C111C), size: 24),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Text(
        '78% Confidence',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF4C6B99),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xFFCED8E8))),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF0C111C),
        unselectedLabelColor: const Color(0xFF4C6B99),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        indicator: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 3, color: Color(0xFF0C111C))),
        ),
        tabs: const [
          Tab(text: "AI's Thinking"),
          Tab(text: "Disease Info"),
          Tab(text: "Warning Signs"),
        ],
      ),
    );
  }

  // ============== TAB 1: AI's THINKING ==============
  Widget _buildAIThinkingTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            imageUrl: "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=400&h=250&fit=crop",
            title: "How AI Identified This",
            description:
                "AI analyzed your symptoms based on patterns from thousands of dengue cases. The combination of high fever, headache, muscle pain, and joint pain strongly indicates dengue fever.",
          ),
          const SizedBox(height: 16),
          _buildExpandableCard(
            title: "Matching Symptoms",
            content: "Fever, Headache, Muscle Pain, Joint Pain, Rash",
            icon: Icons.check_circle_outline,
            iconColor: Colors.green,
          ),
          const SizedBox(height: 12),
          _buildExpandableCard(
            title: "Missing Symptoms",
            content: "Nausea, Vomiting, Fatigue - Not all symptoms need to be present for diagnosis",
            icon: Icons.cancel_outlined,
            iconColor: Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            imageUrl: "https://images.unsplash.com/photo-1559757175-5700dde675bc?w=400&h=220&fit=crop",
            title: "Conclusion",
            description:
                "Based on your symptoms, there is a high probability of dengue fever. Immediate medical consultation is recommended.",
          ),
        ],
      ),
    );
  }

  // ============== TAB 2: DISEASE INFORMATION ==============
  Widget _buildDiseaseInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            imageUrl: "https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=400&h=250&fit=crop",
            title: "What is Dengue?",
            description:
                "Dengue fever is a mosquito-borne viral infection that can cause severe illness. It's transmitted by Aedes mosquitoes and is common in tropical and subtropical regions.",
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            imageUrl: "https://images.unsplash.com/photo-1598974357801-cbdefed3f49b?w=400&h=220&fit=crop",
            title: "How Does it Spread?",
            description:
                "Dengue spreads through the bite of infected Aedes aegypti mosquitoes. These mosquitoes are most active during early morning and before dusk.",
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            imageUrl: "https://images.unsplash.com/photo-1584515979956-d9f6e5d09982?w=400&h=250&fit=crop",
            title: "Timeline",
            description:
                "Symptoms typically appear 4-10 days after being bitten and last for 2-7 days. The critical period is when fever subsides (days 3-7).",
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            imageUrl: "https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=400&h=250&fit=crop",
            title: "Prevention",
            description:
                "Avoid mosquito bites by using repellents, wearing long sleeves, using mosquito nets, and eliminating standing water around your home.",
          ),
          const SizedBox(height: 16),
          _buildTreatmentSection(),
        ],
      ),
    );
  }

  Widget _buildTreatmentSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF0C44A0), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.medical_services, color: Color(0xFF0C44A0), size: 24),
              SizedBox(width: 8),
              Text(
                'Treatment & Care',
                style: TextStyle(
                  color: Color(0xFF0C111C),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem("💊 Take Paracetamol for fever (avoid aspirin/ibuprofen)"),
          _buildTreatmentItem("💧 Drink plenty of fluids - at least 3-4 liters per day"),
          _buildTreatmentItem("🛏️ Complete bed rest for 5-7 days"),
          _buildTreatmentItem("🍊 Eat light, nutritious food - fruits, soups, porridge"),
          _buildTreatmentItem("🩺 Monitor platelet count every 24 hours"),
          _buildTreatmentItem("🏥 Visit doctor immediately if condition worsens"),
        ],
      ),
    );
  }

  Widget _buildTreatmentItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF0C111C),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      ),
    );
  }

  // ============== TAB 3: WARNING SIGNS ==============
  Widget _buildWarningSignsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWarningCard(
            imageUrl: "https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb?w=400&h=280&fit=crop",
            title: "🚨 Go to Hospital Immediately if You Notice:",
            description:
                "Severe abdominal pain, persistent vomiting, bleeding gums or nose, blood in vomit or stool, extreme fatigue, restlessness, rapid breathing, cold or clammy skin",
            isUrgent: true,
          ),
          const SizedBox(height: 16),
          _buildWarningCard(
            imageUrl: "https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400&h=220&fit=crop",
            title: "Emergency Contact",
            description: "Dial 108 for Emergency Ambulance Service\n\nDon't delay if symptoms worsen!",
            isUrgent: true,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.shade300, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.red.shade700, size: 28),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Critical Period Alert',
                        style: TextStyle(
                          color: Color(0xFF0C111C),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Days 3-7 are the most critical when fever drops. This is when complications can occur. Stay under medical supervision during this period.',
                  style: TextStyle(
                    color: Color(0xFF0C111C),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildMonitoringSection(),
        ],
      ),
    );
  }

  Widget _buildMonitoringSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade300, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.monitor_heart, color: Colors.orange.shade700, size: 24),
              const SizedBox(width: 8),
              const Text(
                'What to Monitor',
                style: TextStyle(
                  color: Color(0xFF0C111C),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildMonitorItem("📊 Platelet count - should not go below 50,000"),
          _buildMonitorItem("🌡️ Body temperature - every 4-6 hours"),
          _buildMonitorItem("💧 Fluid intake - maintain good hydration"),
          _buildMonitorItem("🩸 Any signs of bleeding - gums, nose, skin"),
          _buildMonitorItem("😓 Urine output - dark urine or reduced output is concerning"),
        ],
      ),
    );
  }

  Widget _buildMonitorItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF0C111C),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      ),
    );
  }

  // ============== REUSABLE WIDGETS ==============
  Widget _buildInfoCard({
    required String imageUrl,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            height: 246,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 246,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningCard({
    required String imageUrl,
    required String title,
    required String description,
    bool isUrgent = false,
  }) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: isUrgent ? Border.all(color: Colors.red.shade400, width: 3) : null,
        boxShadow: [
          BoxShadow(
            color: isUrgent ? Colors.red.withOpacity(0.2) : Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            height: 276,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 276,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableCard({
    required String title,
    required String content,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EDF2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF0C111C),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.expand_more, color: Color(0xFF4C6B99), size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF4C6B99),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F9FC),
        border: Border(top: BorderSide(width: 1, color: Color(0xFFCED8E8))),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF0C44A0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'View Treatment Plan',
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
    );
  }
}