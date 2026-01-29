import 'package:flutter/material.dart';
import 'models/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF5722),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(user.profileImagePath),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            _buildSectionHeader(user.highestAwardName),
            _buildAwardCard(user.awardImagePath, user.highestAwardDescription),

            const SizedBox(height: 20),
            const Divider(
              color: Color(0xFFFF5722),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            _buildSectionHeader("My Ride"),
            _buildBikeCard(user.bikeImagePath, user.bikeName),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatBox(
                      "Rides Joined",
                      user.ridesJoined.toString(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildStatBox(
                      "Distance Covered",
                      user.distanceCovered,
                    ),
                  ),
                ],
              ),
            ),

            _buildSettingsMenu(),

            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Text(
                "MotoBuddy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFFF5722),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildAwardCard(String imagePath, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 60),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBikeCard(String imagePath, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
          ),
        ),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFFF5722), width: 1),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsMenu() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          _menuTile(Icons.edit_outlined, "Edit Profile"),
          _menuTile(Icons.motorcycle_outlined, "My Ride"),
          _menuTile(Icons.person_outline, "Emergency Contacts"),
          _menuTile(Icons.medical_services_outlined, "Medical Info"),
          _menuTile(Icons.lock_outline, "Privacy Settings"),
          _menuTile(Icons.notifications_none_outlined, "Ride Alerts"),
          _menuTile(Icons.help_outline, "Help and Support"),
          _menuTile(Icons.logout, "Logout", isLogout: true),
        ],
      ),
    );
  }

  Widget _menuTile(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFF5722), size: 22),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? const Color(0xFFFF5722) : Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () {},
    );
  }
}
