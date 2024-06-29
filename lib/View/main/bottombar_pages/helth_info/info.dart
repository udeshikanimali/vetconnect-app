import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/helth_info/tips/dog_tips.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/helth_info/tips/rabbit_tips.dart';

import 'tips/cat_tips.dart';
import 'tips/parrot_tips.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text("Healthcare tips for your pet"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DogTips()));
            },
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.9, // Set the desired width
                height: screenHeight * 0.1, // Set the desired height
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Center(
                    child: Card(
                      elevation: 5,
                      color: Colors.green,
                      // color: Color.fromARGB(255, 213, 218, 208),
                      child: Center(
                        // Center the text within the card
                        child: Text(
                          "Dog",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.015 + 15,
                              fontWeight: FontWeight
                                  .w600), // Customize text style as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CatTips()));
            },
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.9, // Set the desired width
                height: screenHeight * 0.1, // Set the desired height
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Center(
                    child: Card(
                      elevation: 5,
                      color: Colors.blue,
                      //color: Color.fromARGB(255, 176, 231, 113),
                      child: Center(
                        // Center the text within the card
                        child: Text(
                          "Cat",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.015 + 15,
                              fontWeight: FontWeight
                                  .w600), // Customize text style as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RabbitTips()));
            },
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.9, // Set the desired width
                height: screenHeight * 0.1, // Set the desired height
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Center(
                    child: Card(
                      elevation: 5,
                      color: Colors.purple,
                      //color: Color.fromARGB(255, 213, 218, 208),
                      child: Center(
                        // Center the text within the card
                        child: Text(
                          "Rabbit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.015 + 15,
                              fontWeight: FontWeight
                                  .w600), // Customize text style as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ParrotTips()));
            },
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.9, // Set the desired width
                height: screenHeight * 0.1, // Set the desired height
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Center(
                    child: Card(
                      elevation: 5,
                      // color: Colors.white,
                      // color: Color.fromARGB(255, 213, 218, 208),
                      color: Colors.orange,
                      child: Center(
                        // Center the text within the card
                        child: Text(
                          "Parrot",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.015 + 15,
                              fontWeight: FontWeight
                                  .w600), // Customize text style as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
