import 'package:brikoula_client_app/components/custom_drawer.dart';
import 'package:brikoula_client_app/components/result_card.dart';
import 'package:brikoula_client_app/ui/artisan_screen.dart';
import 'package:flutter/material.dart';

import 'demande_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DemandScreen()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 16),
                            Image.asset(
                                'assets/icons/ic_search${isDarkTheme ? '_dark' : ''}.png'),
                            SizedBox(width: 24),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('Search...'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Search Results:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: true,
                itemCount: 6,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtisanScreen()),
                      );
                    },
                    child: ResultCard(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
