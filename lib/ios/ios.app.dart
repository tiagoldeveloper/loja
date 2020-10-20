import 'package:flutter/cupertino.dart';
import 'package:loja/ios/home.page.dart';

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Loja',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
