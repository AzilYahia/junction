import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/inbox.dart';
import 'package:junction/smartpod.dart';
import 'constants.dart';
import 'chat.dart';
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
      backgroundColor: kwhitelikangrey,
      appBar: AppBar(title: Center(child: Text("Vocal Assistant")),
      backgroundColor: kwhitelikangrey,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [            Center(
                child:
                GestureDetector(
                   onTap: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                      );
                   },
                child:Image.asset(
                  'assets/png/voice.png',
                ),
                )
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
            [
              GestureDetector(
                onTap: () {
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => Inbox (),
    ),
    );
    },
                child: Column(
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
                              color: kbluelikanwhite, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 70,),
              GestureDetector(
                  onTap: () {
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => SmartPod (),
    ),
    );
    },
                child: Column(
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
                              color: kbluelikanwhite, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],),
            ],
          ),
        ),
      ),
    );
  }
}
