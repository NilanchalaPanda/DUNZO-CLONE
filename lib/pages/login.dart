import "package:flutter/material.dart";

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2,
          decoration: const BoxDecoration(gradient: LinearGradient( begin: Alignment.topLeft, end: Alignment.bottomRight , colors: [
            Color(0xFFff5c30),
            Color(0xFFe74b1a),
          ])),
        ),
      ])),
    );
  }
}