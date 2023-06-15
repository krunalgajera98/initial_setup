import 'package:flutter/material.dart';
import 'package:initial_setup/Utils/AppHelper/size_helper.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('𝙆𝙍𝙐𝙉𝘼𝙇'), centerTitle: true, toolbarHeight: 22),
        body: Column(
          children: [],
        ),
      ),
    ).beResponsive;
  }
}
