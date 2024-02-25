// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:palestine_supporter/const/constant.dart';

Future<ChatMessage> getRedponse(ChatMessage m, ChatUser bot) async {
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
      user: bot,
      createdAt: DateTime.now(),
      customProperties: {'backgroundColor': fbgColor2});
}
