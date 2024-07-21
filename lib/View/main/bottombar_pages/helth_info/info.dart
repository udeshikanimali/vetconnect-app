import 'package:flutter/material.dart';
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
        title: const Text(
          "Healthcare Tips for Your Pet",
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.green],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              _buildCustomCard(
                context,
                screenWidth,
                screenHeight,
                "Dog",
                'assets/images/dog.jpg', // Replace with your asset path
                DogTips(),
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildCustomCard(
                context,
                screenWidth,
                screenHeight,
                "Cat",
                'assets/images/cat.jpg', // Replace with your asset path
                CatTips(),
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildCustomCard(
                context,
                screenWidth,
                screenHeight,
                "Rabbit",
                'assets/images/rabbit.jpg', // Replace with your asset path
                RabbitTips(),
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildCustomCard(
                context,
                screenWidth,
                screenHeight,
                "Parrot",
                'assets/images/parrot.jpg', // Replace with your asset path
                ParrotTips(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCard(
    BuildContext context,
    double screenWidth,
    double screenHeight,
    String title,
    String imagePath,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Center(
        child: Container(
          width: screenWidth * 0.9, // Set the desired width
          height: screenHeight * 0.15, // Set the desired height
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.015 + 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black54,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
