import 'package:loja/shared/widgets/app_drawer.dart';
import 'package:loja/styles/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Loja'),
        leading: new IconButton(
          icon: new Icon(Icons.sort),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: myColor,
        ),
        child: new AppDrawer(),
      ),
      body: Container(),
    );
  }
}
