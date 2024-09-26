import 'package:flutter/material.dart';
import 'package:photo_nest/pages/feeds_page.dart';
import 'package:photo_nest/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  int pageIndex = 0;
  List<Widget> pages = [FeedsPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIndex = idx;
          });
        },
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feed_outlined,
              color: Colors.white,
            ),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face_2_outlined,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
