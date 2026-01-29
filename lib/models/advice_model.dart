class AdvicePost {
  final String title;
  final List<String> tips;
  final String author;

  AdvicePost({required this.title, required this.tips, required this.author});
}

// Data exactly as shown in your Figma/Screenshot
final List<AdvicePost> expertAdviceList = [
  AdvicePost(
    title: "Essential Tips for Manali-Leh",
    tips: [
      "Rest in Leh for at least two full days before heading to higher altitudes.",
      "Carry 5-10 liters of extra fuel in high-quality cans, as there are no pumps after Karu/Nyoma.",
      "Carry the original Inner Line Permit (ILP) and at least 5 physical copies for various checkpoints.",
    ],
    author: "Rahul V.K",
  ),
  AdvicePost(
    title: "Munnar Ride Tips",
    tips: [
      "Expect a significant drop in temperature as you ascend; carry a light thermal layer even if it feels warm at the base.",
      "Check your tire pressure and tread; the roads can be damp or covered in moss in shaded plantation areas.",
      "Use your horn before blind curves and keep your low-beam on at all times to remain visible.",
    ],
    author: "Ali Ahmed",
  ),
  AdvicePost(
    title: "Some tips for your next Goa Ride",
    tips: [
      "Ensure your bike is serviced for coastal humidity.",
      "Pack light and breathable riding gear.",
      "Check chain lubrication frequently due to salt in the air.",
    ],
    author: "Rohan S.",
  ),
];
