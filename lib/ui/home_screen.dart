import 'package:brikoula_client_app/components/custom_drawer.dart';
import 'package:brikoula_client_app/components/medium_artisan_card.dart';
import 'package:brikoula_client_app/components/small_artisan_card.dart';
import 'package:brikoula_client_app/constants/colors.dart';
import 'package:brikoula_client_app/services/theme.dart';
import 'package:brikoula_client_app/ui/demande_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'artisan_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BRIKOULA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Best artisans:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArtisanScreen()),
                        );
                      },
                      child: SmallArtisanCard(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Near you:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: true,
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArtisanScreen()),
                      );
                    },
                    child: MediumArtisanCard(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset('assets/icons/ic_helmet.png'),
        backgroundColor: AppColors.primary,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DemandScreen()),
          );
        },
      ),
    );
  }
}
