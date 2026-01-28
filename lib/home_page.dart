import 'package:flutter/material.dart';
import 'ride_details.dart'; // Ensure this matches your file name

// 1. Updated Data Model with Itinerary Support
class Ride {
  final String title;
  final String category;
  final String details;
  final String route;
  final String date;
  final String bike;
  final String distance;
  final String time;
  final int riders;
  final String difficulty;
  final String imagePath;
  final Color difficultyColor;
  final List<String> documents;
  final List<String> medical;
  final List<Map<String, String>> itinerary;

  Ride({
    required this.title,
    required this.route,
    required this.category,
    required this.details,
    required this.date,
    required this.bike,
    required this.distance,
    required this.time,
    required this.riders,
    required this.difficulty,
    required this.imagePath,
    required this.difficultyColor,
    required this.documents,
    required this.medical,
    required this.itinerary,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Full Dynamic Ride List
    final List<Ride> upcomingRides = [
      Ride(
        title: "Leh-Ladakh",
        category: "Mountains",
        route: "Manali - Leh - Nubra Valley",
        details: "Experience the breathtaking landscapes of Leh-Ladakh on this adventurous ride. Navigate through high-altitude passes, serene valleys, and vibrant local cultures.",
        date: "Feb 15 - Feb 23, 2026",
        bike: "RE Himalayan 400",
        riders: 8,
        difficulty: "ADVANCED",
        distance: "585 km",
        time: "13hr 57m",
        imagePath: "assets/leh.jpg",
        difficultyColor: const Color(0xFFB71C1C),
        documents: ["Inner Line Permit", "Driving Licence", "RC", "Passport Photos"],
        medical:["Potable Oxygen Cylinder", "Hydration Pack","Medicines"],
        itinerary: [
          {"day": "1", "route": "Manali to Jispa", "highlights": "Atal Tunnel, Sissu"},
          {"day": "2", "route": "Jispa to Sarchu", "highlights": "Baralacha La"},
          {"day": "3", "route": "Sarchu to Leh", "highlights": "Gata Loops"},
        ],
      ),
      Ride(
        title: "Goa Coastal Ride",
        category: "Coastal",
        route: "Panaji - Anjuna - Palolem",
        details: "Enjoy the scenic coastal roads of Goa with this relaxed ride. Explore beautiful beaches, vibrant nightlife, and delicious local cuisine along the way.",
        date: "Feb 20 - Feb 23, 2026",
        bike: "RE Classic 350 Reborn",
        riders: 4,
        distance: "108 km",
        time: "3hr 27m",
        difficulty: "BEGINNER",
        imagePath: "assets/Goa.jpg",
        difficultyColor: const Color(0xFF2E7D32),
        documents: ["Inner Line Permit", "Driving Licence", "RC", "Insurance"],
        medical:["Potable Oxygen Cylinder", "Hydration Pack","Medicines"],
        itinerary: [
          {"day": "1", "route": "Panaji Arrival", "highlights": "Old Goa Churches"},
          {"day": "2", "route": "North Goa", "highlights": "Anjuna Beach"},
          {"day": "3", "route": "South Goa", "highlights": "Palolem Beach"},
        ],
      ),
      // Add Spiti and Pondi similarly...
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('MotoBuddy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
        actions: [
          IconButton(icon: const Icon(Icons.add, color: Colors.orange), onPressed: () {}),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/profile.jpg')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildSectionHeader(Icons.trending_up, "Trending Destinations"),
            _buildFilters(),
            _buildTrendingCarousel(),
            _buildSectionHeader(Icons.location_on_outlined, "Upcoming Rides"),
            _buildRideList(upcomingRides, context), // Context passed here
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: [Icon(icon, color: Colors.orange), const SizedBox(width: 8), Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))]),
    );
  }

  Widget _buildRideList(List<Ride> rides, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rides.length,
      itemBuilder: (ctx, index) => _rideCard(rides[index], context),
    );
  }

  Widget _rideCard(Ride ride, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                child: Image.asset(ride.imagePath, height: 180, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 15, left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: ride.difficultyColor, borderRadius: BorderRadius.circular(10)),
                  child: Text(ride.difficulty, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ride.title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _rideInfoRow(Icons.location_on_outlined, ride.route),
                _rideInfoRow(Icons.calendar_today_outlined, ride.date),
                _rideInfoRow(Icons.motorcycle_outlined, ride.bike),
                _rideInfoRow(Icons.people_outline, "${ride.riders} riders joined"),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RideDetails(ride: ride)));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF5722), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: const Text("Join Ride", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Reuse your SearchBar, Filters, and Carousel widgets here...
  Widget _buildSearchBar() { return Padding(padding: const EdgeInsets.all(16.0), child: TextField(decoration: InputDecoration(prefixIcon: const Icon(Icons.search, color: Colors.grey), hintText: "Search Rides", fillColor: const Color(0xFF1E1E1E), filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none)))); }
  Widget _buildFilters() { return SingleChildScrollView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Row(children: ["All", "Mountains", "Coastal"].map((f) => Padding(padding: const EdgeInsets.only(right: 8.0), child: ChoiceChip(label: Text(f), selected: f == "All", selectedColor: Colors.orange, backgroundColor: const Color(0xFF1E1E1E)))).toList())); }
  Widget _buildTrendingCarousel() { return SizedBox(height: 180, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.all(16), children: [_destinationCard("assets/Varkala.jpg"), _destinationCard("assets/sach.jpg"), _destinationCard("assets/Lake.jpg")])); }
  Widget _destinationCard(String img) { return Container(width: 140, margin: const EdgeInsets.only(right: 12), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover))); }
  Widget _rideInfoRow(IconData icon, String text) { return Padding(padding: const EdgeInsets.only(bottom: 6.0), child: Row(children: [Icon(icon, color: Colors.orange, size: 16), const SizedBox(width: 10), Text(text, style: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 13))])); }
}