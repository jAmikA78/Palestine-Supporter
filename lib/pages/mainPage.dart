// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palestine_supporter/const/agorithem.dart';
import 'package:palestine_supporter/const/constant.dart';
import 'package:palestine_supporter/pages/setttings.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  final ChatUser _user =
      ChatUser(id: '1', firstName: userFname, lastName: userLname);
  final ChatUser bot =
      ChatUser(id: '2', firstName: 'Palestine', lastName: 'Bot');
  ChatMessage firstMessage = ChatMessage(
      user: ChatUser(id: '2', firstName: 'Palestine', lastName: 'Bot'),
      createdAt: DateTime.now(),
      text: firstMessageText);

  @override
  Widget build(BuildContext context) {
    (messages.isEmpty) ? messages.insert(0, firstMessage) : fColor = fColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: fbgColor,
        title: Text(
          mainTitle,
          style: TextStyle(
            fontSize: fSize + 10,
            color: fColor,
          ),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settingPage()));
              },
              child: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgPath),
            fit: BoxFit.cover,
          ),
        ),
        child: DashChat(
          currentUser: _user,
          onSend: (ChatMessage m) async {
            var temp = await getRedponse(m, bot);
            setState(
              () {
                messages.insert(0, m);
                messages.insert(0, temp);
                Clipboard.setData(ClipboardData(text: temp.text));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(copyMessageString),
                  duration: const Duration(seconds: 1),
                ));
              },
            );
          },
          messages: messages,
          messageOptions: MessageOptions(
            currentUserContainerColor: fbgColor,
            containerColor: fbgColor2,
            textColor: fColor,
            messageTextBuilder: (message, previousMessage, nextMessage) => Text(
              message.text,
              style: TextStyle(fontSize: fSize),
            ),
            onLongPressMessage: (ChatMessage message) {
              Clipboard.setData(ClipboardData(text: message.text));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(copyMessageString),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
