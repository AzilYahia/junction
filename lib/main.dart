import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/editProfile.dart';
import 'package:junction/inbox.dart';
import 'package:junction/inboxdetails.dart';
import 'package:junction/newPod.dart';
import 'package:junction/smartpod.dart';
import 'package:junction/testaudio.dart';
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
backgroundColor: Color(0xFFF5F5F5),
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                'A - GPT',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: kbluelikanwhite, fontSize: 75, fontWeight: FontWeight.bold),
                ),
              ),
              ),

              Center(
                child: TextButton(onPressed: () {
                },
                  child: Container(
                    height: 38,
                    width: 140,
                    decoration:  BoxDecoration(
                        color: knewred,
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: Center(
                        child: Text("Assistant",style: GoogleFonts.poppins(
                            color: kwhitelikangrey,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),)),
                  ),),
              ),

              // Center(child: SvgPicture.asset('assets/svg/robot.svg',)),
              Center(child: Image.asset('assets/png/robot.png',scale: 1.2,)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: TextButton(onPressed: () {
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:  BoxDecoration(
                            color: klightgrey,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/google.svg',
                              height: 20,
                              width: 20
                            )),
                      ),),
                  ),
                  Center(
                    child: TextButton(onPressed: () {
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:  BoxDecoration(
                            color: klightgrey,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/apple.svg',
                              height: 20,
                              width: 20
                            )),
                      ),),
                  ),
                  Center(
                    child: TextButton(onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen (),
                        ),
                      );
                    },
                      child: Container(
                        height: 50,
                        width: 180,
                        decoration:  BoxDecoration(
                            color: knewred,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text("Get Started",style: GoogleFonts.poppins(
                                    color: kwhitelikangrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),)),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_ios_rounded,color: kwhitelikangrey,)
                          ],
                        ),
                      ),),
                  ),


                ],
              ),




            ],
          ),
        ),



    );
  }
}
