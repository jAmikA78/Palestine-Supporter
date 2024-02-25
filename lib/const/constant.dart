import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

String mainTitle = "فلسطين حرة";

String userFname = 'Ahmed';
String userLname = 'Ibrahim';

double fSize = 35;

Color fColor = Colors.blueGrey.shade700;
Color fbgColor = Colors.blueGrey.shade100;
Color fbgColor2 = Colors.blueGrey.shade200;
Color tColor = Colors.blueGrey.shade700;
Color tbgColor = Colors.blueGrey.shade100;
Color bbgColor = Colors.blueGrey.shade300;

String bgPath = "assets/images/bg-light.png";

String firstMessageText = """
اهلا بك يا داعم القضية :) 
هذا التطبيق يهدف لدعم ومساعدة ابطال الشعب الفلسطينى من خلال دعم اصحاب الرأى الابطال من امثالكم عن طريق التعديل على منشوراتكم لنتفادى ان يتم حظرها عن طريق الخوارزميات المسؤولة عن ذلك على تطبيقات التواصل الاجتماعى 
 اترك رسالتك او منشورك ودع الباقى لنا
 """;
String settingsTitle = "الاعدادات";
String viewMode = "الرؤية الليلية";
String clearMasseges = "محو السجل ";
String clearMassegesDone = "تم مسح السجل";
String lang = "English";
String saveTitle = "حفظ";
String copyMessageString = "تم نسخ النص";

List<ChatMessage> messages = <ChatMessage>[];
