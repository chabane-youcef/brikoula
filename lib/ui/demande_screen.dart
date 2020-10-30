import 'package:brikoula_client_app/components/custom_drawer.dart';
import 'package:brikoula_client_app/constants/colors.dart';
import 'package:brikoula_client_app/ui/search_screen.dart';
import 'package:flutter/material.dart';

class DemandScreen extends StatefulWidget {
  @override
  _DemandScreenState createState() => _DemandScreenState();
}

class _DemandScreenState extends State<DemandScreen> {
  String dropdownValue,regionValue,ratingValue,periodValue;
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
              SizedBox(height: 25,),
              Text('Category:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Card(
                elevation: 3,
                semanticContainer: true,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('select category'),
                    isExpanded: true,
                    value: dropdownValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Electrician', 'Plumber', 'Builder']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text('Period:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Card(
                elevation: 3,
                semanticContainer: true,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('select time period'),
                    isExpanded: true,
                    value: periodValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        periodValue = newValue;
                      });
                    },
                    items: <String>['morning', 'evening']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text('Region:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Card(
                elevation: 3,
                semanticContainer: true,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('select region'),
                    isExpanded: true,
                    value: regionValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        regionValue = newValue;
                      });
                    },
                    items: <String>['	Adrar', 'Chlef', 'Laghouat','Oum El Bouaghi','Batna','Béjaïa']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text('Rating:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Card(
                elevation: 3,
                semanticContainer: true,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('select rating'),
                    isExpanded: true,
                    value: ratingValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        ratingValue = newValue;
                      });
                    },
                    items: <String>['1 star', '2 stars', '3 stars','4 stars','5 stars']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: AppColors.primary,
                  child: Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
