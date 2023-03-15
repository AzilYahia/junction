import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/email/inbox.dart';
import 'package:junction/pod/smartpod.dart';
import '../widgets/constants.dart';
import '../chat/chat.dart';
import '../widgets/fieldtext.dart';
import '../email/newscard.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';


class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch(index){
        case (0):
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Inbox(),
            ),
          );
          break;
        case (1): Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(),
          ),
        );  break;  case (2): Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SmartPod(),
          ),
        );  break;
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhitelikangrey,
      appBar: AppBar(
        backgroundColor: knewred,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,color: knewred,),
        ),
        title:
        // Row(
        //   children: [
        //
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 10.0),
        //       child: Container(
        //         height: 30,
        //         width: 70,
        //         decoration:  BoxDecoration(
        //             color: Color(0xFFE8B500),
        //             borderRadius: BorderRadius.all(Radius.circular(13))),
        //         child: Center(
        //             child: Text("Pro",style: GoogleFonts.poppins(
        //                 color: kwhitelikangrey,
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.w700),)),
        //       ),
        //     ),
            Text(
              '[Say Anything ..]',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: kwhitelikangrey,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
        //   ],
        // ),
        elevation: 0,


      ),
      body:      Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Center(
                child:
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                    );
                  },
                  child: Image.asset(
                    'assets/png/waves.png',
                  ),
                )
            ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Inbox(),
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
                          child: Text(
                            'Mail Assistant',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: kbluelikanwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatScreen()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/png/voice.png',scale: 2,
                        ),
                        Center(
                          child: Text(
                            'Chat',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: kbluelikanwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(width: 70,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SmartPod(),
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
                          child: Text(
                            'Smart Pod',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: kbluelikanwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: knewred,
      //   unselectedItemColor: kblue,
      //   elevation: 0,
      //   backgroundColor: kwhitelikangrey,
      //   onTap: onTabTapped,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       backgroundColor: knewred,
      //       icon: Icon(Icons.mail),
      //       label: 'Mail Assistant',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mic),
      //       label: 'Chat Assistant',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.podcasts_rounded),
      //       label: 'Smart Pod',
      //     ),
      //   ],
      // ),
    );
  }
}



