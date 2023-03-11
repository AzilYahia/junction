import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/fieldtext.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

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

  final chatGPT = OpenAI.instance.build(
      token: "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",
      baseOption: HttpSetup(receiveTimeout: 60000));

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          _messages[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Fieldtext(
                  obsec: false,
                  controller: TextEditingController(text: _text),
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

              SizedBox(
                height: 60,
              ),
              //button go
              Center(
                child: GestureDetector(
                  onTapDown: startListening,
                  onTapUp: stopListening,
                  child: Image.asset('assets/png/voice.png', width: 100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listenVoice() {
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
    debugPrint('3abez ta7t');

    bool microphonePermissionGranted =
        await Permission.microphone.request().isGranted;
    if (!microphonePermissionGranted) {
      debugPrint('No mic');
      // handle microphone permission not granted
      return;
    }
    debugPrint('Yes mic');
    setState(() {
      _isListening = true;
    });

    _listenVoice();
  }

  void stopListening(_) async {
    debugPrint('3abez fo9');

    setState(() {
      _isListening = false;
      _messages = [
        ..._messages,
        ChatMessage(messageContent: _text, messageType: "sender")
      ];
    });
    
    _speech.stop();
    
    if (_text.isNotEmpty) {
      final request = CompleteText(prompt: _text, model: kTranslateModelV3);
      final response = await chatGPT!.onCompleteText(request: request);
      setState(() {
        _messages = [
          ..._messages,
          ChatMessage(
              messageContent: response!.choices[0].text,
              messageType: "receiver")
        ];
          _text = "";
      });
      
    }
  }
}
