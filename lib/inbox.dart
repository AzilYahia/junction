import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/inboxdetails.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

// ListView.builder(
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// physics: BouncingScrollPhysics(),
// itemCount: monthModel.length,
// itemBuilder: (BuildContext context, int index) {
// return _buildPlayerModelList(monthModel[index]);
// },
// ),

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitelikangrey,
        appBar: AppBar(
          title: Center(child: Text("Mail Assistant")),
          backgroundColor: kwhitelikangrey,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Inbox',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: kbluelikanwhite,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.search, color: kbluelikanwhite, size: 40),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kwhitelikangrey, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kgreylow,
                  child: ListTile(
                    tileColor: kgreylow,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kbluelikanwhite, fontSize: 20, fontWeight: FontWeight.w500),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kbluelikanwhite, fontSize: 12, fontWeight: FontWeight.w400),),),
                    isThreeLine: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            //
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kwhitelikangrey, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kgreylow,
                  child: ListTile(
                    tileColor: kgreylow,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kbluelikanwhite, fontSize: 20, fontWeight: FontWeight.w500),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kbluelikanwhite, fontSize: 12, fontWeight: FontWeight.w400),),),
                    isThreeLine: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            //
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kwhitelikangrey, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kgreylow,
                  child: ListTile(
                    tileColor: kgreylow,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kbluelikanwhite, fontSize: 20, fontWeight: FontWeight.w500),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kbluelikanwhite, fontSize: 12, fontWeight: FontWeight.w400),),),
                    isThreeLine: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            //
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kwhitelikangrey, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kgreylow,
                  child: ListTile(
                    tileColor: kgreylow,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kbluelikanwhite, fontSize: 20, fontWeight: FontWeight.w500),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kbluelikanwhite, fontSize: 12, fontWeight: FontWeight.w400),),),
                    isThreeLine: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            //
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kwhitelikangrey, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kgreylow,
                  child: ListTile(
                    tileColor: kgreylow,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kbluelikanwhite, fontSize: 20, fontWeight: FontWeight.w500),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kbluelikanwhite, fontSize: 12, fontWeight: FontWeight.w400),),),
                    isThreeLine: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            //
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kwhitelikangrey, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kgreylow,
                  child: ListTile(
                    tileColor: kgreylow,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kbluelikanwhite, fontSize: 20, fontWeight: FontWeight.w500),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kbluelikanwhite, fontSize: 12, fontWeight: FontWeight.w400),),),
                    isThreeLine: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            //
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kwhitelikangrey, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kgreylow,
                  child: ListTile(
                    tileColor: kgreylow,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kbluelikanwhite, fontSize: 20, fontWeight: FontWeight.w500),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kbluelikanwhite, fontSize: 12, fontWeight: FontWeight.w400),),),
                    isThreeLine: true,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),
            //


            //
            //       Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //         Padding(
    //           padding: const EdgeInsets.only(left: 20.0),
    //           child: Container(
    //             height: 15,
    //             width: 15,decoration: new BoxDecoration(
    // color: kgreen,
    // shape: BoxShape.circle,),),
    //         ),
    //         SizedBox(width: 20,),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //
    //
    //           Text(
    //           'Email Subject',
    //           style: GoogleFonts.lato(
    //             textStyle: const TextStyle(
    //                 color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),),),
    //
    //           Expanded(
    //             child: Text(
    //               'de nombreux sites qui..',
    //               maxLines: 3,
    //               style: GoogleFonts.lato(
    //                 textStyle: const TextStyle(
    //                   overflow: TextOverflow.ellipsis,
    //                     color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),),),
    //           )
    //         ],
    //           )
    //       ],),),

          ]),
        ));
  }
}
