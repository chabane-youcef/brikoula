import 'package:brikoula_client_app/components/custom_drawer.dart';
import 'package:brikoula_client_app/components/demand_card.dart';
import 'package:brikoula_client_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://www.machinecurve.com/wp-content/uploads/2019/07/thispersondoesnotexist-1-1022x1024.jpg'),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Chabane youcef',
                maxLines: 1,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                elevation: 3,
                semanticContainer: true,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  child: Text(
                    'membre since mars 2016',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 90,
                child: Card(
                  elevation: 3,
                  semanticContainer: true,
                  margin: EdgeInsets.all(0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/icons/ic_phone.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '0697422421',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: AppColors.primary,
                        ),
                        Column(
                          children: [
                            Image.asset('assets/icons/ic_home_big.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Ain yagout',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: AppColors.primary,
                        ),
                        Column(
                          children: [
                            Image.asset('assets/icons/ic_demandes.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '14 demandes',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Previews demands:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      primary: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        DemandCard(name: 'boufar tarek',category: 'plumber',date: '12-12-2019',period: 'morning',status: 'approved',),
                        DemandCard(name: 'boufar tarek',category: 'plumber',date: '12-12-2019',period: 'morning',status: 'refused',),
                        DemandCard(name: 'boufar tarek',category: 'plumber',date: '12-12-2019',period: 'morning',status: 'waiting',),
                        DemandCard(name: 'boufar tarek',category: 'plumber',date: '12-12-2019',period: 'morning',status: 'refused',),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
