import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/inbox.dart';
import 'package:junction/inboxdetails.dart';
import 'package:junction/newPod.dart';
import 'package:junction/smartpod.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';
import 'home.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
   FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
backgroundColor: kgrey,
      body: SingleChildScrollView(
        child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SvgPicture.asset('assets/svg/logolow.svg'),
                Center(child: Image.asset('assets/png/loglow.png',)),

                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 50),                child: Text(
                    'Welcome to your',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: kwhite, fontSize: 24, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                SizedBox(height:12,),
                Padding(
                  padding: const EdgeInsets.only(left: 50),                child: Text(
                    'Virtual Assistant',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: kwhite, fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height:100,),

                Center(
                  child: TextButton(onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen (),
                      ),
                    );
                  },
                    child: Container(
                    height: 64,
                    width: 339,
                    decoration:  BoxDecoration(
                        color: kgreen,
                        borderRadius: BorderRadius.all(Radius.circular(55))),
                    child: Center(
                        child: Text("Get Started",style: GoogleFonts.poppins(
                            color: kwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),)),
                  ),),
                ),
              ],
            ),
          ),
      ),



    );
  }
}
