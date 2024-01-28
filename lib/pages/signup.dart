import "package:dunzo/widget/widget_support.dart";
import "package:flutter/material.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LogInState();
}

class _LogInState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromRGBO(59, 225, 139, 1.0),
                    Color.fromRGBO(72, 232, 160, 1.0),
                  ])),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.2),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: const Text("")),
            Container(
              margin: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "images/dunzoSignup.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(height: 5.0),
                        Text(
                          "Welcome to Dunzo Family",
                          style: AppWidget.boldTextFieldStyle(),
                        )
                      ],
                    ),
                  ),

                  // SIGNUP BOX
                  const SizedBox(height: 10.0),
                  // ignore: avoid_unnecessary_containers
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(35.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10.0,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          const Text(
                            "SignUp",
                            style: TextStyle(
                                fontSize: 37.0,
                                fontFamily: "Poppins1",
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 20.0),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: AppWidget.lightTextFieldStyle(),
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: AppWidget.lightTextFieldStyle(),
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: AppWidget.lightTextFieldStyle(),
                              prefixIcon: const Icon(Icons.password_outlined),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot Password?",
                                style: AppWidget.lightTextFieldStyle(),
                              )),

                          // ignore: avoid_unnecessary_containers
                          Container(
                            margin: const EdgeInsets.only(top: 35.0),
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(59, 225, 139, 1.0),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Poppins1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
