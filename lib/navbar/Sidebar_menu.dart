import 'package:adminnitipaja/screens/Admin/Admin_screen.dart';
import 'package:adminnitipaja/screens/Report/Report_screen.dart';
import 'package:adminnitipaja/screens/User/User_screen.dart';
import 'package:adminnitipaja/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/buidnavbar.dart';
import 'package:flutter/cupertino.dart';
import '../config/palette.dart';
import '../screens/Home/Home_screen.dart';
import '../screens/Admin/Admin_screen.dart';
import '../screens/Report/Report_screen.dart';
import '../screens/User/User_screen.dart';

class SidebarMenu extends StatelessWidget {
  SidebarMenu({Key? key});

  BuildNavBarController _navBarController = BuildNavBarController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Palette.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Text(
              'Sidebar Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            decoration: BoxDecoration(
              color: Palette.backgroundColor,
            ),
          ),
          SidebarMenuItem(
            icon: Icons.home,
            title: 'Home',
            index: 0,
          ),
          SidebarMenuItem(
            icon: Icons.assignment_rounded,
            title: 'History',
            index: 1,
          ),
          SidebarMenuItem(
            icon: CupertinoIcons.chat_bubble_2_fill,
            title: 'Chat',
            index: 2,
          ),
          SidebarMenuItem(
            icon: Icons.person,
            title: 'Profile',
            index: 3,
          ),
        ],
      ),
    );
  }
}

class SidebarMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;

  SidebarMenuItem({
    required this.icon,
    required this.title,
    required this.index,
  });

  BuildNavBarController _navBarController = BuildNavBarController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: _navBarController.nav == index
            ? Palette.activeColor
            : Palette.TextColor2,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: _navBarController.nav == index
              ? Palette.activeColor
              : Palette.TextColor2,
        ),
      ),
      onTap: () {
        _navBarController.nav.value = index;
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key});

  BuildNavBarController _navBarController = BuildNavBarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Row(
        children: [
          SidebarMenu(),
          Expanded(
            child: Obx(() => _navBarController.nav.value == 0
                ? HomeScreen()
                : _navBarController.nav.value == 1
                    ? UserScreen()
                    : _navBarController.nav.value == 2
                        ? ReportScreen()
                        : AdminScreen()),
          ),
        ],
      ),
    );
  }
}
