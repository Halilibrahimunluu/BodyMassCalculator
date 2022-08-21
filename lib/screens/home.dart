import 'package:flutter/cupertino.dart';
import 'package:hesaplayici/constants/app_constants.dart';
import 'package:hesaplayici/screens/home.dart';
import 'package:hesaplayici/widgets/left_bar.dart';
import 'package:hesaplayici/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _vkiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vücut Kitle Hesaplayıcı",
          style:
              TextStyle(color: Color(0xffFCC91C), fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Color(0xff1C1C1C),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Color(0xffFCC91C)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Boy",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Color(0xffFCC91C)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kilo",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {

                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _vkiResult = _w / (_h * _h);
                  if(_vkiResult>25){
                  _textResult = "Normal Kilonun Üstündesiniz";
                  }
                  else if(_vkiResult>=18.5 && _vkiResult<=25){
                    _textResult = "Normal Kilodasınız";
                  }
                  else {
                    _textResult = "Normal Kilonun Altındasınız";
                  }
                }
                );
              },
              child: Container(
                child: Text(
                  "Hesapla",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFCC91C)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _vkiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: Color(0xffFCC91C)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFCC91C)),
                ),

              ),
            ),

            SizedBox(
              height: 50,
            ),
            LeftBar(barWidth: 50),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 30),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 70),Text("Developed by Halil İbrahim Ünlü", style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 3,
          color: Color(0xffFCC91C)),),
          ],

        ),

      ),
    );
  }
}
