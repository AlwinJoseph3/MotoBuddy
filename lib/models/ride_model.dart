import 'package:flutter/material.dart';

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

final List<Ride> upcomingRides = [
  Ride(
    title: "Leh-Ladakh",
    category: "Mountains",
    route: "Manali - Leh - Nubra Valley",
    details:
        "Experience the breathtaking landscapes of Leh-Ladakh on this adventurous ride. Navigate through high-altitude passes, serene valleys, and vibrant local cultures.",
    date: "Feb 15 - Feb 23, 2026",
    bike: "RE Himalayan 400",
    riders: 8,
    difficulty: "ADVANCED",
    distance: "585 km",
    time: "13hr 57m",
    imagePath: "assets/leh.jpg",
    difficultyColor: const Color(0xFFB71C1C),
    documents: [
      "Inner Line Permit",
      "Driving Licence",
      "RC",
      "Passport Photos",
    ],
    medical: ["Potable Oxygen Cylinder", "Hydration Pack", "Medicines"],
    itinerary: [
      {
        "day": "1",
        "route": "Manali to Jispa",
        "highlights": "Atal Tunnel, Sissu",
      },
      {"day": "2", "route": "Jispa to Sarchu", "highlights": "Baralacha La"},
      {"day": "3", "route": "Sarchu to Leh", "highlights": "Gata Loops"},
    ],
  ),
  Ride(
    title: "Goa Coastal Ride",
    category: "Coastal",
    route: "Panaji - Anjuna - Palolem",
    details:
        "Enjoy the scenic coastal roads of Goa with this relaxed ride. Explore beautiful beaches, vibrant nightlife, and delicious local cuisine along the way.",
    date: "Feb 20 - Feb 23, 2026",
    bike: "RE Classic 350 Reborn",
    riders: 4,
    distance: "108 km",
    time: "3hr 27m",
    difficulty: "BEGINNER",
    imagePath: "assets/Goa.jpg",
    difficultyColor: const Color(0xFF2E7D32),
    documents: ["Inner Line Permit", "Driving Licence", "RC", "Insurance"],
    medical: ["Potable Oxygen Cylinder", "Hydration Pack", "Medicines"],
    itinerary: [
      {"day": "1", "route": "Panaji Arrival", "highlights": "Old Goa Churches"},
      {"day": "2", "route": "North Goa", "highlights": "Anjuna Beach"},
      {"day": "3", "route": "South Goa", "highlights": "Palolem Beach"},
    ],
  ),
  Ride(
    title: "Spiti Valley Expedition",
    category: "Mountains",
    route: "Shimla - Kaza - Chandratal",
    details:
        "Known as the 'Middle Land', Spiti offers a moon-like landscape. This ride is for those who love isolation and raw mountain beauty.",
    date: "June 10 - June 18, 2026",
    bike: "KTM Adventure 390",
    riders: 6,
    distance: "450 km",
    time: "18hr 30m",
    difficulty: "ADVANCED",
    imagePath: "assets/Spiti.jpg",
    difficultyColor: const Color(0xFFB71C1C),
    documents: ["Inner Line Permit", "Driving Licence", "RC"],
    medical: ["Oxygen Cylinder", "AMS Meds", "Hydration Pack"],
    itinerary: [
      {
        "day": "1",
        "route": "Shimla to Reckong Peo",
        "highlights": "Kinnaur Valley",
      },
      {
        "day": "2",
        "route": "Reckong Peo to Kaza",
        "highlights": "Khab Confluence",
      },
      {
        "day": "3",
        "route": "Kaza Local",
        "highlights": "Key Monastery, Hikkim",
      },
    ],
  ),

  Ride(
    title: "Pondicherry Cruise",
    category: "Coastal",
    route: "Chennai - Pondicherry",
    details:
        "A beautiful ride along the East Coast Road (ECR). Perfect for a weekend getaway with French vibes and sea breezes.",
    date: "Mar 5 - Mar 6, 2026",
    bike: "RE Meteor 350",
    riders: 12,
    distance: "155 km",
    time: "3hr 15m",
    difficulty: "BEGINNER",
    imagePath: "assets/Pondicherry.jpg",
    difficultyColor: const Color(0xFF2E7D32),
    documents: ["Driving Licence", "RC", "Insurance"],
    medical: ["First Aid Kit", "Sunscreen"],
    itinerary: [
      {
        "day": "1",
        "route": "Chennai to Pondicherry",
        "highlights": "Mahabalipuram",
      },
      {
        "day": "2",
        "route": "Pondicherry Local",
        "highlights": "Rock Beach, Auroville",
      },
    ],
  ),

  Ride(
    title: "Zanskar Off-road",
    category: "Mountains",
    route: "Kargil - Padum - Shinku La",
    details:
        "The ultimate off-roading challenge. Cross the newly opened Shinku La pass and witness the majestic Gumbo Ranjan.",
    date: "July 20 - July 28, 2026",
    bike: "RE Himalayan 450",
    riders: 5,
    distance: "480 km",
    time: "22hr 00m",
    difficulty: "ADVANCED",
    imagePath: "assets/zanskar.jpg",
    difficultyColor: const Color(0xFFB71C1C),
    documents: ["ILP", "Driving Licence", "RC"],
    medical: ["Oxygen Cylinder", "Satellite Phone (Group)"],
    itinerary: [
      {"day": "1", "route": "Kargil to Padum", "highlights": "Penzila Pass"},
      {"day": "2", "route": "Padum to Shinku La", "highlights": "Gumbo Ranjan"},
    ],
  ),

  Ride(
    title: "Rann of Kutch",
    category: "Off-road",
    route: "Bhuj - Dhordo - Dholavira",
    details:
        "Ride across the white salt desert. Best experienced during a full moon night for a surreal landscape view.",
    date: "Dec 12 - Dec 15, 2026",
    bike: "Suzuki V-Strom 250",
    riders: 10,
    distance: "320 km",
    time: "6hr 45m",
    difficulty: "INTERMEDIATE",
    imagePath: "assets/Rann.jpg",
    difficultyColor: const Color(0xFFF9A825),
    documents: ["Border Permit", "Driving Licence", "RC"],
    medical: ["Hydration Pack", "Electrolytes"],
    itinerary: [
      {
        "day": "1",
        "route": "Bhuj to Dhordo",
        "highlights": "White Desert Sunset",
      },
      {
        "day": "2",
        "route": "Dhordo to Dholavira",
        "highlights": "Road to Heaven",
      },
    ],
  ),

  Ride(
    title: "Western Ghats Trail",
    category: "Mountains",
    route: "Chikmagalur - Mullayanagiri",
    details:
        "Lush green coffee estates and misty peaks. A twisty paradise for riders who love cornering.",
    date: "Sept 15 - Sept 17, 2026",
    bike: "RE Classic 350 Reborn",
    riders: 15,
    distance: "210 km",
    time: "5hr 30m",
    difficulty: "INTERMEDIATE",
    imagePath: "assets/ghats.jpg",
    difficultyColor: const Color(0xFFF9A825),
    documents: ["Driving Licence", "RC"],
    medical: ["Antiseptic Cream", "Rain Gear"],
    itinerary: [
      {
        "day": "1",
        "route": "Chikmagalur Upkeep",
        "highlights": "Mullayanagiri Peak",
      },
      {
        "day": "2",
        "route": "Baba Budangiri",
        "highlights": "Coffee Plantation Tour",
      },
    ],
  ),

  Ride(
    title: "Munnar Tea Trails",
    category: "Mountains",
    route: "Kochi - Munnar - Top Station",
    details:
        "Ride through the clouds and sprawling tea gardens of Kerala. Expect sharp hairpins and low visibility.",
    date: "Oct 5 - Oct 7, 2026",
    bike: "RE Hunter 350",
    riders: 8,
    distance: "180 km",
    time: "4hr 50m",
    difficulty: "INTERMEDIATE",
    imagePath: "assets/munnar.jpg",
    difficultyColor: const Color(0xFFF9A825),
    documents: ["Driving Licence", "RC"],
    medical: ["First Aid Kit", "Warm Layers"],
    itinerary: [
      {
        "day": "1",
        "route": "Kochi to Munnar",
        "highlights": "Valara Waterfalls",
      },
      {
        "day": "2",
        "route": "Munnar to Top Station",
        "highlights": "Matupetty Dam",
      },
    ],
  ),

  Ride(
    title: "Varkala Cliff Run",
    category: "Coastal",
    route: "Kochi - Alleppey - Varkala",
    details:
        "A laid-back ride along the Arabian Sea. Visit the famous Varkala cliffs and enjoy the beach culture.",
    date: "Nov 20 - Nov 22, 2026",
    bike: "RE Meteor 350",
    riders: 7,
    distance: "170 km",
    time: "4hr 10m",
    difficulty: "BEGINNER",
    imagePath: "assets/Varkala.jpg",
    difficultyColor: const Color(0xFF2E7D32),
    documents: ["Driving Licence", "RC"],
    medical: ["Hydration Pack", "Sunscreen"],
    itinerary: [
      {
        "day": "1",
        "route": "Kochi to Alleppey",
        "highlights": "Backwater View",
      },
      {
        "day": "2",
        "route": "Alleppey to Varkala",
        "highlights": "Papanasam Beach",
      },
    ],
  ),

  Ride(
    title: "Sach Pass Challenge",
    category: "Mountains",
    route: "Chamba - Sach Pass - Killar",
    details:
        "One of the most dangerous and treacherous passes in India. Only for highly experienced mountain riders.",
    date: "Aug 1 - Aug 5, 2026",
    bike: "RE Himalayan 411",
    riders: 4,
    distance: "340 km",
    time: "15hr 45m",
    difficulty: "ADVANCED",
    imagePath: "assets/sach.jpg",
    difficultyColor: const Color(0xFFB71C1C),
    documents: ["Driving Licence", "RC", "Permit"],
    medical: ["Full Trauma Kit", "Oxygen"],
    itinerary: [
      {
        "day": "1",
        "route": "Chamba to Bairagarh",
        "highlights": "Chamba Valley",
      },
      {
        "day": "2",
        "route": "Bairagarh to Killar",
        "highlights": "Sach Pass Summit",
      },
    ],
  ),

  Ride(
    title: "Dhanushkodi Ghost Town",
    category: "Coastal",
    route: "Madurai - Rameshwaram",
    details:
        "Ride to the tip of India where the two oceans meet. A historic and spiritual journey across the Pamban Bridge.",
    date: "Jan 10 - Jan 12, 2026",
    bike: "Jawa Perak",
    riders: 9,
    distance: "190 km",
    time: "4hr 00m",
    difficulty: "BEGINNER",
    imagePath: "assets/Dhanushkodi.jpg",
    difficultyColor: const Color(0xFF2E7D32),
    documents: ["Driving Licence", "RC"],
    medical: ["First Aid", "Water"],
    itinerary: [
      {
        "day": "1",
        "route": "Madurai to Rameshwaram",
        "highlights": "Pamban Bridge",
      },
      {"day": "2", "route": "Dhanushkodi End", "highlights": "Ram Setu Point"},
    ],
  ),

  Ride(
    title: "Tawang Monastery Run",
    category: "Mountains",
    route: "Guwahati - Dirang - Tawang",
    details:
        "Ride through Sela Pass at 13,700ft. Experience the serene monasteries and frozen lakes of Arunachal Pradesh.",
    date: "Nov 5 - Nov 12, 2026",
    bike: "RE Scram 411",
    riders: 6,
    distance: "510 km",
    time: "16hr 30m",
    difficulty: "ADVANCED",
    imagePath: "assets/Tawang.jpg",
    difficultyColor: const Color(0xFFB71C1C),
    documents: ["Inner Line Permit", "Driving Licence", "RC"],
    medical: ["AMS Meds", "Cold Weather Gear"],
    itinerary: [
      {
        "day": "1",
        "route": "Guwahati to Bhalukpong",
        "highlights": "Entry Point",
      },
      {
        "day": "2",
        "route": "Bhalukpong to Dirang",
        "highlights": "Apple Orchards",
      },
      {"day": "3", "route": "Dirang to Tawang", "highlights": "Sela Pass"},
    ],
  ),
];
