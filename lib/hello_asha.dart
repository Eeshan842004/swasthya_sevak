import 'package:flutter/material.dart';
import 'tell_symptoms.dart';
import 'map.dart';
import 'follow.dart'; // ✅ Import follow-up screen

class HelloAshaScreen extends StatelessWidget {
  const HelloAshaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildOnlineStatus(context), // 🔹 updated
              _buildNewPatientCard(context),
              _buildTodaysCasesCard(context),
              _buildVillageHealthCard(context),
              _buildStatsSection(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://ui-avatars.com/api/?name=Priya&background=0C44A0&color=fff&size=128"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Namaste, Priya!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0C111C),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 1.28,
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF4C6B99),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Modified version with SEND ALERT
  Widget _buildOnlineStatus(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.only(top: 12, left: 12, right: 16, bottom: 12),
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 12,
        runSpacing: 12,
        children: [
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: ShapeDecoration(
              color: const Color(0xFFE8EDF2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, color: Colors.green, size: 8),
                SizedBox(width: 8),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Color(0xFF0C111C),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),

          // 🔴 SEND ALERT Button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "🚨 Alert sent to nearest police station!",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.redAccent,
                ),
              );
            },
            icon: const Icon(Icons.warning_amber_rounded,
                color: Colors.white, size: 18),
            label: const Text(
              "SEND ALERT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Remaining original code unchanged
  Widget _buildNewPatientCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 201,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=600&h=400&fit=crop"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Patient Check',
                    style: TextStyle(
                      color: Color(0xFF4C6B99),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'New Patient Checkup',
                    style: TextStyle(
                      color: Color(0xFF0C111C),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.28,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: Text(
                          'Speak symptoms, AI diagnoses',
                          style: TextStyle(
                            color: Color(0xFF4C6B99),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TellSymptomsScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 32,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0C44A0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Start',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF7F9FC),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaysCasesCard(BuildContext context) => // unchanged
      _dummyCard(context,
          title: 'Todays Cases',
          subtitle: 'Today\'s Cases',
          info: '5 Patients',
          image:
              'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?w=600&h=400&fit=crop');

  Widget _buildVillageHealthCard(BuildContext context) => // unchanged
      _dummyCard(context,
          title: 'Village Health',
          subtitle: 'Village Health',
          info: 'View Map',
          image:
              'https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=600&h=400&fit=crop',
          isMap: true);

  Widget _buildStatsSection(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: _buildStatCard('Today\'s Diagnoses', '3')),
            const SizedBox(width: 16),
            Expanded(child: _buildStatCard('Follow-ups Pending', '2', context)),
          ],
        ),
      );

  Widget _dummyCard(BuildContext context,
      {required String title,
      required String subtitle,
      required String info,
      required String image,
      bool isMap = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 201,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF4C6B99),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF0C111C),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.28,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        info,
                        style: const TextStyle(
                          color: Color(0xFF4C6B99),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                      InkWell(
                        onTap: isMap
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const VillageMapScreen(),
                                  ),
                                );
                              }
                            : null,
                        child: Container(
                          height: 32,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0C44A0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'View',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF7F9FC),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, [BuildContext? context]) {
    return InkWell(
      onTap: title == 'Follow-ups Pending' && context != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FollowUpScreen()),
              );
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side:
                const BorderSide(width: 1, color: Color(0xFFCED8E8)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF0C111C),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF0C111C),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                if (title == 'Follow-ups Pending' && context != null)
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xFF0C44A0),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
