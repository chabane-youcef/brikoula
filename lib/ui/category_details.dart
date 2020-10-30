import 'package:brikoula_client_app/components/custom_drawer.dart';
import 'package:brikoula_client_app/components/result_card.dart';
import 'package:brikoula_client_app/ui/artisan_screen.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Text(
                'Search Results:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                'Plumber',
                style: TextStyle(fontSize: 16),
              )),
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArtisanScreen()),
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
