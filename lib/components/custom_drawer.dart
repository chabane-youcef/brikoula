import 'package:brikoula_client_app/constants/colors.dart';
import 'package:brikoula_client_app/services/theme.dart';
import 'package:brikoula_client_app/ui/category_screen.dart';
import 'package:brikoula_client_app/ui/home_screen.dart';
import 'package:brikoula_client_app/ui/login_screen.dart';
import 'package:brikoula_client_app/ui/nearest_screen.dart';
import 'package:brikoula_client_app/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
              child: Text(
                'Brikoula'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://www.machinecurve.com/wp-content/uploads/2019/07/thispersondoesnotexist-1-1022x1024.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chabane Youcef',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 75,
          ),
          Container(
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      isDarkTheme
                          ? Image.asset('assets/icons/ic_search_dark.png')
                          : Image.asset('assets/icons/ic_search.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Discover',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      isDarkTheme
                          ? Image.asset('assets/icons/ic_category_dark.png')
                          : Image.asset('assets/icons/ic_category.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NearestScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      isDarkTheme
                          ? Image.asset('assets/icons/ic_map_dark.png')
                          : Image.asset('assets/icons/ic_map.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Near you',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      isDarkTheme
                          ? Image.asset('assets/icons/ic_profil_dark.png')
                          : Image.asset('assets/icons/ic_profil.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
                InkWell(
                  onTap: () {
                    isDarkTheme
                        ? _themeChanger.setTheme(ThemeMode.light)
                        : _themeChanger.setTheme(ThemeMode.dark);
                  },
                  child: Row(
                    children: [
                      isDarkTheme
                          ? Image.asset('assets/icons/ic_mode_dark.png')
                          : Image.asset('assets/icons/ic_mode.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Night Mode',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      isDarkTheme
                          ? Image.asset('assets/icons/ic_logout_dark.png')
                          : Image.asset('assets/icons/ic_logout.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}