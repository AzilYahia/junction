// import 'dart:io';
//
// import 'package:enough_mail/enough_mail.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:googleapis/gmail/v1.dart' show
// Label, Profile, GmailApi, Filter, Message, UsersResourceApi, Thread, BatchDeleteMessagesRequest, BatchDeleteMessagesRequest, Draft, UsersMessagesAttachmentsResourceApi;
//
//
//
// String userName = 'user.name';
// String password = 'password';
// String domain = 'domain.com';
// String imapServerHost = 'imap.$domain';
// int imapServerPort = 993;
// bool isImapServerSecure = true;
// String popServerHost = 'pop.$domain';
// int popServerPort = 995;
// bool isPopServerSecure = true;
// String smtpServerHost = 'smtp.$domain';
// int smtpServerPort = 465;
// bool isSmtpServerSecure = true;
//
// // ignore: avoid_void_async
// void main() async {
//   //await mailExample();
//   await discoverExample();
//   await imapExample();
//   await smtpExample();
//   await popExample();
//   exit(0);
// }
//
// /// Auto discover settings from email address example
// Future<void> discoverExample() async {
//   const email = 'someone@enough.de';
//   final config = await Discover.discover(email, isLogEnabled: false);
//   if (config == null) {
//     print('Unable to discover settings for $email');
//   } else {
//     print('Settings for $email:');
//     for (final provider in config.emailProviders!) {
//       print('provider: ${provider.displayName}');
//       print('provider-domains: ${provider.domains}');
//       print('documentation-url: ${provider.documentationUrl}');
//       print('Incoming:');
//       provider.incomingServers?.forEach(print);
//       print(provider.preferredIncomingServer);
//       print('Outgoing:');
//       provider.outgoingServers?.forEach(print);
//       print(provider.preferredOutgoingServer);
//     }
//   }
// }
//
// /// Builds a simple example message
// MimeMessage buildMessage() {
//   final builder = MessageBuilder.prepareMultipartAlternativeMessage(
//     plainText: 'Hello world!',
//     htmlText: '<p>Hello world!</p>',
//   )
//     ..from = [MailAddress('Personal Name', 'sender@domain.com')]
//     ..to = [
//       MailAddress('Recipient Personal Name', 'recipient@domain.com'),
//       MailAddress('Other Recipient', 'other@domain.com')
//     ];
//   return builder.buildMimeMessage();
// }
//
// /// Builds an example message with attachment
// Future<MimeMessage> buildMessageWithAttachment() async {
//   final builder = MessageBuilder()
//     ..from = [MailAddress('Personal Name', 'sender@domain.com')]
//     ..to = [
//       MailAddress('Recipient Personal Name', 'recipient@domain.com'),
//       MailAddress('Other Recipient', 'other@domain.com')
//     ]
//     ..addMultipartAlternative(
//       plainText: 'Hello world!',
//       htmlText: '<p>Hello world!</p>',
//     );
//   final file = File.fromUri(Uri.parse('file://./document.pdf'));
//   await builder.addFile(file, MediaSubtype.applicationPdf.mediaType);
//   return builder.buildMimeMessage();
// }
//
// /// High level mail API example
// Future<void> mailExample() async {
//   final email = '$userName@$domain';
//   print('discovering settings for  $email...');
//   final config = await Discover.discover(email);
//   if (config == null) {
//     // note that you can also directly create an account when
//     // you cannot auto-discover the settings:
//     // Compare the [MailAccount.fromManualSettings]
//     // and [MailAccount.fromManualSettingsWithAuth]
//     // methods for details.
//     print('Unable to auto-discover settings for $email');
//     return;
//   }
//   print('connecting to ${config.displayName}.');
//   final account =
//   MailAccount.fromDiscoveredSettings('my account', email, password, config);
//   final mailClient = MailClient(account, isLogEnabled: true);
//   try {
//     await mailClient.connect();
//     print('connected');
//     final mailboxes =
//     await mailClient.listMailboxesAsTree(createIntermediate: false);
//     print(mailboxes);
//     await mailClient.selectInbox();
//     final messages = await mailClient.fetchMessages(count: 20);
//     messages.forEach(printMessage);
//     mailClient.eventBus.on<MailLoadEvent>().listen((event) {
//       print('New message at ${DateTime.now()}:');
//       printMessage(event.message);
//     });
//     await mailClient.startPolling();
//     // generate and send email:
//     final mimeMessage = buildMessage();
//     await mailClient.sendMessage(mimeMessage);
//   } on MailException catch (e) {
//     print('High level API failed with $e');
//   }
// }
//
// /// Low level IMAP API usage example
// Future<void> imapExample() async {
//   final client = ImapClient(isLogEnabled: false);
//   try {
//     await client.connectToServer(imapServerHost, imapServerPort,
//         isSecure: isImapServerSecure);
//     await client.login(userName, password);
//     final mailboxes = await client.listMailboxes();
//     print('mailboxes: $mailboxes');
//     await client.selectInbox();
//     // fetch 10 most recent messages:
//     final fetchResult = await client.fetchRecentMessages(
//         messageCount: 10, criteria: 'BODY.PEEK[]');
//     fetchResult.messages.forEach(printMessage);
//     await client.logout();
//   } on ImapException catch (e) {
//     print('IMAP failed with $e');
//   }
// }
//
// /// Low level SMTP API example
// Future<void> smtpExample() async {
//   final client = SmtpClient('enough.de', isLogEnabled: true);
//   try {
//     await client.connectToServer(smtpServerHost, smtpServerPort,
//         isSecure: isSmtpServerSecure);
//     await client.ehlo();
//     if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
//       await client.authenticate('user.name', 'password', AuthMechanism.plain);
//     } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
//       await client.authenticate('user.name', 'password', AuthMechanism.login);
//     } else {
//       return;
//     }
//     // generate and send email:
//     final mimeMessage = await buildMessageWithAttachment();
//     final sendResponse = await client.sendMessage(mimeMessage);
//     print('message sent: ${sendResponse.isOkStatus}');
//   } on SmtpException catch (e) {
//     print('SMTP failed with $e');
//   }
// }
//
// /// Low level POP3 API example
// Future<void> popExample() async {
//   final client = PopClient(isLogEnabled: false);
//   try {
//     await client.connectToServer(popServerHost, popServerPort,
//         isSecure: isPopServerSecure);
//     await client.login(userName, password);
//     // alternative login:
//     // await client.loginWithApop(userName, password);
//     final status = await client.status();
//     print('status: messages count=${status.numberOfMessages}, '
//         'messages size=${status.totalSizeInBytes}');
//     final messageList = await client.list(status.numberOfMessages);
//     print('last message: id=${messageList.first.id} '
//         'size=${messageList.first.sizeInBytes}');
//     var message = await client.retrieve(status.numberOfMessages);
//     printMessage(message);
//     message = await client.retrieve(status.numberOfMessages + 1);
//     print('trying to retrieve newer message succeeded');
//     await client.quit();
//   } on PopException catch (e) {
//     print('POP failed with $e');
//   }
// }
//
// void printMessage(MimeMessage message) {
//   print('from: ${message.from} with subject "${message.decodeSubject()}"');
//   if (!message.isTextPlainMessage()) {
//     print(' content-type: ${message.mediaType}');
//   } else {
//     final plainText = message.decodeTextPlainPart();
//     if (plainText != null) {
//       final lines = plainText.split('\r\n');
//       for (final line in lines) {
//         if (line.startsWith('>')) {
//           // break when quoted text starts
//           break;
//         }
//         print(line);
//       }
//     }
//   }
// }
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn(
//     scopes: [
//       GmailApi.MailGoogleComScope,
//       GmailApi.GmailComposeScope,
//       GmailApi.MailGoogleComScope,
//       GmailApi.GmailInsertScope,
//       GmailApi.GmailLabelsScope,
//       GmailApi.GmailMetadataScope,
//       GmailApi.GmailModifyScope,
//       GmailApi.GmailReadonlyScope,
//       GmailApi.GmailSendScope,
//       GmailApi.GmailSettingsSharingScope,
//       'email',
//       'https://www.googleapis.com/auth/gmail.readonly',
//     ]
// );
//
//
// final httpClient = googleSignIn.currentUser?.authHeaders;
//
//
//
// class GmailApi{
//   static const MailGoogleComScope = "https://mail.google.com/";
//   static const GmailComposeScope = "https://www.googleapis.com/auth/gmail.compose";
//   static const GmailInsertScope = "https://www.googleapis.com/auth/gmail.insert";
//   static const GmailLabelsScope = "https://www.googleapis.com/auth/gmail.labels";
//   static const GmailMetadataScope = "https://www.googleapis.com/auth/gmail.metadata";
//   static const GmailModifyScope = "https://www.googleapis.com/auth/gmail.modify";
//   static const GmailReadonlyScope = "https://www.googleapis.com/auth/gmail.readonly";
//   static const GmailSendScope = "https://www.googleapis.com/auth/gmail.send";
//   static const GmailSettingsBasicScope = "https://www.googleapis.com/auth/gmail.settings.basic";
//   static const GmailSettingsSharingScope = "https://www.googleapis.com/auth/gmail.settings.sharing";
//
//
//   final commons.ApiRequester _requester;
//
//   UsersResourceApi get users => new UsersResourceApi(_requester);
//
//   GmailApi(http.Client client,
//       {core.String rootUrl = "https://www.googleapis.com/",
//         core.String servicePath = "gmail/v1/users/"})
//       : _requester = commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
// }

//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------

import 'dart:async';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GmailApi {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/gmail.readonly']);

  Future<http.Response> _get(String url) async {
    final headers = await _getHeaders();
    final response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  Future<Map<String, String>> _getHeaders() async {
    final currentUser = await _googleSignIn.signInSilently();
    final headers = {'Authorization': 'Bearer ${await currentUser!.authHeaders}'};
    return headers;
  }

  Future<List<dynamic>> getMessages() async {
    final response = await _get('https://www.googleapis.com/gmail/v1/users/me/messages?maxResults=10');
    final jsonResponse = json.decode(response.body);
    final messages = jsonResponse['messages'];
    return messages;
  }

  Future<Map<String, dynamic>> getMessage(String messageId) async {
    final response = await _get('https://www.googleapis.com/gmail/v1/users/me/messages/$messageId?format=full');
    final jsonResponse = json.decode(response.body);
    return jsonResponse;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail API Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _gmailApi = GmailApi();
  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    final messages = await _gmailApi.getMessages();
    for (final message in messages) {
      final messageId = message['id'];
      final threadId = message['threadId'];
      final snippet = message['snippet'];
      print('Message ID: $messageId');
      print('Thread ID: $threadId');
      print('Snippet: $snippet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail API Demo'),
      ),
      body: Center(
        child: Text('Fetching Gmail messages...'),
      ),
    );
  }
}
