import 'package:contant_creat/pages/home-screen.dart';
import 'package:contant_creat/pages/theme-provider.dart';
import 'package:contant_creat/widgets/theme-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(darkTheme),
    child: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeNotifier.getTheme(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
