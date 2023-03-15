import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:junction/chat/chat.dart';
import 'package:junction/view/editProfile.dart';
import 'package:junction/email/inbox.dart';
import 'package:junction/email/inboxdetails.dart';
import 'package:junction/pod/newPod.dart';
import 'package:junction/pod/smartpod.dart';
import 'widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'auth/login.dart';
import '../view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'dart:async';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Firebase.initializeApp();
  await isLoggedIn();
  await getToken();
  runApp( MyApp());
}
Future<bool> isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  return token != null;
}
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}


/*

To initialise Firebase, call Firebase.initializeApp from the firebase_core package with the configuration from your new firebase_options.dart file:

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

 */
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  FirstPage(),

    );
  }
}

class FirstPage extends StatefulWidget {
   FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
backgroundColor: Color(0xFFF5F5F5),
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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

              // Center(child: SvgPicture.asset('assets/svg/robot.svg',)),
              Center(child: Image.asset('assets/png/robot.png',scale: 1.2,)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: TextButton(onPressed: () async {
                      Future<UserCredential> signInWithGoogle() async {
                        // Trigger the authentication flow
                        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                        // Obtain the auth details from the request
                        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
                        // Create a new credential
                        final credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth?.accessToken,
                          idToken: googleAuth?.idToken,
                        );
                        // Once signed in, return the UserCredential
                        return await FirebaseAuth.instance.signInWithCredential(credential);
                      }
                      await signInWithGoogle();

                      if(mounted){
                        String? tokeny = FirebaseAuth.instance.currentUser?.uid;
                        saveToken(tokeny!);
                        ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Center(child: Text("Welcome back!",style: GoogleFonts.poppins(
    color: kwhitelikangrey,
    fontSize: 24,
    fontWeight: FontWeight.w500))),behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: 400.0),backgroundColor: Colors.green));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage (),),);}
                      else{
                        ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Center(child: Text("Couldn't Sign in!",style: GoogleFonts.poppins(
                            color: kred,
                            fontSize: 24,
                            fontWeight: FontWeight.w500))),behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 400.0),backgroundColor: Colors.green));
                      }
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:  BoxDecoration(
                            color: klightgrey,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/google.svg',
                              height: 20,
                              width: 20
                            )),
                      ),),
                  ),
                  Center(
                    child: TextButton(onPressed: () {
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:  BoxDecoration(
                            color: klightgrey,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/apple.svg',
                              height: 20,
                              width: 20
                            )),
                      ),),
                  ),
                  Center(
                    child: TextButton(onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen (),
                        ),
                      );
                    },
                      child: Container(
                        height: 50,
                        width: 180,
                        decoration:  BoxDecoration(
                            color: knewred,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text("Get Started",style: GoogleFonts.poppins(
                                    color: kwhitelikangrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),)),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_ios_rounded,color: kwhitelikangrey,)
                          ],
                        ),
                      ),),
                  ),


                ],
              ),




            ],
          ),
        ),
    );
  }
}

//
// class GmailApi {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/gmail.readonly']);
//
//   Future<http.Response> _get(String url) async {
//     final headers = await _getHeaders();
//     final response = await http.get(Uri.parse(url), headers: headers);
//     return response;
//   }
//
//   Future<Map<String, String>> _getHeaders() async {
//     final currentUser = await _googleSignIn.signInSilently();
//     final headers = {'Authorization': 'Bearer ${await currentUser!.authHeaders}'};
//     return headers;
//   }
//
//   Future<List<dynamic>> getMessages() async {
//     final response = await _get('https://www.googleapis.com/gmail/v1/users/me/messages?maxResults=10');
//     final jsonResponse = json.decode(response.body);
//     final messages = jsonResponse['messages'];
//     return messages;
//   }
//
//   Future<Map<String, dynamic>> getMessage(String messageId) async {
//     final response = await _get('https://www.googleapis.com/gmail/v1/users/me/messages/$messageId?format=full');
//     final jsonResponse = json.decode(response.body);
//     return jsonResponse;
//   }
// }
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final _gmailApi = GmailApi();
//   final _messageSubjects = <String>[];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchMessages();
//   }
//
//   Future<void> _fetchMessages() async {
//     final messages = await _gmailApi.getMessages();
//     for (final message in messages) {
//       final messageId = message['id'];
//       final fullMessage = await _gmailApi.getMessage(messageId);
//       final headers = fullMessage['payload']['headers'];
//       final subjectHeader = headers.firstWhere((header) =>
//       header['name'] == 'Subject', orElse: () => {'value': 'No subject'});
//       final subject = subjectHeader['value'];
//       setState(() {
//         _messageSubjects.add(subject);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gmail API Demo'),
//       ),
//       body: ListView.builder(
//         itemCount: _messageSubjects.length,
//         itemBuilder: (context, index) {
//           final subject = _messageSubjects[index];
//           return ListTile(
//             title: Text(subject),
//           );
//         },
//       )
//
//     );
//   }
// }
