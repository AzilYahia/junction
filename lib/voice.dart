import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';

class Voice extends StatefulWidget {
  const Voice({Key? key}) : super(key: key);

  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: kgrey,
    appBar: AppBar(title: Center(child: Text("Vocal Assistant")),
    backgroundColor: kgrey,
    elevation: 0,
    ),
    body: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
    [
        Row(
          children: [
            Icon(Icons.chevron_left_sharp,color: kwhite,size: 70),
            Text(
              'Inbox',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: kwhite, fontSize: 30, fontWeight: FontWeight.w500),),),
          ],
        ),
        Icon(Icons.search,color: kwhite,size: 40),
        ],),
      ),
    ],),);
  }
}
