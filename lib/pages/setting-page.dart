import 'package:contant_creat/pages/theme-provider.dart';
import 'package:contant_creat/widgets/theme-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkTheme = true;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);
    isDarkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Setting"),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
                title: Text("Switch Theme"),
                trailing: Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    setState(() {
                      isDarkTheme = value;
                    });
                    themeChanged(value, themeNotifier);
                  },
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.lightBlue,
                )),
          ],
        ),
      ),
    );
  }

  void themeChanged(bool value, ThemeProvider themeProvider) async {
    (value)
        ? themeProvider.setTheme(darkTheme)
        : themeProvider.setTheme(lightTheme);
   
  }
}
