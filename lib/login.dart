import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/home.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhitelikangrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'A - GPT',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: kbluelikanwhite, fontSize: 75, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Center(
              child: TextButton(onPressed: () {
              },
                child: Container(
                  height: 38,
                  width: 140,
                  decoration:  BoxDecoration(
                      color: knewred,
                      borderRadius: BorderRadius.all(Radius.circular(13))),
                  child: Center(
                      child: Text("Assistant",style: GoogleFonts.poppins(
                          color: kwhitelikangrey,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),)),
                ),),
            ),
            SizedBox(height: 50,),
            Text(
              'Welcome Back !',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: klightblue, fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 50,),
            //email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Fieldtext(
                prefix: Icon(Icons.email, color: Colors.white),
                hint: "email",
                // controller: passwordController,
                // obsec: controller.isVisible ? true : false,

                //   inp: controller.isVisible
                //   ? IconButton(
                //       icon: const Icon(Icons.visibility_off,
                //       color: Colors.black),
                //   onPressed: () => controller.visibility(),
                // )
                //     : IconButton(
                // icon: const Icon(Icons.visibility,
                // color: Colors.black),
                // onPressed: () => controller.visibility(),
                // ),
                // validator: (value) {
                // if (value.toString().length < 8) {
                // return "password should be longer or equal to 8 characters";
                // } else {
                // return null;
                // }
                // },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Fieldtext(
                hint: "password",
                prefix: Icon(Icons.lock, color: Colors.white),
                // controller: passwordController,
                // obsec: controller.isVisible ? true : false,

                //   inp: controller.isVisible
                //   ? IconButton(
                //       icon: const Icon(Icons.visibility_off,
                //       color: Colors.black),
                //   onPressed: () => controller.visibility(),
                // )
                //     : IconButton(
                // icon: const Icon(Icons.visibility,
                // color: Colors.black),
                // onPressed: () => controller.visibility(),
                // ),
                // validator: (value) {
                // if (value.toString().length < 8) {
                // return "password should be longer or equal to 8 characters";
                // } else {
                // return null;
                // }
                // },
              ),
            ),
            const SizedBox(
              height:1,
            ),
            //forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () =>
                      {},
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: kbluelikanwhite),
                      ))),
            ),
            SizedBox(height: 60,),
//button go
            Center(
              child: TextButton(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen (),
                  ),
                );
              },
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
                        child: Text("Go",style: GoogleFonts.poppins(
                            color: kwhitelikangrey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),)),
                  ),
                ),),
            ),
            //dont have an account
            Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () =>
                    {},
                    child: Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: kbluelikanwhite),
                    ))),

          ],
        ),
      ),
    );
  }
}
