import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/constants.dart';
import 'package:mar/sccreens/analysisNotes.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'analysisNotes.dart';
import 'infoAnalysis.dart';
import 'knowAnalysis.dart';
import 'login_screen.dart';

class AnalysisResult extends StatefulWidget {
  @override
  _AnalysisResultState createState() => _AnalysisResultState();
}

class _AnalysisResultState extends State<AnalysisResult> {
  int _bottomBarIndex = 0;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )*/
        ],
        title: Text("Show Analysis Result", style: TextStyle(fontFamily: 'Pacifico'),),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Test Results",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
          ),

        ),
        Divider(
          color: kSecondaryColor,
          height: 20,
          endIndent: 100,
          indent: 100,
          thickness: 2.5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text( 
                  "Glucos",
                  textScaleFactor: 1.5,
                ),
                Text("172", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Read Cells", textScaleFactor: 1.5),
                Text("6.3", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Voluem", textScaleFactor: 1.5),
                Text("200ml", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                      Icons.thumb_up
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Byctriec", textScaleFactor: 1.5),
                Text("Null", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text(
                  "Glucos",
                  textScaleFactor: 1.5,
                ),
                Text("172", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Read Cells", textScaleFactor: 1.5),
                Text("6.3", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Voluem", textScaleFactor: 1.5),
                Text("200ml", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),

            ],
          ),
        ),
        Divider(
          color: kSecondaryColor,
          height: 40,
          endIndent: 40,
          indent: 40,
          thickness: 2.5,
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.volume_up,color: kMainColor,size: 40,),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.event_note,color: kMainColor,size: 30,),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notes()));
              },
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("Read Analysis",style: TextStyle(color: kSecondaryColor),),
            new Text("Notes      ",style: TextStyle(color: kSecondaryColor),)
          ],
        ),

      ]
      ),

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
          setState(() {
            _bottomBarIndex = value;
          });
          if (value == 1) {
            Navigator.pushNamed(context, Information.id);
          }
          setState(() {
            _bottomBarIndex = value;
          });
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
