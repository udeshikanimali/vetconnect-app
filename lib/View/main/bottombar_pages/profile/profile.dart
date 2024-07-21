import 'package:flutter/material.dart';
import 'package:vetconnect_app/View/auth/signin.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userEmail = "user@example.com"; // Replace with your user's email
  String profileImageUrl =
      "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg"; // Replace with your profile image URL

  void _logout() {
    // Implement your logout logic here
    print("User logged out");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              userEmail,
              style: TextStyle(
                  fontSize: screenWidth * 0.015 + 12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.05),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: screenHeight * 0.005),
            buildListTile(
              icon: Icons.settings,
              text: 'Theme Settings',
              onTap: () {
                // Implement theme settings logic
              },
            ),
            SizedBox(height: screenHeight * 0.005),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: screenHeight * 0.005),
            buildListTile(
              icon: Icons.book,
              text: 'Bookings',
              onTap: (){},
            ),
            SizedBox(height: screenHeight * 0.005),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: screenHeight * 0.005),
            buildListTile(
              icon: Icons.logout,
              text: 'Logout',
              onTap: _logout,
            ),
            SizedBox(height: screenHeight * 0.005),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: screenHeight * 0.005),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(
        text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.015 + 12,
          color: Colors.green,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
