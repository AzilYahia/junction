import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/email/inbox.dart';
import 'package:junction/auth/login.dart';
import '../widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/fieldtext.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFour, itemFive, itemSix, itemSeven,  itemEight }

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
  SampleItem? selectedMenu;

  late RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  late double screenHeight = overlay.size.height;
  late double screenWidth = overlay.size.width;
  final double menuWidth = 200.0; // adjust as needed
  final double menuHeight = 300.0; // adjust as needed
  late Rect center = Rect.fromCenter(
    center: overlay.size.center(Offset.zero) + Offset(10,10),
    width: menuWidth,
    height: menuHeight,
  );

  late RenderBox button = context.findRenderObject() as RenderBox;
  late Rect buttonRect = button.localToGlobal(Offset.zero) & button.size;
  // late double screenHeight = overlay.size.height;
  // late double screenWidth = overlay.size.width;
  // late double menuWidth = 200.0; // adjust as needed
  // late double menuHeight = 300.0; // adjust as needed
  late Rect menuRect = Rect.fromLTWH(
    // (screenWidth - menuWidth) / 2.0,
    buttonRect.left + 5.0,
    buttonRect.top + 5.0,

    // buttonRect.bottom,

    menuWidth,
    menuHeight,
  );
  late RelativeRect position = RelativeRect.fromRect(
    menuRect,
    Offset.zero & Size(screenWidth, screenHeight),
  );

  List<Widget> menuItems =  [
    SizedBox(height: 1,),
    Center(
      child: Text(
        "Which type of response?",
        style: GoogleFonts.poppins(
            color: kblue,
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
    ),
    SizedBox(height: 30,),
    PopupMenuItem<SampleItem>(
      height: 10,
      value: SampleItem.itemOne,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: kblue,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Accepted",
          style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),
    ),
    SizedBox(height: 7,),
    PopupMenuItem<SampleItem>(                                      height: 10,

      value: SampleItem.itemTwo,
      child: Container(                                        height: 30,

        decoration: BoxDecoration(
            color: kblue,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Declined",
          style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),
    ),SizedBox(height: 7,),
    PopupMenuItem<SampleItem>(                                      height: 10,

      value: SampleItem.itemThree,
      child: Container(                                        height: 30,

        decoration: BoxDecoration(
            color: kblue,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Positive",
          style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),

    ),SizedBox(height: 7,),
    PopupMenuItem<SampleItem>(                                      height: 10,

      value: SampleItem.itemFour,
      child: Container(                                        height: 30,

        decoration: BoxDecoration(
            color: kblue,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Negative",
          style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),

    ),SizedBox(height: 7,),
    PopupMenuItem<SampleItem>(                                      height: 10,

      value: SampleItem.itemFive,
      child: Container(                                        height: 30,

        decoration: BoxDecoration(
            color: kblue,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Happy",
          style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),

    ),SizedBox(height: 7,),
    PopupMenuItem<SampleItem>(                                      height: 10,

      value: SampleItem.itemSix,
      child: Container(                                        height: 30,

        decoration: BoxDecoration(
            color: kblue,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Angry",
          style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),

    ),SizedBox(height: 7,),
    PopupMenuItem<SampleItem>(                                      height: 10,

      value: SampleItem.itemSeven,
      child: Container(                                        height: 30,

        decoration: BoxDecoration(
            color: kblue,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Confused",
          style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),

    ),SizedBox(height: 7,),
    PopupMenuItem<SampleItem>(                                      height: 10,

      value: SampleItem.itemEight,
      child: Container(                                        height: 30,

        decoration: BoxDecoration(
            color: klightgrey,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Center(child: Text(
          "Neutral",
          style: GoogleFonts.poppins(
              color: kblack,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )),),

    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitelikangrey,
        appBar: AppBar(
          title: Center(child: Text("Vocal Assistant")),
          backgroundColor: kwhitelikangrey,
          elevation: 0,
          //       actions: [  PopupMenuButton<int>(
          //     itemBuilder: (context) =>
          //   [
          //   // popupmenu item 1
          //   PopupMenuItem(
          //   value: 1,
          //   // row has two child icon and text.
          //   child: Row(
          //     children: [
          //       Icon(Icons.star),
          //       SizedBox(
          //         // sized box with width 10
          //         width: 10,
          //       ),
          //       Text("Get The App")
          //     ],
          //   ),
          // ),
          // // popupmenu item 2
          // PopupMenuItem(
          // value: 2,
          // // row has two child icon and text
          // child: Row(
          // children: [
          // Icon(Icons.chrome_reader_mode),
          // SizedBox(
          // // sized box with width 10
          // width: 10,
          // ),
          // Text("About")
          // ],
          // ),
          // ),
          // ],
          // offset: Offset(0, 100),
          // color: Colors.grey,
          // elevation: 2,
          // )],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: knewred,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Email Subject',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        color: kbluelikanwhite,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              'de nombreux sites qui nen sont encore quà leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire dy rajouter de petits clins doeil, voire des phrases embarassantes)',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: kbluelikanwhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),

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
                    child: TextButton(
                      onPressed: () {
                        showMenu(
                          context: context,
                            position:
                          // position,
                          //   RelativeRect.fromLTRB(2, (overlay.size.height / 3) ,2,0),
                            RelativeRect.fromRect(center, Offset.zero & Size(screenWidth, screenHeight)),
                          //
                          // fromRect(
                          //     center, Offset.zero & overlay.size),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                          items: [CustomPopupMenuItem(
                            width: 300.0, // set the width here
                            height: 400.0, // set the height here
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  menuItems,
                              ),
                            ),
                          )],
                        );
                      },
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) => Inbox(),
                      //     ),
                      //   );
                      // },
                      child: Container(
                        height: 64,
                        width: 300,
                        decoration: BoxDecoration(
                            color: knewred,
                            borderRadius:
                                BorderRadius.all(Radius.circular(55))),
                        child: Center(
                            child: Text(
                          "Suggest Reply",
                          style: GoogleFonts.poppins(
                              color: kwhitelikangrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}

class CustomPopupMenuItem extends PopupMenuEntry<SampleItem> {
  const CustomPopupMenuItem({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;

  @override
  _CustomPopupMenuItemState createState() => _CustomPopupMenuItemState();

  bool represents(SampleItem? value) {
    return false;
  }
}

class _CustomPopupMenuItemState extends State<CustomPopupMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: widget.child,
      ),
    );
  }
}
