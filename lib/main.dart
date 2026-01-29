import 'package:flutter/material.dart';
import 'home_page.dart';
import 'advice_page.dart';
import 'addride.dart';

void main() => runApp(const MotoBuddyApp());

class MotoBuddyApp extends StatelessWidget {
  const MotoBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MotoBuddy',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFFD6B22),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFD6B22),
          secondary: Color(0xFFFD6B22),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [const HomePage(), const AdvicePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRideFlow()),
          );
        },
        backgroundColor: const Color(0xFFFD6B22),
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1A1A1A),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setState(() => _currentIndex = 0),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: _currentIndex == 0
                          ? const Color(0xFFFD6B22)
                          : Colors.grey,
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: _currentIndex == 0
                            ? const Color(0xFFFD6B22)
                            : Colors.grey,
                        fontSize: 12,
                        fontWeight: _currentIndex == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),
              GestureDetector(
                onTap: () => setState(() => _currentIndex = 1),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: _currentIndex == 1
                          ? const Color(0xFFFD6B22)
                          : Colors.grey,
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Advice",
                      style: TextStyle(
                        color: _currentIndex == 1
                            ? const Color(0xFFFD6B22)
                            : Colors.grey,
                        fontSize: 12,
                        fontWeight: _currentIndex == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
