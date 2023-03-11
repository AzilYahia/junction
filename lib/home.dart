import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';
import 'widgets/newscard.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kgrey,
      appBar: AppBar(title: Center(child: Text("Vocal Assistant")),
      backgroundColor: kgrey,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [            Center(
            child: Image.asset(
              'assets/png/voice.png',
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
        [
          Column(
            children: [
              Center(
                  child: Image.asset(
                    'assets/png/mail.png',
                  )),
              Center(
                child:Text(
                  'Mail Assistant',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 70,),
          Column(
            children: [
              Center(
                  child: Image.asset(
                    'assets/png/pod.png',
                    fit: BoxFit.cover,
                  )
              ),
              Center(
                child:Text(
                  'Smart Pod',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),

        ],),
        ],
      ),
    );
  }
}
