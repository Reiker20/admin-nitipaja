import 'package:adminnitipaja/config/palette.dart';
import 'package:flutter/material.dart';
import 'Admin/Admin_screen.dart';
import 'Home/Home_screen.dart';
// import 'Report/Report_screen.dart';
import 'User/User_screen.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  String _selectedMenuItem = 'Home';

  Map<String, Widget> _pageMap = {
    'Home': HomeScreen(),
    'User': UserScreen(),
    // 'Report': ReportScreen(),
    'Admin': AdminScreen(),
  };

  void _selectMenuItem(String item) {
    setState(() {
      _selectedMenuItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.backgroundColor,
        child: Row(
          children: [
            // Logo Website
            Container(
              width: 200,
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/shopper.png',
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  // Sidebar
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Palette.backgroundColor,
                    ),
                    child: Column(
                      children: _pageMap.keys.map((menuItem) {
                        return GestureDetector(
                          onTap: () {
                            _selectMenuItem(menuItem);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.center,
                            color: _selectedMenuItem == menuItem
                                ? Colors.blue
                                : Colors.transparent,
                            child: Text(
                              menuItem,
                              style: TextStyle(
                                color: _selectedMenuItem == menuItem
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inika',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: _pageMap[_selectedMenuItem]!,
            ),
          ],
        ),
      ),
    );
  }
}
