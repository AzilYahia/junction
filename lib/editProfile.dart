import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/home.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhitelikangrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

        // Stack(
        //   children:
        //   [
        //     CircleAvatar( radius: 70,
        //       //add an edit button at the bottom right  of the image  to change the image of the user profile picture
        //
        //
        //     ),
        //     // Container(
        //     //     height: 127,
        //     //     width: 135,
        //     //     decoration: BoxDecoration(
        //     //       color: klightgrey,
        //     //       shape: BoxShape.circle,
        //     //     ),
        //     //   ),
        //     Icon(Icons.edit),
        // ]),
            Stack(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey.shade200,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/default.png'),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(Icons.edit, color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50,
                          ),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 4),
                            color: Colors.black.withOpacity(
                              0.3,
                            ),
                            blurRadius: 3,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),

            Container(
              height: 57,
              width: 342,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kcontainergrey),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, ),
                child: Text("Rafik Kasmi", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:  kwhitelikangrey),),
              ),
            ),
            SizedBox(height: 23,),
            Container(
              height: 57,
              width: 342,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kcontainergrey),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, ),
                child: Text("12/10/2000", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:  kwhitelikangrey),),
              ),
            ),
            SizedBox(height: 23,),
            Container(
              height: 57,
              width: 342,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kcontainergrey),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, ),
                child: Text("Male", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:  kwhitelikangrey),),
              ),
            ),
            SizedBox(height: 23,),
            Container(
              height: 57,
              width: 342,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kcontainergrey),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, ),
                child: Text("change Password", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:  kwhitelikangrey),),
              ),
            ),
            SizedBox(height: 50,),


            Center(
              child: TextButton(onPressed:() => Navigator.pop(context),

                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage (),
                      ),
                    );
                  },
                  child: Container(

                    height: 64,
                    width: 339,
                    decoration:  BoxDecoration(
                        color: knewred,
                        borderRadius: BorderRadius.all(Radius.circular(55))),
                    child: Center(
                        child: Text("Continue",style: GoogleFonts.poppins(
                            color: kwhitelikangrey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),)),
                  ),
                ),),
            ),

          ],
        ),
      ),
    );
  }
}
