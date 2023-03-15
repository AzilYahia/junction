import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junction/auth/login.dart';
import '../view/home.dart';
import '../widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/fieldtext.dart';


class RegisterScreen extends StatefulWidget {

  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisible = true;

  visibility() {
    isVisible = !isVisible;
  }

  String validationEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Future<void> registerWithEmail(
      {required String email, required String password}) async {
    await FirebaseAuth.instance.
    createUserWithEmailAndPassword(email: email, password: password);
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kwhitelikangrey,
      body: Center(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'A - GPT',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: kbluelikanwhite,
                          fontSize: 75,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Center(
                  child: TextButton(onPressed: () {},
                    child: Container(
                      height: 38,
                      width: 140,
                      decoration: BoxDecoration(
                          color: knewred,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      child: Center(
                          child: Text("Assistant", style: GoogleFonts.poppins(
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
                        color: klightblue,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 50,),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Fieldtext(
                    prefix: Icon(Icons.email, color: Colors.white),
                    hint: "email",
                    controller: emailController,
                    obsec: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value!)) {
                        return "Email is invalid";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Fieldtext(
                    hint: "password",
                    prefix: Icon(Icons.lock, color: Colors.white),
                    controller: passwordController,
                    obsec: isVisible ? true : false,

                      inp: isVisible
                      ? IconButton(
                          icon: const Icon(Icons.visibility_off,
                          color: kwhitelikangrey),
                      onPressed: () => {
                      setState(() {visibility();})
                      },
                    )
                        : IconButton(
                    icon: const Icon(Icons.visibility,
                    color: kwhitelikangrey),
                    onPressed: () =>
                        setState(() {visibility();}),
                    ),
                    validator: (value) {
                      if (value
                          .toString()
                          .length < 8) {
                        return "password should be longer or equal to 8 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //confirm password

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Fieldtext(
                    hint: "confirm password",
                    prefix: Icon(Icons.lock, color: Colors.white),
                    controller: confirmpasswordController,
                    obsec: isVisible ? true : false,

                    inp: isVisible
                        ? IconButton(
                      icon: const Icon(Icons.visibility_off,
                          color: kwhitelikangrey),
                      onPressed: () => setState(() {visibility();}),
                    )
                        : IconButton(
                      icon: const Icon(Icons.visibility,
                          color: kwhitelikangrey),
                      onPressed: () => setState(() {visibility();}),
                    ),
                    validator: (value) {
                      if (value.toString().length < 8) {
                        return "password should be longer or equal to 8 characters";
                      } else if ( value != passwordController.text) {
                          return "password doesn't match";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () => {},
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: kbluelikanwhite),
                          ))),
                ),
                SizedBox(height: 35,),
//button go
                Center(
                  child: TextButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        try {
                          await registerWithEmail(email: email, password: password);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),
                              content: Center(child: Text(
                                  "Signed Up Successfully!", style: GoogleFonts.poppins(
                                  color: kwhitelikangrey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500))),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(bottom: 400.0),
                              backgroundColor: Colors.green));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        }
                        on FirebaseAuthException catch (e) {
                          switch (e.code){case 'user-not-found':
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 700),
                                content: Center(child: Text("user not found",
                                    style: GoogleFonts.poppins(
                                        color: kwhitelikangrey,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500))),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(bottom: 400.0),
                                backgroundColor: kred));
                            break;
                            case 'wrong-password':
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 700),
                                content: Center(child: Text(
                                  "wrong password", style: GoogleFonts.poppins(
                                    color: kwhitelikangrey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),)),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(bottom: 400.0),
                                backgroundColor: kred,));
                              break;

                              case 'weak-password':
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 700),
                                  content: Center(child: Text(
                                    "The password provided is too weak.", style: GoogleFonts.poppins(
                                      color: kwhitelikangrey,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),)),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(bottom: 400.0),
                                  backgroundColor: kred,));
                                break;

                            case 'email-already-in-use':
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 700),
                                content: Center(child: Text(
                                  "The account already exists for that email.", style: GoogleFonts.poppins(
                                    color: kwhitelikangrey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),)),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(bottom: 400.0),
                                backgroundColor: kred,));
                          }
                        }
                        catch (e){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 700),
                            content: Center(child: Text(
                              e.toString()
                              , style: GoogleFonts.poppins(
                                color: kwhitelikangrey,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),)),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 400.0),
                            backgroundColor: kred,));
                        }
                      }
                    },
                    child: Container(
                      height: 64,
                      width: 339,
                      decoration: BoxDecoration(
                          color: knewred,
                          borderRadius: BorderRadius.all(Radius.circular(55))),
                      child: Center(
                          child: Text("Go", style: GoogleFonts.poppins(
                              color: kwhitelikangrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ),

                //dont have an account
                Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () =>
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))

                        },
                        child: Text(
                          "Already registred?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: kbluelikanwhite),
                        ))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


