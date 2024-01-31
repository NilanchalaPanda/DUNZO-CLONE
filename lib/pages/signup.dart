import "package:dunzo/pages/home.dart";
import "package:dunzo/pages/login.dart";
import "package:dunzo/widget/widget_support.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // AUTHENTICATION -
  String email = "", password = "", name = "";

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    // ignore: unnecessary_null_comparison
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Registered successfully",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color.fromARGB(255, 0, 255, 191),
              content: Text(
                "The password provided is too weak.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color.fromARGB(255, 0, 255, 191),
              content: Text(
                "The account already exists for that email.",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        }
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
              child: SingleChildScrollView(
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
                          borderRadius: BorderRadius.circular(20)),
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
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 37.0,
                                    fontFamily: "Poppins1",
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: AppWidget.lightTextFieldStyle(),
                                  prefixIcon:
                                      const Icon(Icons.person_2_outlined),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your email";
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your passord";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: AppWidget.lightTextFieldStyle(),
                                  prefixIcon:
                                      const Icon(Icons.password_outlined),
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
                                onTap: () async{
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                      name = nameController.text;
                                      password = passwordController.text;
                                    });
                                  }
                                  registration();
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
                                          const Color.fromRGBO(59, 225, 139, 1.0),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "SIGN UP",
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
                              builder: (context) => const LogIn()),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
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
