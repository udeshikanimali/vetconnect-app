import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Adjust color as needed
       automaticallyImplyLeading: false, 
        leading: null,
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
        itemCount: 20, 
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.02,right:screenWidth*0.02,top: screenHeight*0.01),
            child: Container(
              height: 200,
              color: Colors.grey[300], 
              child: Center(
                child: Text(
                  'Feed Item $index',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
