import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create Ride", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const Text("Plan your next adventure", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            _field("Destination", "e.g., Leh-Ladakh"),
            _field("Route Details", "e.g., Manali - Leh"),
            const SizedBox(height: 10),
            const Text("Difficulty Level", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                _choice("EASY", false),
                const SizedBox(width: 8),
                _choice("MEDIUM", true),
                const SizedBox(width: 8),
                _choice("HARD", false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFF262626),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _choice(String label, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: active ? Colors.orange : const Color(0xFF262626), borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: active ? Colors.black : Colors.white))),
      ),
    );
  }
}