import 'package:bexeltask/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xffb161D6F),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width * .3,
                          height: size.height * .2,
                          child: Image.asset(
                            "assets/images/hands.png",
                          ),
                        ),
                        Container(
                          width: size.width * .3,
                          height: size.height * .2,
                          child: Image.asset(
                            "assets/images/handsBack.png",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Text(
                      "Let's help together",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                    Text(
                      "in this pandemic!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Text(
                      "You can get medical and food service at your doorsteps and also anyone can donate some fund for covid patients.",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ]),
            ),
            Container(
              height: size.height * .33,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Path.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Choose your category",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => HomeScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: size.width * .20,
                                height: size.height * .15,
                                child: Image.asset(
                                  "assets/images/medicines.png",
                                ),
                              ),
                              Text(
                                "Medical",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.width * .20,
                                height: size.height * .15,
                                child: Image.asset(
                                  "assets/images/hot-food.png",
                                ),
                              ),
                              Text(
                                "Food",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.width * .20,
                                height: size.height * .15,
                                child: Image.asset(
                                  "assets/images/giving.png",
                                ),
                              ),
                              Text(
                                "Donate",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
