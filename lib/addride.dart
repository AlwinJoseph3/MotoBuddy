import 'package:flutter/material.dart';
import 'models/ride_model.dart';

class AddRideFlow extends StatefulWidget {
  const AddRideFlow({super.key});

  @override
  State<AddRideFlow> createState() => _AddRideFlowState();
}

class _AddRideFlowState extends State<AddRideFlow> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _routeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _bikeController = TextEditingController();
  final TextEditingController _distController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();

  String _selectedDifficulty = "BEGINNER";
  Color _difficultyColor = Colors.green;

  final List<Map<String, TextEditingController>> _itineraryItems = [
    {
      "day": TextEditingController(text: "1"),
      "route": TextEditingController(),
      "highlights": TextEditingController(),
    },
  ];

  final List<Map<String, TextEditingController>> _checklistItems = [
    {"category": TextEditingController(), "items": TextEditingController()},
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _routeController.dispose();
    _dateController.dispose();
    _bikeController.dispose();
    _distController.dispose();
    _timeController.dispose();
    _detailsController.dispose();
    _whatsappController.dispose();

    for (var item in _itineraryItems) {
      for (var controller in item.values) {
        controller.dispose();
      }
    }
    for (var item in _checklistItems) {
      for (var controller in item.values) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  void _validateAndNext() {
    if (_formKey.currentState!.validate()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill in all details before going to the next page",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _finalSubmit() {
    if (_formKey.currentState!.validate()) {
      final newRide = Ride(
        title: _titleController.text,
        category: _categoryController.text.isEmpty
            ? "Expedition"
            : _categoryController.text,
        details: _detailsController.text,
        route: _routeController.text,
        date: _dateController.text,
        bike: _bikeController.text,
        distance: _distController.text,
        time: _timeController.text,
        riders: 0,
        difficulty: _selectedDifficulty,
        imagePath: "assets/leh.jpg",
        difficultyColor: _difficultyColor,
        whatsapplink: _whatsappController.text,
        itinerary: _itineraryItems
            .map(
              (item) => {
                "day": item["day"]!.text,
                "route": item["route"]!.text,
                "highlights": item["highlights"]!.text,
              },
            )
            .toList(),
        documents: ["Driving License", "Registration Certificate", "Insurance"],
        medical: ["First Aid Kit", "Painkillers", "Bandages"],
      );

      upcomingRides.add(newRide);

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ride Added Successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
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
        title: Text(
          "Add Ride - Step ${_currentStep + 1}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) => setState(() => _currentStep = index),
          children: [
            _buildStep1BasicInfo(),
            _buildStep2Itinerary(),
            _buildStep3Checklist(),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1BasicInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildImageUploadPlaceholder(),
          const SizedBox(height: 20),
          _buildRequiredField("Ride Title", _titleController),
          _buildRequiredField(
            "Category (e.g., Solo, Expedition)",
            _categoryController,
          ),
          Row(
            children: [
              Expanded(child: _buildRequiredField("Distance", _distController)),
              const SizedBox(width: 15),
              Expanded(
                child: _buildRequiredField("Time/Duration", _timeController),
              ),
            ],
          ),
          _buildRequiredField("Full Route Description", _routeController),
          _buildRequiredField("Date", _dateController),
          _buildRequiredField("Bike Required", _bikeController),
          _buildRequiredField("WhatsApp Link", _whatsappController),
          _buildDifficultySelector(),
          _buildRequiredField(
            "Ride Details/Description",
            _detailsController,
            maxLines: 4,
          ),
          const SizedBox(height: 20),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildStep2Itinerary() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Break down your adventure day-by-day",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < _itineraryItems.length; i++)
            _buildItineraryCard(i + 1, _itineraryItems[i]),

          const SizedBox(height: 10),
          _buildAddCircleButton(() {
            setState(() {
              _itineraryItems.add({
                "day": TextEditingController(
                  text: "${_itineraryItems.length + 1}",
                ),
                "route": TextEditingController(),
                "highlights": TextEditingController(),
              });
            });
          }),
          const SizedBox(height: 30),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildStep3Checklist() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Essential items to carry",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < _checklistItems.length; i++)
            _buildChecklistCategoryCard(_checklistItems[i]),

          const SizedBox(height: 10),
          _buildAddCircleButton(() {
            setState(() {
              _checklistItems.add({
                "category": TextEditingController(),
                "items": TextEditingController(),
              });
            });
          }),
          const SizedBox(height: 30),
          _buildFinalSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildRequiredField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            validator: (value) =>
                (value == null || value.isEmpty) ? "Required" : null,
            decoration: InputDecoration(
              fillColor: const Color(0xFF1E1E1E),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifficultySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _diffChip("BEGINNER", Colors.green),
          _diffChip("INTERMEDIATE", Colors.orange),
          _diffChip("ADVANCED", Colors.red),
        ],
      ),
    );
  }

  Widget _diffChip(String label, Color color) {
    bool isSelected = _selectedDifficulty == label;
    return GestureDetector(
      onTap: () => setState(() {
        _selectedDifficulty = label;
        _difficultyColor = color;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildItineraryCard(
    int day,
    Map<String, TextEditingController> ctrls,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5722)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text("Day ", style: TextStyle(color: Colors.white)),
              CircleAvatar(
                radius: 12,
                backgroundColor: const Color(0xFFFF5722),
                child: Text(
                  "$day",
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _buildSmallField("Route (e.g. Manali to Leh)", ctrls["route"]!),
          const SizedBox(height: 15),
          _buildSmallField(
            "Highlights & Stops",
            ctrls["highlights"]!,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistCategoryCard(Map<String, TextEditingController> ctrls) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5722)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Category", style: TextStyle(color: Colors.grey)),
          _buildSmallField("e.g. Spare Parts", ctrls["category"]!),
          const SizedBox(height: 15),
          const Text(
            "Items (comma separated)",
            style: TextStyle(color: Colors.grey),
          ),
          _buildSmallField(
            "Chain lube, cables, etc.",
            ctrls["items"]!,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallField(
    String hint,
    TextEditingController ctrl, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      validator: (value) =>
          (value == null || value.isEmpty) ? "Field cannot be empty" : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: const Color(0xFF1E1E1E),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildAddCircleButton(VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5722)),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.add, color: Colors.white),
    ),
  );

  Widget _buildNextButton() => Align(
    alignment: Alignment.bottomRight,
    child: ElevatedButton(
      onPressed: _validateAndNext,
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF5722)),
      child: const Text("Next", style: TextStyle(color: Colors.white)),
    ),
  );

  Widget _buildFinalSubmitButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: _finalSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF5722),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text(
        "Publish Ride",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );

  Widget _buildImageUploadPlaceholder() => Container(
    height: 160,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFFF5722)),
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xFF1E1E1E),
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.upload_outlined, color: Color(0xFFFF5722), size: 40),
        Text("Upload Cover Photo", style: TextStyle(color: Color(0xFFFF5722))),
      ],
    ),
  );
}
