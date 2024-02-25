// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final ChatUser _bot =
      ChatUser(id: '2', firstName: 'Palestine', lastName: 'Bot');
  ChatMessage firstMessage = ChatMessage(
      user: ChatUser(id: '2', firstName: 'Palestine', lastName: 'Bot'),
      createdAt: DateTime.now(),
      text: firstMessageText);

  @override
  Widget build(BuildContext context) {
    (messages.length == 0) ? messages.insert(0, firstMessage) : fColor = fColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fbgColor,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: font,
            fontSize: fSize,
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
            var temp = await getRedponse(m);
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
        ),
      ),
    );
  }

  Future<ChatMessage> getRedponse(ChatMessage m) async {
    String x = m.text;
    String temp = '';
    for (int i = 0; i < x.length; i++) {
      var c = x[i];
      if (c == 'أ' || c == 'إ' || c == 'آ')
        c = 'ا';
      else if (c == 'ب')
        c = 'پ';
      else if (c == 'ت')
        c = 'ٺ';
      else if (c == 'ث')
        c = 'ٽ';
      else if (c == 'ج')
        c = 'چ';
      else if (c == 'ر')
        c = 'ڕ';
      else if (c == 'ز')
        c = 'ژ';
      else if (c == 'س')
        c = 'ښ';
      else if (c == 'ف')
        c = 'ڡ';
      else if (c == 'ق')
        c = 'ڤ';
      else if (c == 'ك')
        c = 'ڪ';
      else if (c == 'ل')
        c = 'ڵ';
      else if (c == 'ن')
        c = 'ڼ';
      else if (c == 'و')
        c = 'ۆ';
      else if (c == 'ي')
        c = 'ى';
      else
        c = c;
      temp += c;
    }
    return ChatMessage(
        text: temp,
        user: _bot,
        createdAt: DateTime.now(),
        customProperties: {'backgroundColor': fbgColor2});
  }
}
