// import 'package:flutter/material.dart';
// import '../widgets/constants.dart';
// import '../widgets/fieldtext.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:audio_waveforms/audio_waveforms.dart';
//
//
// class ChatMessage {
//   String messageContent;
//   String messageType;
//   ChatMessage({required this.messageContent, required this.messageType});
// }
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   List<ChatMessage> _messages = [];
//   int _selectedIndex = 0;
//   final chatGPT = OpenAI.instance.build(
//       token: "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",
//       baseOption: HttpSetup(receiveTimeout: const Duration (seconds: 6)));
//
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = '';
//   @override
//   void initState() {
//     super.initState();
//     _initSpeech();
//   }
//
//   void _initSpeech() async {
//     _speech = stt.SpeechToText();
//     await _speech.initialize();
//
//     setState(() {});
//   }
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Chat to GPT!")),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.arrow_back_ios,color: kblue,),
//
//         ),
//         backgroundColor: kwhitelikangrey,
//         elevation: 0,
//       ),
//
//       backgroundColor: kwhitelikangrey,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//
//               SizedBox(
//                 height: 50,
//               ),
//               ListView.builder(
//                 itemCount: _messages.length,
//                 shrinkWrap: true,
//                 padding: EdgeInsets.only(top: 10, bottom: 10),
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: EdgeInsets.only(
//                         left: 14, right: 14, top: 10, bottom: 10),
//                     child: Align(
//                       alignment: (_messages[index].messageType == "receiver"
//                           ? Alignment.topLeft
//                           : Alignment.topRight),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: (_messages[index].messageType == "receiver"
//                               ? kbluelikanwhite
//                               : knewred),
//                         ),
//                         padding: EdgeInsets.all(16),
//                         child: Text(
//                           _messages[index].messageContent,
//                           style: TextStyle(fontSize: 15),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 200,
//               ),
//               //password
//
//               //button go
//               // Center(
//               //   child: GestureDetector(
//               //     onTapDown: startListening,
//               //     onTapUp: stopListening,
//               //     child: Image.asset('assets/png/voice.png', width: 100),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//                 child: GestureDetector(
//                   child: FloatingActionButton(
//                     backgroundColor: knewred,
//                     child:Center(
//                       child: Container(
//                       child: InkWell(
//                         onTapDown: startListening,
//                         onTapUp: stopListening,
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 8.0),
//                           child: Icon(
//                             Icons.mic_none,
//                             color: kwhitelikangrey,
//                             size: 25,
//                           ),
//                         ),
//                       ),
//                   ),
//                     ),
//                       onPressed: () => {},),
//                 ),
//               ),
//           SizedBox(height: 20,),
//           Padding(
//             padding: const EdgeInsets.only(left: 30.0),
//             child: Fieldtext(
//               obsec: false,
//               controller: TextEditingController(text: _text),
//             ),
//           ), ],
//                     ),
//       bottomNavigationBar: Container(
//         height: 100,
//         color: kwhitelikangrey,
//       ),
//
//
//       // BottomNavigationBar(items:[
//       //   BottomNavigationBarItem(
//       //     icon: Icon(Icons.mic_none_rounded, color: kgrey,),
//       //     backgroundColor: kwhite,
//       //     activeIcon: Icon(Icons.mic, color: kgreen,),
//       //     label: 'Start talking',
//       //   ),
//       //   BottomNavigationBarItem(
//       //     icon: Icon(Icons.mic_none_rounded, color: kgrey,),
//       //     backgroundColor: kwhite,
//       //     activeIcon: Icon(Icons.mic, color: kgreen,),
//       //     label: 'Start talking',
//       //   ),
//       // ],
//       //   currentIndex: _selectedIndex,
//       //   selectedItemColor: kgreen,
//       //   onTap: _onItemTapped,
//       // ),
//
//       // onTapDown: startListening,
//       // onTapUp: stopListening,
//       // child: Image.asset('assets/png/voice.png', width: 100),
//
//
//     );
//   }
//
//   _listenVoice() {
//     if (_speech.isListening) return;
//
//     _speech.listen(
//       onResult: (SpeechRecognitionResult result) {
//         debugPrint(result.recognizedWords);
//         setState(() {
//           _text = result.recognizedWords;
//         });
//       },
//       //listenMode: ListenMode.dictation,
//       //listenFor: Duration(seconds: 100),
//       onDevice: false,
//       cancelOnError: false,
//       // onError: (error) {
//       //   setState(() {
//       //     // handle error
//       //   });
//       // },
//       onSoundLevelChange: (level) {
//         // update UI with sound level
//       },
//     );
//   }
//
//   void startListening(_) async {
//     debugPrint('3abez ta7t');
//
//     bool microphonePermissionGranted =
//         await Permission.microphone.request().isGranted;
//     if (!microphonePermissionGranted) {
//       debugPrint('No mic');
//       // handle microphone permission not granted
//       return;
//     }
//     debugPrint('Yes mic');
//     setState(() {
//       _isListening = true;
//     });
//
//     _listenVoice();
//   }
//
//   void stopListening(_) async {
//     debugPrint('3abez fo9');
//
//     setState(() {
//       _isListening = false;
//       _messages = [
//         ..._messages,
//         ChatMessage(messageContent: _text, messageType: "sender")
//       ];
//     });
//
//     _speech.stop();
//
//     if (_text.isNotEmpty) {
//       final request = ChatCompleteText(messages: [Map.of({"role":"user","content":_text})], model: kTextDavinci3);
//       final response = await chatGPT.onChatCompletion(request: request);
//       setState(() {
//         _messages = [
//           ..._messages,
//           ChatMessage(
//               messageContent: response!.choices[0].message.content,
//               messageType: "receiver")
//         ];
//           _text = "";
//       });
//
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/constants.dart';
import '../widgets/fieldtext.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = [];
  int _selectedIndex = 0;
  final chatGPT = OpenAI.instance.build(
      token: "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",
      baseOption: HttpSetup(receiveTimeout: const Duration (seconds: 100)));

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  RecorderController controller = RecorderController();
  RecorderController controllerlimamchach = RecorderController();
  ScrollController _scrollController = ScrollController();
  bool _isTypingMode=false;


  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speech = stt.SpeechToText();
    await _speech.initialize();

    setState(() {});
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  TextEditingController _wx = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Chat to GPT!"),
        backgroundColor: kwhitelikangrey,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              !_isTypingMode ? Icons.keyboard : Icons.mic,
              color: kbluelikanwhite,
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
              setState((){_isTypingMode=!_isTypingMode;});
            },
          ),
        ],
      ),

      backgroundColor: kwhitelikangrey,
      body: Center(
        child: SingleChildScrollView(
          controller:_scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                height: 50,
              ),
              ListView.builder(
                itemCount: _messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (_messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (_messages[index].messageType == "receiver"
                              ? klightgrey
                              : knewred),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          _messages[index].messageContent,
                          style: TextStyle(fontSize: 15,color: (_messages[index].messageType == "receiver"
                  ? kblue
                      : kwhitelikangrey),))
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              //password


              SizedBox(
                height: 60,
              ),
              //button go
              // Center(
              //   child: GestureDetector(
              //     onTapDown: startListening,
              //     onTapUp: stopListening,
              //     child: Image.asset('assets/png/voice.png', width: 100),
              //   ),
              // ),
              // Padding(
              //  padding: const EdgeInsets.symmetric(horizontal: 20.0),
              // child: Fieldtext(
              // obsec: false,
              //controller: TextEditingController(text: _text),

              //),
              //),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: _isTypingMode ? 100 : 250,
        child:Padding(
          padding: EdgeInsets.symmetric(vertical:15.0),
          child:_isTypingMode ?

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Fieldtext(
                obsec: false,
                controller: _wx,
                inp: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: kwhitelikangrey,
                  ),
                  onPressed: () {
                    gptanswer(_wx.text.trim());
                    setState(() {
                      _wx.clear();
                    });
                  },
                ),
              )
          )

              :Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children : [
              if(_isListening)...[

                Text(_text),
              ]
              ,
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: _isListening
                    ? AudioWaveforms(
                  enableGesture: true,
                  size: Size(
                      MediaQuery.of(context).size.width / 2,
                      100),
                  recorderController: controller,
                  waveStyle: const WaveStyle(
                    middleLineColor:knewred,
                    waveThickness:4.0,
                    waveColor: kbluelikanwhite,
                    extendWaveform: true,
                    showMiddleLine: true,
                  ),
                  padding: const EdgeInsets.only(left: 18),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15),
                )
                    :SizedBox(height:20),
              ),

              InkWell(
                onTapDown: startListening,
                onTapUp: stopListening,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Icon(
                    Icons.mic_none,
                    color: kbluelikanwhite,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // floatingActionButton: Container(
      //   height: _isTypingMode ? 100 : 250,
      //   child:Padding(
      //     padding: EdgeInsets.symmetric(vertical:15.0),
      //     child:_isTypingMode ?
      //
      //     Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //         child: Fieldtext(
      //
      //           obsec: false,
      //           controller: TextEditingController(text: _text),
      //           onChange: (value) {
      //             setState(() {
      //               _text = value!;
      //             });
      //           },
      //           inp: IconButton(
      //             icon: Icon(
      //               Icons.send,
      //               color: kwhitelikangrey,
      //             ),
      //             onPressed: () {
      //               setState(() {
      //                 _messages = [
      //                   ..._messages,
      //                   ChatMessage(
      //                       messageContent: _text,
      //                       messageType: "sender")
      //                 ];
      //                 _text = "";
      //               });
      //             },
      //           ),
      //         )
      //     )
      //
      //         :Column(
      //       mainAxisAlignment:MainAxisAlignment.spaceBetween,
      //       children : [
      //         if(_isListening)...[
      //           Text(_text),
      //         ]
      //         ,
      //         AnimatedSwitcher(
      //           duration: const Duration(milliseconds: 200),
      //           child: _isListening
      //               ? AudioWaveforms(
      //             enableGesture: true,
      //             size: Size(
      //                 MediaQuery.of(context).size.width / 2,
      //                 100),
      //             recorderController: controller,
      //             waveStyle: const WaveStyle(
      //               middleLineColor:knewred,
      //               waveThickness:4.0,
      //               waveColor: kbluelikanwhite,
      //               extendWaveform: true,
      //               showMiddleLine: true,
      //             ),
      //             padding: const EdgeInsets.only(left: 18),
      //             margin: const EdgeInsets.symmetric(
      //                 horizontal: 15),
      //           )
      //               :SizedBox(height:20),
      //         ),
      //
      //         InkWell(
      //           onTapDown: startListening,
      //           onTapUp: stopListening,
      //           child: Padding(
      //             padding: EdgeInsets.only(top: 8.0),
      //             child: Icon(
      //               Icons.mic_none,
      //               color: kbluelikanwhite,
      //               size: 60,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),


      // BottomNavigationBar(items:[
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.mic_none_rounded, color: kgrey,),
      //     backgroundColor: kwhite,
      //     activeIcon: Icon(Icons.mic, color: kgreen,),
      //     label: 'Start talking',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.mic_none_rounded, color: kgrey,),
      //     backgroundColor: kwhite,
      //     activeIcon: Icon(Icons.mic, color: kgreen,),
      //     label: 'Start talking',
      //   ),
      // ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: kgreen,
      //   onTap: _onItemTapped,
      // ),

      // onTapDown: startListening,
      // onTapUp: stopListening,
      // child: Image.asset('assets/png/voice.png', width: 100),


    );
  }

  _listenVoice() async {
    if (_speech.isListening) return;

    _speech.listen(
      onResult: (SpeechRecognitionResult result) {
        debugPrint(result.recognizedWords);
        setState(() {
          _text = result.recognizedWords;
        });
      },
      //listenMode: ListenMode.dictation,
      //listenFor: Duration(seconds: 100),
      onDevice: false,
      cancelOnError: false,
      // onError: (error) {
      //   setState(() {
      //     // handle error
      //   });
      // },
      onSoundLevelChange: (level) {
        // update UI with sound level
      },
    );
  }

  void startListening(_) async {


    bool microphonePermissionGranted =
    await Permission.microphone.request().isGranted;
    if (!microphonePermissionGranted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),
          content: Center(child: Text(
              "Mic not granted.", style: GoogleFonts.poppins(
              color: kwhitelikangrey,
              fontSize: 24,
              fontWeight: FontWeight.w500))),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 400.0),
          backgroundColor: knewred));
      // handle microphone permission not granted
      return;
    }
    setState(() {
      _isListening = true;
    });
    //TODO: somehow waves aren't working with the function listen voice, and by commenting the controller, its working.
    // await controller.record();
    _listenVoice();
  }

  void stopListening(_) async {
    debugPrint('3abez fo9');

    debugPrint(_text);
    _speech.stop();
    controller.reset();

    final path = await controller.stop(false);
    setState((){_isListening=false;});
    if (_text.isNotEmpty) {

      setState(() {
        _messages = [
          ..._messages,
          ChatMessage(messageContent: _text, messageType: "sender")
        ];
      });

      final request = ChatCompleteText(messages: [Map.of({"role":"user","content":_text})], model: kChatGptTurboModel);
      final response = await chatGPT.onChatCompletion(request: request);
      setState(() {
        _messages = [
          ..._messages,
          ChatMessage(
              messageContent: response!.choices[0].message.content,
              messageType: "receiver")
        ];
        _text = "";
      });
    }
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }
  void gptanswer(String inputtext) async {
    if (inputtext.isNotEmpty) {
      setState(() {
        _messages = [
          ..._messages,
          ChatMessage(messageContent: inputtext, messageType: "sender")
        ];
      });
      final request = ChatCompleteText(messages: [Map.of({"role":"user","content":inputtext})], model: kChatGptTurboModel);
      final response = await chatGPT.onChatCompletion(request: request);
      setState(() {

        _messages = [
          ..._messages,
          ChatMessage(
              messageContent: response!.choices[0].message.content,
              messageType: "receiver")
        ];
        _text = "";
      });
    }
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }
}
