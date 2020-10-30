import 'package:brikoula_client_app/components/custom_drawer.dart';
import 'package:brikoula_client_app/components/review_card.dart';
import 'package:brikoula_client_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ArtisanScreen extends StatelessWidget {
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
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://media.istockphoto.com/photos/portrait-of-smiling-handsome-man-in-blue-tshirt-standing-with-crossed-picture-id1045886560?k=6&m=1045886560&s=612x612&w=0&h=hXrxai1QKrfdqWdORI4TZ-M0ceCVakt4o6532vHaS3I='),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chabane youcef',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/ic_home.png'),
                          Text(
                            'ain-yagout - batna',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
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
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
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
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/icons/ic_done_big.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '23 jobs',
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
                            Image.asset('assets/icons/ic_reviews.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '23 jobs',
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
              Text(
                'Personal informations:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: AppColors.primary,
                        ),
                        Column(
                          children: [
                            Image.asset('assets/icons/ic_time_big.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'morning',
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
                            Image.asset('assets/icons/ic_rating_big.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4 / 5',
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
              Text(
                'Reviews:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ReviewCard();
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: AppColors.primary,
                  child: Text(
                    'Hire Artisan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
