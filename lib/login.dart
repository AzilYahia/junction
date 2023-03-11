import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Image.asset(
              'assets/png/loglow.png',
            )),
            SizedBox(height: 50,),
            Text(
              'Log In',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: kwhite, fontSize: 64, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50,),
            //email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Fieldtext(
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
                            color: kwhite),
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
                child: Container(
                  height: 64,
                  width: 339,
                  decoration:  BoxDecoration(
                      color: kgreen,
                      borderRadius: BorderRadius.all(Radius.circular(55))),
                  child: Center(
                      child: Text("Go",style: GoogleFonts.poppins(
                          color: kwhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),)),
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
                          color: kwhite),
                    ))),

          ],
        ),
      ),
    );
  }
}
