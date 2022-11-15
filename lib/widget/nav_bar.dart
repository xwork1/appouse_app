import 'package:appouse_app/view/anasayfa/anasayfa_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}
// Navigasyon Bar
class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    HomeScreen(),
    Text("Favoriler"),
    Text("Mağaza"),
    Text("Profil"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        
        data: NavigationBarThemeData(
            indicatorColor: Colors.black.withOpacity(0.5)),
        child: NavigationBar(
          backgroundColor: Colors.white,
          animationDuration: const Duration(seconds: 1),
         
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Anasayfa'),
            NavigationDestination(
                icon: Icon(Icons.favorite), label: 'Favoriler'),
            NavigationDestination(icon: Icon(Icons.food_bank), label: 'Mağaza'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
