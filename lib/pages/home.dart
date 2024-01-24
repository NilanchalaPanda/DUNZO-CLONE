import 'package:dunzo/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello Nilanchala,",
                  style: AppWidget.boldTextFieldStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                )
              ],
            ),

            const SizedBox(height: 15.0),
            // MAIN HEADING -
            Text(
              "Order Your Food Now!",
              style: AppWidget.headerTextFieldStyle(),
            ),
            // SUBHEADING -
            Text(
              "Discover and Get Fresh Vegetables",
              style: AppWidget.lightTextFieldStyle(),
            ),

            const SizedBox(height: 10.0),

            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Material(
                    elevation: 20.0,
                    child: Container(
                      child: Image.asset(
                        "images/mainBanner.jpg",
                        height: 150,
                        width: 340,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10.0),

            // Row(
            //   children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(15.0),
            //       child: Material(
            //         elevation: 20.0,
            //         child: Container(
            //           child: Image.asset(
            //             "images/fruitBasket.png",
            //             height: 150,
            //             width: 150,
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Material(
                    elevation: 20.0,
                    child: Container(
                      child: Image.asset(
                        "images/fruitBasket.png",
                        height: 160,
                        width: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Add some space between the images
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Material(
                    elevation: 20.0,
                    child: Container(
                      child: Image.asset(
                        "images/fruitBasket.png", // Replace with your second image path
                        height: 160,
                        width: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
