import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
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
                width: MediaQuery.of(context).size.width*0.4,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://www.washingtonpost.com/resizer/QJtOkVvaYcxvBs1t5udwcZS8B0o=/arc-anglerfish-washpost-prod-washpost/public/4Q2EYRR2XMI6TMIL6BNCFZ2YMU.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Plumber',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text('25 Artisants',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
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
