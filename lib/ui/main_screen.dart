import 'package:brikoula_client_app/constants/colors.dart';
import 'package:brikoula_client_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'category_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage;
  PageController controller;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    controller = PageController(
      initialPage: currentPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          HomeScreen(),
          Screen(title: "near you"),
          Screen(title: "hire artisant"),
          CategoryScreen(),
          Screen(title: "profil"),
        ],
        onPageChanged: (num) {
          print("Current page number is " + num.toString());
          setState(() {
            currentPage = num;
          });
        },
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              topLeft: Radius.circular(35),
            ),
            child: BottomNavigationBar(
              backgroundColor: isDarkTheme
                  ? AppColors.bottomNavBarDarkColor
                  : AppColors.bottomNavBarColor,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                      'assets/icons/ic_explore${isDarkTheme ? '_dark' : ''}.png'),
                  title: Text('discover'),
                  activeIcon:
                  Image.asset('assets/icons/ic_explore_selected.png'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                      'assets/icons/ic_map${isDarkTheme ? '_dark' : ''}.png'),
                  title: Text('Near you'),
                  activeIcon:
                  Image.asset('assets/icons/ic_map_selected.png'),
                ),
                BottomNavigationBarItem(
                  icon: Container(),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                      'assets/icons/ic_category${isDarkTheme ? '_dark' : ''}.png'),
                  title: Text('Categories'),
                  activeIcon:
                  Image.asset('assets/icons/ic_category_selected.png'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                      'assets/icons/ic_profil${isDarkTheme ? '_dark' : ''}.png'),
                  title: Text('profile'),
                  activeIcon:
                  Image.asset('assets/icons/ic_profil_selected.png'),
                ),
              ],
              currentIndex: currentPage,
              onTap: (index) {
                setState(() {
                  print('current tab : $index');
                  currentPage = index;
                  controller.animateToPage(index,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: FloatingActionButton(
                  foregroundColor: AppColors.accent,
                  onPressed: () {
                    currentPage = 2;
                    controller.animateToPage(2,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  child: ImageIcon(
                    AssetImage("assets/icons/ic_helmet.png"),
                      color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen extends StatelessWidget {
  String title;

  Screen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title),
      ),
    );
  }
}

