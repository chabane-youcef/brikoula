import 'package:flutter/material.dart';

class DemandCard extends StatelessWidget {
  String name, category, date, status, period;
  DemandCard({
    this.name,
    this.category,
    this.date,
    this.status,
    this.period,
  });

  demandStatus(status) {
    if (status == 'approved') {
      return Image.asset('assets/icons/ic_done.png');
    } else if (status == 'refused') {
      return Image.asset('assets/icons/ic_refused.png');
    } else {
      return Image.asset('assets/icons/ic_waiting.png');
    }
  }

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/ic_calander.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(date),
                      ],
                    ),
                    Row(
                      children: [
                        demandStatus(status),
                        SizedBox(
                          width: 5,
                        ),
                        Text(status),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/ic_time.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text('morning'),
                      ],
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
