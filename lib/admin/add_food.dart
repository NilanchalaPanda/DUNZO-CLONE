// import 'package:dunzo/widget/widget_support.dart';
// import 'package:flutter/material.dart';

// class AddFood extends StatefulWidget {
//   const AddFood({Key? key}) : super(key: key);

//   @override
//   State<AddFood> createState() => _AddFoodState();
// }

// class _AddFoodState extends State<AddFood> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(Icons.arrow_back_ios_new_outlined,
//               color: Color(0xFF373866)),
//         ),
//         centerTitle: true,
//         title: Text(
//           "Add Items",
//           style: AppWidget.headerTextFieldStyle(),
//         ),
//       ),
//       body: Container(
//         margin:
//             EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Upload the Item Picture",
//                 style: AppWidget.boldTextFieldStyle()),
//             const SizedBox(height: 20.0),
//             Center(
//               child: Material(
//                 elevation: 5.0,
//                 borderRadius: BorderRadius.circular(20.0),
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black, width: 1.5),
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: const Icon(
//                     Icons.camera_alt_outlined,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30.0),
//             Text(
//               "Item Name",
//               style: AppWidget.boldTextFieldStyle(),
//             ),
//             const SizedBox(height: 30.0),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Color(0xDDececf8),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextField(
//                 decoration: InputDecoration(border: InputBorder.none, hintText: "Enter Item Name", hintStyle: AppWidget.lightTextFieldStyle(),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:dunzo/service/database.dart';
import 'package:dunzo/widget/widget_support.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> fooditems = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];
  String? value;
// ignore: unnecessary_new
  TextEditingController namecontroller = new TextEditingController();

// ignore: unnecessary_new
  TextEditingController pricecontroller = new TextEditingController();

// ignore: unnecessary_new
  TextEditingController detailscontroller = new TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        namecontroller.text != "" &&
        pricecontroller.text != "" &&
        detailscontroller.text != "") {
      // String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("itemImages");
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": namecontroller.text,
        "Price": pricecontroller.text,
        "Detail": detailscontroller.text
      };
      await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Your item has been added successfully",
              style: TextStyle(fontSize: 20.0),
            ))));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866)),
        ),
        centerTitle: true,
        title: Text(
          "Add Items",
          style: AppWidget.headerTextFieldStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture",
                  style: AppWidget.boldTextFieldStyle()),
              const SizedBox(height: 20.0),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),
              const SizedBox(height: 30.0),
              Text(
                "Item Name",
                style: AppWidget.boldTextFieldStyle(),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xDDececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Item Name",
                    hintStyle: AppWidget.lightTextFieldStyle(),
                  ),
                ),
              ), // Added the missing closing parenthesis for Container

              const SizedBox(height: 30.0),
              Text(
                "Item Price",
                style: AppWidget.boldTextFieldStyle(),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xDDececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: pricecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Item Price",
                    hintStyle: AppWidget.lightTextFieldStyle(),
                  ),
                ),
              ), // Added the missing closing parenthesis for Container

              const SizedBox(height: 30.0),
              Text(
                "Item Detials",
                style: AppWidget.boldTextFieldStyle(),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xDDececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailscontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Item Price",
                    hintStyle: AppWidget.lightTextFieldStyle(),
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Select Category",
                style: AppWidget.boldTextFieldStyle(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: fooditems
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
                          )))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                  dropdownColor: Colors.white,
                  hint: const Text("Select Category"),
                  iconSize: 36,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  value: value,
                )),
              ),
              const SizedBox(
                height: 30.0,
              ),

              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding:const EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ], // Added the missing closing parenthesis for Column
          ),
        ),
      ),
    );
  }
}
