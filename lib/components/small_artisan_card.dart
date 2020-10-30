import 'package:brikoula_client_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SmallArtisanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          elevation: 3,
          semanticContainer: true,
          margin: EdgeInsets.all(0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://media.istockphoto.com/photos/portrait-of-smiling-handsome-man-in-blue-tshirt-standing-with-crossed-picture-id1045886560?k=6&m=1045886560&s=612x612&w=0&h=hXrxai1QKrfdqWdORI4TZ-M0ceCVakt4o6532vHaS3I='),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    'Chabane youcef',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Flexible(
                  child: Text(
                    'Plumber',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),

                Row(
                  children: [
                    Image.asset('assets/icons/ic_home.png'),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Batna',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Image.asset('assets/icons/ic_time.png'),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'morning',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Image.asset('assets/icons/ic_rating.png'),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '4.5/5',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
