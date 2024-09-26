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
  List<Widget> pages = [feedsPage(), profilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          pageIndex == 1 ? 'Mehedi Hassan' : 'PhotoNext',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16)
        ],
      ),
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
              Icons.person_4_outlined,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
