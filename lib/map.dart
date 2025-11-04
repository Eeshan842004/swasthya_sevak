import 'package:flutter/material.dart';

class VillageMapScreen extends StatefulWidget {
  const VillageMapScreen({super.key});

  @override
  State<VillageMapScreen> createState() => _VillageMapScreenState();
}

class _VillageMapScreenState extends State<VillageMapScreen> {
  String selectedDisease = 'All'; // 'All', 'Dengue', 'Malaria', 'Typhoid'

  // Disease data
  final Map<String, Map<String, dynamic>> diseaseData = {
    'Dengue': {
      'count': 15,
      'color': Colors.red,
      'locations': [
        {'x': 0.3, 'y': 0.2},
        {'x': 0.5, 'y': 0.3},
        {'x': 0.7, 'y': 0.25},
        {'x': 0.4, 'y': 0.4},
        {'x': 0.6, 'y': 0.5},
        {'x': 0.35, 'y': 0.6},
        {'x': 0.8, 'y': 0.4},
        {'x': 0.25, 'y': 0.5},
        {'x': 0.55, 'y': 0.65},
        {'x': 0.45, 'y': 0.75},
        {'x': 0.65, 'y': 0.7},
        {'x': 0.75, 'y': 0.6},
        {'x': 0.2, 'y': 0.7},
        {'x': 0.5, 'y': 0.8},
        {'x': 0.7, 'y': 0.8},
      ],
    },
    'Malaria': {
      'count': 10,
      'color': Colors.amber,
      'locations': [
        {'x': 0.4, 'y': 0.3},
        {'x': 0.6, 'y': 0.35},
        {'x': 0.3, 'y': 0.45},
        {'x': 0.7, 'y': 0.5},
        {'x': 0.5, 'y': 0.55},
        {'x': 0.35, 'y': 0.65},
        {'x': 0.65, 'y': 0.6},
        {'x': 0.45, 'y': 0.7},
        {'x': 0.55, 'y': 0.75},
        {'x': 0.3, 'y': 0.8},
      ],
    },
    'Typhoid': {
      'count': 2,
      'color': Colors.green,
      'locations': [
        {'x': 0.5, 'y': 0.4},
        {'x': 0.6, 'y': 0.7},
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildDiseaseFilters(),
            Expanded(child: _buildMap()),
            _buildStatsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Color(0xFFCED8E8))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Color(0xFF0C111C), size: 24),
          ),
          Row(
            children: const [
              Icon(Icons.location_on, color: Color(0xFF0C44A0), size: 24),
              SizedBox(width: 8),
              Text(
                'पालमपुर',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0C111C),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Icon(Icons.tune, color: Color(0xFF0C111C), size: 24),
        ],
      ),
    );
  }

  Widget _buildDiseaseFilters() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _buildFilterChip('All', Icons.grid_view),
          const SizedBox(width: 8),
          _buildFilterChip('Dengue', Icons.coronavirus, Colors.red),
          const SizedBox(width: 8),
          _buildFilterChip('Malaria', Icons.bug_report, Colors.amber),
          const SizedBox(width: 8),
          _buildFilterChip('Typhoid', Icons.medical_services, Colors.green),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String disease, IconData icon, [Color? color]) {
    final isSelected = selectedDisease == disease;
    return InkWell(
      onTap: () {
        setState(() {
          selectedDisease = disease;
        });
      },
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFF0C44A0) : const Color(0xFFE8EDF2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : (color ?? const Color(0xFF4C6B99)),
            ),
            const SizedBox(width: 6),
            Text(
              disease,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF0C111C),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background map image
     Container(
  decoration: BoxDecoration(
    color: const Color(0xFFE8F5E9),
    image: DecorationImage(
      image: AssetImage('assets/map.jpg'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.white.withOpacity(0.2),
        BlendMode.lighten,
      ),
    ),
  ),
),

            // Semi-transparent overlay for better dot visibility
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            // Disease markers
            ...(_getVisibleMarkers()),
            // Zoom controls
            Positioned(
              right: 16,
              bottom: 80,
              child: Column(
                children: [
                  _buildZoomButton(Icons.add, () {}),
                  const SizedBox(height: 8),
                  _buildZoomButton(Icons.remove, () {}),
                  const SizedBox(height: 16),
                  _buildZoomButton(Icons.my_location, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getVisibleMarkers() {
    List<Widget> markers = [];

    diseaseData.forEach((disease, data) {
      if (selectedDisease == 'All' || selectedDisease == disease) {
        final locations = data['locations'] as List;
        final color = data['color'] as Color;

        for (var location in locations) {
          markers.add(
            Positioned(
              left: location['x'] * 300,
              top: location['y'] * 400,
              child: _buildMarker(color, disease),
            ),
          );
        }
      }
    });

    return markers;
  }

  Widget _buildMarker(Color color, String disease) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildZoomButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF0C111C), size: 20),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF0C44A0),
            const Color(0xFF0C44A0).withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0C44A0).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.medical_information, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                'Village Health Summary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Dengue',
                  '15 patients',
                  Colors.red,
                  Icons.coronavirus,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatItem(
                  'Malaria',
                  '10 patients',
                  Colors.amber,
                  Icons.bug_report,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatItem(
                  'Typhoid',
                  '2 patients',
                  Colors.green,
                  Icons.medical_services,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Active Cases',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '27',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String disease, String count, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            disease,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for map grid
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..strokeWidth = 1;

    const gridSize = 40.0;

    // Draw vertical lines
    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}