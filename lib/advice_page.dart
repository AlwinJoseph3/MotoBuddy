import 'package:flutter/material.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Advice Hub", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const Text("Expert tips from fellow riders", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: "Search routes or tips...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color(0xFF262626),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),
          const Row(children: [Icon(Icons.trending_up, color: Colors.orange, size: 20), SizedBox(width: 8), Text("Trending Advice", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))]),
          const SizedBox(height: 16),
          _adviceCard("Manali-Leh Highway", "Start early morning (5-6 AM) to avoid high winds."),
          _adviceCard("Mumbai-Goa Route", "Use fog lights and wear reflective gear during monsoon."),
        ],
      ),
    );
  }

  Widget _adviceCard(String title, String tip) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF262626), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(tip, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }
}