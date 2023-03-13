import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/inbox.dart';
import 'package:junction/login.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';

class InboxDetails extends StatefulWidget {
  const InboxDetails({Key? key}) : super(key: key);

  @override
  State<InboxDetails> createState() => _InboxDetailsState();
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

class _InboxDetailsState extends State<InboxDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitelikangrey,
        appBar: AppBar(
          title: Center(child: Text("Vocal Assistant")),
          backgroundColor: kwhitelikangrey,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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


                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      color: kwhitelikangrey,
                      height: MediaQuery.of(context).size.width ,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Container(height: 25, width: 25,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),
                      SizedBox(width: 20,),

                      Text(
                               'Email Subject',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: kbluelikanwhite,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                          ],),
                        ),
                        SizedBox(height:30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),                      child: Text(
                            'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire dy rajouter de petits clins doeil, voire des phrases embarassantes)',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: kbluelikanwhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],),

                      // Card(
                      //   color: kgreylow,
                      //   child: ListTile(
                      //     tileColor: kgreylow,
                      //     leading: Container(
                      //       height: 15,
                      //       width: 15,
                      //       decoration: BoxDecoration(
                      //         color: kgreen,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //     title: Text(
                      //       'Email Subject',
                      //       style: GoogleFonts.lato(
                      //         textStyle: const TextStyle(
                      //             color: kwhite,
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.w500),
                      //       ),
                      //     ),
                      //     subtitle: Text(
                      //       'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      //       maxLines: 3,
                      //       style: GoogleFonts.lato(
                      //         textStyle: const TextStyle(
                      //             overflow: TextOverflow.ellipsis,
                      //             color: kwhite,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //     ),
                      //     isThreeLine: true,
                      //   ),
                      // ),
                    ),
                  ),

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

                  Center(
                    child: TextButton(onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Inbox(),
                        ),
                      );
                    },
                      child: Container(
                        height: 64,
                        width: 300,
                        decoration:  BoxDecoration(
                            color: knewred,
                            borderRadius: BorderRadius.all(Radius.circular(55))),
                        child: Center(
                            child: Text("Suggest Reply",style: GoogleFonts.poppins(
                                color: kbluelikanwhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),)),
                      ),),
                  ),
                ]),
          ),
        ));
  }
}
