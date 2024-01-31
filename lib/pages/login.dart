import "package:dunzo/pages/home.dart";
import "package:dunzo/pages/signup.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:dunzo/widget/widget_support.dart";

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // AUTH -
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "User not found",
              style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 255, 191),),
            ),
          ),
        );
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Wrong password",
              style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 255, 191),),
            ),
          ),
        );
      }
    }
  }

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
                    Color.fromRGBO(76, 144, 206, 1.0),
                    Color.fromRGBO(76, 152, 228, 1.0),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/dunzoLogin.png",
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Column(
                        children: [
                          const SizedBox(height: 5.0),
                          Text(
                            "I see! You came back :)",
                            style: AppWidget.boldTextFieldStyle(),
                          )
                        ],
                      ),
                    ),

                    // SIGNUP BOX
                    // ignore: avoid_unnecessary_containers
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(35.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 10.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10.0),
                              const Text(
                                "LogIn",
                                style: TextStyle(
                                    fontSize: 37.0,
                                    fontFamily: "Poppins1",
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: emailController,
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return "Please enter your email ID";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: AppWidget.lightTextFieldStyle(),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: passwordController,
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return "Please enter your password";
                                  }
                                  return null;
                                },
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
                              GestureDetector(
                                onTap: (){
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email=emailController.text;
                                      password=passwordController.text;
                                    });
                                    userLogin();
                                  }

                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 35.0),
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 10.0),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(115, 148, 255, 1.0),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: "Poppins1",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: Text(
                        "Don't have an account? SignUp",
                        style: AppWidget.boldTextFieldStyle(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
