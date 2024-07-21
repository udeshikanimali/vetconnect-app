import 'package:flutter/material.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/helth_info/tips/dog_tips.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/helth_info/tips/rabbit_tips.dart';
import 'tips/cat_tips.dart';
import 'tips/parrot_tips.dart';

class ClinicsList extends StatefulWidget {
  const ClinicsList({super.key});

  @override
  State<ClinicsList> createState() => _ClinicsListState();
}

class _ClinicsListState extends State<ClinicsList> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Veterinary Clinics",
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Info()),
              );
            },
          )
        ],
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
          ListView(
            children: [
              _buildClinicCard(
                context,
                screenWidth,
                screenHeight,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNM-krkYkJg5imig5K9nAO5Y8lKz4hGu2ytw&s",
                "Happy Paws Veterinary Clinic",
                "Dr. John Doe",
                "123 Pet Street, Pet City",
                "012-345-6789",
                "Mon - Fri: 9am - 6pm",
              ),
              _buildClinicCard(
                context,
                screenWidth,
                screenHeight,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJfoQyog3thxddP7CwPem1389pVpCGaMo3Sw&s",
                "Pet Health Clinic",
                "Dr. Jane Smith",
                "456 Animal Avenue, Pet Town",
                "987-654-3210",
                "Mon - Sat: 8am - 5pm",
              ),
              _buildClinicCard(
                context,
                screenWidth,
                screenHeight,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZXJqik8BvibuuwMUQyPBWP2P3IUW8-rZu-Q&s",
                "Animal Care Clinic",
                "Dr. Emily Clark",
                "789 Pet Lane, Pet Village",
                "555-678-1234",
                "Mon - Sun: 7am - 7pm",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClinicCard(
    BuildContext context,
    double screenWidth,
    double screenHeight,
    String imagePath,
    String clinicName,
    String doctorName,
    String address,
    String contact,
    String availableTime,
  ) {
    return Center(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.27,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              child: Image.network(
                imagePath,
                width: screenWidth * 0.35,
                height: screenHeight * 0.27,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clinicName,
                      style: TextStyle(
                        fontSize: screenWidth * 0.015 + 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Doctor: $doctorName",
                      style: TextStyle(
                        fontSize: screenWidth * 0.012 + 8,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Address: $address",
                      style: TextStyle(
                        fontSize: screenWidth * 0.012 + 8,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Contact: $contact",
                      style: TextStyle(
                        fontSize: screenWidth * 0.012 + 8,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Available Time: $availableTime",
                      style: TextStyle(
                        fontSize: screenWidth * 0.012 + 8,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add booking functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child:  Text("Book Appointment",style: TextStyle(
                        fontSize: screenWidth * 0.012 + 8,
                        fontFamily: 'Roboto',
                      ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key});

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
                'assets/images/dog.jpg',
                const DogTips(),
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildCustomCard(
                context,
                screenWidth,
                screenHeight,
                "Cat",
                'assets/images/cat.jpg',
                const CatTips(),
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildCustomCard(
                context,
                screenWidth,
                screenHeight,
                "Rabbit",
                'assets/images/rabbit.jpg',
                const RabbitTips(),
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildCustomCard(
                context,
                screenWidth,
                screenHeight,
                "Parrot",
                'assets/images/parrot.jpg',
                const ParrotTips(),
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
          width: screenWidth * 0.9,
          height: screenHeight * 0.15,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: const Offset(0, 5),
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
                shadows: const [
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
