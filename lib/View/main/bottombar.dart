import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/add_new/add_new.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/helth_info/info.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/helth_info/vet_clinics.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/location/map.dart';
import 'package:vetconnect_app/View/main/bottombar_pages/profile/profile.dart';

import 'bottombar_pages/home/home.dart';

class BottomBar extends StatefulWidget {
  final int? selectedTab;
  final Widget? selectedScreen;
  const BottomBar({super.key, this.selectedTab, this.selectedScreen});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home();

  @override
  void initState() {
    currentTab = widget.selectedTab ?? 0;
    currentScreen = widget.selectedScreen ?? const Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: screenWidth * 0.03,
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
        ),
        height: MediaQuery.of(context).size.shortestSide >= 600
            ? screenWidth * 0.12
            : screenWidth * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildNavItem(
              icon: Icons.home,
              label: "home",
              index: 0,
              screen: const Home(),
            ),
            buildNavItem(
              icon: Icons.location_city,
              label: "location",
              index: 1,
              screen: const MapPage(),
            ),
            FloatingActionButton(
              elevation: 0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNew()),
                );
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add,
                color: Colors.green,
              ),
            ),

            buildNavItem(
              icon: Icons.book,
              label: "Vet Clinics",
              index: 2,
              screen: const ClinicsList(),
            ),
            buildNavItem(
              icon: Icons.person,
              label: "profile",
              index: 3,
              screen: const Profile(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required Widget screen,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.19,
      decoration: BoxDecoration(
        color: currentTab == index ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        minWidth: 10,
        onPressed: () {
          setState(() {
            currentScreen = screen;
            currentTab = index;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: currentTab == index ? Colors.white : Colors.black26,
              size: MediaQuery.of(context).size.shortestSide >= 600
                  ? screenWidth * 0.06
                  : screenWidth * .08,
            ),
            FittedBox(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: screenWidth * 0.01 + 7,
                  color:
                      currentTab == index ? Colors.white : HexColor("#898989"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
