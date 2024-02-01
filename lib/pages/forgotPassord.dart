import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController mailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(children: [
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.topCenter,
            child: const Text(
              "Password Recovery",
              style: TextStyle(
                color: Colors.black, 
                fontSize: 30.0, 
                fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Enter your mail", 
              style: TextStyle(
                color: Colors.black, 
                fontSize: 20.0,
            ),),
            Expanded(
              child: Form(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0), 
                  child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    controller: mailController,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return "Please enter your email ID";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                      prefixIcon: Icon(Icons.person, color: Colors.black, size: 30.0),
                      border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        padding: EdgeInsets.all(10),
                      )
                    ],
                  ),
                )
              ],
            ),),),)
        ]),
      ),
    );
  }
}