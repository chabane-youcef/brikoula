import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 3,
          semanticContainer: true,
          margin: EdgeInsets.all(0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://media.istockphoto.com/photos/portrait-of-smiling-handsome-man-in-blue-tshirt-standing-with-crossed-picture-id1045886560?k=6&m=1045886560&s=612x612&w=0&h=hXrxai1QKrfdqWdORI4TZ-M0ceCVakt4o6532vHaS3I="),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chabane youcef',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/ic_done.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '25 jobs',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/ic_rating.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4/5',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/ic_time.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'morning',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
