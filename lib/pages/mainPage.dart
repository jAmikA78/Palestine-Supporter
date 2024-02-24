import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palestine_supporter/const/constant.dart';

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

  List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fbgColor,
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: font,
              fontSize: fSize,
              color: fColor,
            ),
          ),
        ),
      ),
      body: DashChat(
        currentUser: _user,
        onSend: (ChatMessage m) async {
          var temp = await getRedponse(m);
          setState(() {
            _messages.insert(0, m);
            _messages.insert(0, temp);
            Clipboard.setData(ClipboardData(text: temp.text));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم نسخ الرسالة'),
              ),
            );
          });
        },
        messages: _messages,
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
        c = 'ٮ';
      else if (c == 'ت')
        c = 'ٺ';
      else if (c == 'ث')
        c = 'ٽ';
      else if (c == 'س')
        c = 'ښ';
      else if (c == 'ف')
        c = 'ڡ';
      else if (c == 'ك')
        c = 'ڪ';
      else if (c == 'ن')
        c = 'ڼ';
      else if (c == 'ي') c = 'ى';

      temp += c;
    }
    return ChatMessage(
        text: temp,
        user: _bot,
        createdAt: DateTime.now(),
        customProperties: {'backgroundColor': fbgColor2});
  }
}
