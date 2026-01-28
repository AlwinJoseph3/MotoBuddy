import 'package:flutter/material.dart';
import 'home_page.dart';

class RideDetails extends StatelessWidget {
  final Ride ride;
  const RideDetails({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Column(
          children: [
            // 1. Header with Back Button and Difficulty Tag
            Stack(
              children: [
                Image.asset(
                  ride.imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: ride.difficultyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      ride.difficulty,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                ride.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TabBar(
              indicatorColor: Color(0xFFF15A24),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Overview"),
                Tab(text: "Itinerary"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [_buildOverviewTab(), _buildItineraryTab()],
              ),
            ),
            // Join Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5722),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Join Ride",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/Goa.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12, // Gap between capsules
            runSpacing: 12, // Gap if they wrap to a second line
            children: [
              _buildStatCapsule(Icons.map_outlined, ride.distance),
              _buildStatCapsule(Icons.access_time, ride.time),
              _buildStatCapsule(Icons.groups_outlined, "${ride.riders}"),
            ],
          ),
          _buildRideDetailsSection("Ride Details", ride.details),
          _buildChecklistSection("Documents Required", ride.documents),
          _buildChecklistSection("Medical Gear", ride.medical),
        ],
      ),
    );
  }

  Widget _buildItineraryTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildItineraryRow("Day", "Route", "Highlights", isHeader: true),
        const Divider(color: Colors.grey),
        ...ride.itinerary
            .map(
              (item) => _buildItineraryRow(
                item['day']!,
                item['route']!,
                item['highlights']!,
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildStatCapsule(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Dark grey capsule background
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Orange Circle Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFFF5722), // Moto Orange
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          // Label Text
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Component Helpers
  Widget _buildChecklistSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map(
                  (i) => Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      "• $i",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRideDetailsSection(String title, String details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            details,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildItineraryRow(
    String d,
    String r,
    String h, {
    bool isHeader = false,
  }) {
    TextStyle style = TextStyle(
      color: isHeader ? Colors.white : Colors.grey,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(d, style: style)),
          Expanded(flex: 3, child: Text(r, style: style)),
          Expanded(flex: 3, child: Text(h, style: style)),
        ],
      ),
    );
  }
}
