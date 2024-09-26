import 'package:flutter/material.dart';

Widget feedsPage() {
  return SafeArea(
    child: feedsImages(),
  );
}

// Render feeds images
Widget feedsImages() {
  return SingleChildScrollView(
    clipBehavior: Clip.none,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      child: Column(
        children: [
          Container(
            color: Colors.white54,
            child: Column(
              children: [
                Image.network('https://picsum.photos/500/300.jpg'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image:
                                  NetworkImage('https://picsum.photos/100.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('Mehedi Hassan Emon'),
                      ],
                    ),
                    const Row(
                      children: [Icon(Icons.heart_broken_outlined), Text('97')],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
