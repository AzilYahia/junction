import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/newPod.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';

class SmartPod extends StatefulWidget {
  const SmartPod({Key? key}) : super(key: key);

  @override
  State<SmartPod> createState() => _SmartPodState();
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

class _SmartPodState extends State<SmartPod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitelikangrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Center(child: Text("Smart Pod")),
          backgroundColor: kwhitelikangrey,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),



            Container(
              color: kgreylownoopacity,
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home Pod',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: kbluelikanwhite,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Connected',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: kbluelikanwhite,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: knewred,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        //
                        Center(
                          child: TextButton(onPressed: () {
                          },
                            child: Container(
                              height: 38,
                              width: 120,
                              decoration:  BoxDecoration(
                                  color: kbluelikanwhite,
                                  borderRadius: BorderRadius.all(Radius.circular(13))),
                              child: Center(
                                  child: Text("Disconnect",style: GoogleFonts.poppins(
                                      color: kred,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),)),
                            ),),
                        ),

                        ],),
                    Image.asset('assets/png/podtransparent.png',scale: 0.7,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: kgreylownoopacity,
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Office Pod',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: kbluelikanwhite,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Disconnected',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: kbluelikanwhite,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: kred,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        //
                        Center(
                          child: TextButton(onPressed: () {
                          },
                            child: Container(
                              height: 38,
                              width: 120,
                              decoration:  BoxDecoration(
                                  color: kbluelikanwhite,
                                  borderRadius: BorderRadius.all(Radius.circular(13))),
                              child: Center(
                                  child: Text("Connect",style: GoogleFonts.poppins(
                                      color: knewred,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),)),
                            ),),
                        ),

                      ],),
                    Image.asset('assets/png/podtransparent.png',scale: 0.7,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 80,),
            Center(
              child: TextButton(onPressed: () {
              },
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NewPod (),
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
                        child: Text("Add a new pod",style: GoogleFonts.poppins(
                            color: kbluelikanwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),)),
                  ),
                ),),
            ),
          ]),
        ));
  }
}
