import 'package:brikoula_client_app/components/category_card.dart';
import 'package:brikoula_client_app/components/medium_artisan_card.dart';
import 'package:brikoula_client_app/components/small_artisan_card.dart';
import 'package:brikoula_client_app/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

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
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(19.0),
          child: Container(
            height: 65,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  print('open search');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                                'assets/icons/ic_search${isDarkTheme ? '_dark' : ''}.png'),
                          ),
                          SizedBox(width: 24),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('search-text').tr(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
                'ranked-artisans'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context,index){
                    return SmallArtisanCard();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'category'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context,index){
                    return CategoryCard();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'near-you'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context,index){
                  return  MediumArtisanCard();
                },
              ),


              SizedBox(
                height: 100,
              ),
              Text('language').tr(),
              FlatButton(
                onPressed: () {
                  setState(() {
                    EasyLocalization.of(context).locale = Locale('en', 'US');
                  });
                },
                child: Text('English'),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    EasyLocalization.of(context).locale = Locale('ar', 'DZ');
                  });
                },
                child: Text('عربى'),
              ),
              SizedBox(
                height: 100.0,
              ),
              Text('theme').tr(),
              FlatButton(
                child: Text('Dark theme'),
                onPressed: () => _themeChanger.setTheme(ThemeMode.dark),
              ),
              FlatButton(
                child: Text('light theme'),
                onPressed: () => _themeChanger.setTheme(ThemeMode.light),
              ),
              FlatButton(
                child: Text('system default theme'),
                onPressed: () => _themeChanger.setTheme(ThemeMode.system),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
