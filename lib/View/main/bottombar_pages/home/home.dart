import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> postImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLaEz1umQ0lccKNYw_aIHzHmyMUa55zHuXug&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFr8Lnr-u7vAb3sFOtonW3zfgQJ721gIjQfA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNG70EzrcPV6VrENssNJt1C26-Mv7OrGc80Q&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL47sZ4diGU-yL0WzgbKprySYOGw-9xPVLgg&s",
    // Add more image URLs as needed
  ];

  final List<String> captions = [
    "Beautiful scenery!",
    "Pet show moment!",
    "Cute puppy!",
    "Adventures with my pet!",
    // Add more captions as needed
  ];

  final List<String> owners = [
    "Tommy's Owner",
    "Lucy's Owner",
    "Max's Owner",
    "Bella's Owner",
    // Add more owners as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Adjust color as needed
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: postImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Network Image
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                        image: NetworkImage(postImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Post Caption
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 8),
                    child: Text(
                      captions[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  // Owner Info and Interaction Buttons
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          owners[index], // Display owner for this post
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {
                                // Handle like button press
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.comment),
                              onPressed: () {
                                // Handle comment button press
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                // Handle share button press
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
