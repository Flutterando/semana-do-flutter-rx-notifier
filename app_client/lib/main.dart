import 'package:app_client/src/chat_page.dart';
import 'package:app_client/src/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/chat': (context) {
          final args = ModalRoute.of(context).settings.arguments as Map;
          return ChatPage(name: args['name'], room: args['room']);
        },
      },
    );
  }
}
