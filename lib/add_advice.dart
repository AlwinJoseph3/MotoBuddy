import 'package:flutter/material.dart';

class AddAdvicePage extends StatefulWidget {
  const AddAdvicePage({super.key});

  @override
  State<AddAdvicePage> createState() => _AddAdvicePageState();
}

class _AddAdvicePageState extends State<AddAdvicePage> {
  final TextEditingController _titleController = TextEditingController();
  final List<TextEditingController> _tipControllers = [TextEditingController()];

  @override
  void dispose() {
    _titleController.dispose();
    for (var controller in _tipControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addTipField() {
    setState(() {
      _tipControllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Share Advice",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Advice Heading",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 10),
            _buildTextField(_titleController, "e.g., Best routes in Kerala"),

            const SizedBox(height: 30),
            const Text(
              "Your Tips (Points)",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 10),

            ..._tipControllers.asMap().entries.map((entry) {
              int idx = entry.key;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    const Text(
                      "•",
                      style: TextStyle(color: Color(0xFFFD6B22), fontSize: 24),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(entry.value, "Enter tip point..."),
                    ),
                    if (idx > 0)
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        onPressed: () =>
                            setState(() => _tipControllers.removeAt(idx)),
                      ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: _addTipField,
              icon: const Icon(Icons.add, color: Color(0xFFFD6B22)),
              label: const Text(
                "Add another point",
                style: TextStyle(color: Color(0xFFFD6B22)),
              ),
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD6B22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Post Advice",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        fillColor: const Color(0xFF1E1E1E),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
