import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/sccreens/login_screen.dart';
import 'package:mar/sccreens/loginpage.dart';
import '../constants.dart';
import 'mybutton.dart';
class SliderIntro extends StatefulWidget {
  static String id = 'SliderIntro';
  @override
  _SliderIntroState createState() => _SliderIntroState();
}

class _SliderIntroState extends State<SliderIntro> {
  int currentpage = 0;

  List listintro = [
    {
      "text": "Welcome to M.A.R, Let's Scanning!",
      "image": "images/image/02.png",
    },
    {
      "text": "Welcome to M.A.R, Let's Scanning!",
      "image": "images/image/03.png",
    },
    {
      "text": "Welcome to M.A.R, Let's Scanning!",
      "image": "images/image/05.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (val) {
                    setState(() {
                      currentpage = val;
                    });
                  },
                  itemCount: listintro.length,
                  itemBuilder: (context, i) {
                    return TextAndImage(list: listintro[i], mdw: mdw);
                  },
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(listintro.length,
                            (index) => buildcontrolpageview(index)),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  MyButton(
                    title: "Let's Start",
                    function: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LogIn()),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn ()),
                      );
                    },
                    mdw: mdw,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// علشان الدايره تظهر لازم يكون الطول والعرض زى بعض والدايره تكون نصهم
  AnimatedContainer buildcontrolpageview(index) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 2),
      duration: Duration(milliseconds: 500),
      width: currentpage == index ? 20 : 5,
      height: 5,
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(
            2.5,
          )),
    );
  }
}

class TextAndImage extends StatelessWidget {
  final list;
  final mdw;
  const TextAndImage({Key key, this.list, this.mdw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: mdw / 7),
              child: Text(
                "M.A.R",
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text("${list['text']}", style: TextStyle(
                color: kSecondaryColor,
                fontSize: 15
              ),),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "${list['image']}",
              width: mdw / 1.5,
            )
          ],
        ));
  }
}
