import 'package:dunzo/pages/signup.dart';
import 'package:dunzo/widget/content_model.dart';
import 'package:dunzo/widget/widget_support.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(contents[i].image,
                          height: 450,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(contents[i].title,
                          style: AppWidget.headerTextFieldStyle()),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(contents[i].description,
                          style: AppWidget.boldTextFieldStyle()),
                    ],
                  ),
                );
              }),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (currentIndex == contents.length - 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUp()));
            }
            _controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn);
          },
          child: Container(
            decoration: const BoxDecoration(color: Colors.red),
            height: 60,
            padding: const EdgeInsets.only(left: 130, top: 7),
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: const Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins1",
              ),
            ),
          ),
        )
      ]),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black),
    );
  }
}
