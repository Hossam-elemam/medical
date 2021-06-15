import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Components/mydrawer.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/sccreens/knowAnalysis.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'infoAnalysis.dart';
import 'login_screen.dart';

class About extends StatefulWidget {
  static String id='About';
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  int _bottomBarIndex = 0;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: <Widget>[
          FlatButton(
            child: CircleAvatar(
              child: Image(
                image: AssetImage('images/icons/medical.png'),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: ()
            {
              Navigator.pushNamed(context, Scan.id);
            },
          ),
        ],
        title: Text("About Us", style: TextStyle(fontFamily: 'Pacifico',),),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 0, top: 30, right: 30, left: 30),
            child: Center(
              child: Text(
                "M.A.R",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Divider(
            color: kMainColor,
            endIndent: 150,
            height: 50,
            indent: 150,
            thickness: 2,
          ),
          Container(
            padding: EdgeInsets.only(top: 0, left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //child: Text(" M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company.",
      //style: TextStyle(fontSize: 25,),

      //padding: EdgeInsets.all(20.0),
      //Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: kUnActiveColor,
        currentIndex: _bottomBarIndex,
        fixedColor: kMainColor,
        onTap: (value) async {
          if (value == 3) {
            SharedPreferences pref =
            await SharedPreferences.getInstance();
            pref.clear();
            await _auth.signOut();
            Navigator.popAndPushNamed(context, LoginScreen.id);
          }
          if (value == 1) {
            Navigator.pushNamed(context, Information.id);
          }
          if (value == 2) {
            Navigator.pushNamed(context, Know.id);
          }
          if (value == 0) {
            Navigator.pushNamed(context, Scan.id);
          }
          setState(() {
            _bottomBarIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
            ),
            title: Text('Scan'),
            backgroundColor: kMainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_device_information,
            ),
            title: Text('Information'),
            backgroundColor: kMainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.open_in_new_outlined,
            ),
            title: Text('Know analysis'),
            backgroundColor: kMainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
            ),
            title: Text('LogOf'),
            backgroundColor: kMainColor,
          ),
        ],
      ),
    );
  }
}
