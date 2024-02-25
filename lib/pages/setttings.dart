import 'package:flutter/material.dart';
import 'package:palestine_supporter/const/constant.dart';
import 'package:palestine_supporter/pages/mainPage.dart';

class settingPage extends StatefulWidget {
  const settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fbgColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          settingsTitle,
          style: TextStyle(color: fColor, fontSize: fSize + 10),
        ),
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
          child: Column(
            children: [
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  messages.clear();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(clearMassegesDone),
                    duration: const Duration(seconds: 1),
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(bbgColor),
                ),
                child: Text(
                  clearMasseges,
                  style: TextStyle(
                    color: fColor,
                    fontSize: fSize,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (viewMode == "Light mode" ||
                        viewMode == "الرؤية النهارية") {
                      if (viewMode == "Light mode") {
                        viewMode = "Dark mode";
                      } else {
                        viewMode = "الرؤية الليلية";
                      }
                      fColor = Colors.blueGrey.shade700;
                      fbgColor = Colors.blueGrey.shade100;
                      fbgColor2 = Colors.blueGrey.shade200;
                      tColor = Colors.blueGrey.shade700;
                      tbgColor = Colors.blueGrey.shade100;
                      bbgColor = Colors.blueGrey.shade300;
                      bgPath = "assets/images/bg-light.png";
                    } else {
                      if (viewMode == "Dark mode") {
                        viewMode = "Light mode";
                      } else {
                        viewMode = "الرؤية النهارية";
                      }
                      fColor = Colors.blueGrey.shade100;
                      fbgColor = Colors.black54;
                      fbgColor2 = Colors.black38;
                      tColor = Colors.blueGrey.shade300;
                      tbgColor = Colors.black45;
                      bbgColor = Colors.black87;
                      bgPath = "assets/images/bg-dark.png";
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(bbgColor),
                ),
                child: Text(
                  viewMode,
                  style: TextStyle(
                    color: fColor,
                    fontSize: fSize,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(bbgColor),
                ),
                child: Text(
                  lang,
                  style: TextStyle(
                    color: fColor,
                    fontSize: fSize,
                  ),
                ),
              ),
            ],
          )),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const mainPage(),
            ),
          );
        },
        child: BottomAppBar(
          color: fbgColor,
          child: Center(
            child: Text(
              saveTitle,
              style: TextStyle(color: tColor, fontSize: fSize + 10),
            ),
          ),
        ),
      ),
    );
  }
}
