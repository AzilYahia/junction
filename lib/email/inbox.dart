import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/androidenterprise/v1.dart';
import 'package:junction/email/inboxdetails.dart';
import '../widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/fieldtext.dart';
import 'package:googleapis/gmail/v1.dart' as gMail;


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:zapit/models/appState.dart';
import 'package:googleapis/gmail/v1.dart' as gMail;


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
  late gMail.GmailApi gmailApi;
  List<gMail.Message> messagesList = [];
  late Future waitForInit;

  @override
  void initState() {
    super.initState();
    // waitForInit = init();
  }

  // init() async {
  //   // final authHeaders = await AppState.state.googleUser.authHeaders;
  //   // final authenticateClient = GoogleAuthClient(authHeaders);
  //   gmailApi = gMail.GmailApi(authenticateClient);
  //
  //   gMail.ListMessagesResponse results =
  //   await gmailApi.users.messages.list("me");
  //   for (gMail.Message message in results.messages) {
  //     gMail.Message messageData =
  //     await gmailApi.users.messages.get("me", message.id);
  //     messagesList.add(messageData);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitelikangrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,color: kbluelikanwhite,),
          ),
          title: Text("Mail Assistant",style: GoogleFonts.roboto(
              color: kblue,
              fontSize: 24,
              fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: kwhitelikangrey,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InboxDetails (),
                  ),
                );
              },
              child: Container(color: kblue, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kblue,
                  child: ListTile(
                    tileColor: kblue,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kwhitelikangrey, fontSize: 20, fontWeight: FontWeight.bold),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kwhitelikangrey, fontSize: 12, fontWeight: FontWeight.w400),),),
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
              child: Container(color: kblue, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kblue,
                  child: ListTile(
                    tileColor: kblue,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kwhitelikangrey, fontSize: 20, fontWeight: FontWeight.bold),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kwhitelikangrey, fontSize: 12, fontWeight: FontWeight.w400),),),
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
              child: Container(color: kblue, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kblue,
                  child: ListTile(
                    tileColor: kblue,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kwhitelikangrey, fontSize: 20, fontWeight: FontWeight.bold),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kwhitelikangrey, fontSize: 12, fontWeight: FontWeight.w400),),),
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
              child: Container(color: kblue, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kblue,
                  child: ListTile(
                    tileColor: kblue,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kwhitelikangrey, fontSize: 20, fontWeight: FontWeight.bold),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kwhitelikangrey, fontSize: 12, fontWeight: FontWeight.w400),),),
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
              child: Container(color: kblue, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kblue,
                  child: ListTile(
                    tileColor: kblue,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kwhitelikangrey, fontSize: 20, fontWeight: FontWeight.bold),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kwhitelikangrey, fontSize: 12, fontWeight: FontWeight.w400),),),
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
              child: Container(color: kblue, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kblue,
                  child: ListTile(
                    tileColor: kblue,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kwhitelikangrey, fontSize: 20, fontWeight: FontWeight.bold),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kwhitelikangrey, fontSize: 12, fontWeight: FontWeight.w400),),),
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
              child: Container(color: kblue, height:MediaQuery.of(context).size.width / 4 ,width: MediaQuery.of(context).size.width,
                child: Card(
                  color: kblue,
                  child: ListTile(
                    tileColor: kblue,

                    leading: Container(height: 15, width: 15,decoration:  BoxDecoration(color: knewred, shape: BoxShape.circle,),),

                    title: Text('Email Subject', style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: kwhitelikangrey, fontSize: 20, fontWeight: FontWeight.bold),),),
                    subtitle: Text(
                      'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par acciden.....',
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kwhitelikangrey, fontSize: 12, fontWeight: FontWeight.w400),),),
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
// _launchURL() async {
//   const url = 'mailto:test_user@example.org?subject=test&body=hello';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }