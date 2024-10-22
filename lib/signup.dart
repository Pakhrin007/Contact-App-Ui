import 'package:flutter/material.dart';
import 'package:practice/register.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red.shade400, Colors.white])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Container(
              height: 650,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                border: Border(
                  top: BorderSide(width: 2),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const SizedBox(
                    height: 60,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Name",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 60,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Number",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 60,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 60,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),

                  //register btn
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red.shade600,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(45),
                              bottomRight: Radius.circular(45)),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'pacificio',
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 100,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ),
                );
              },
              child: const Text(
                "Already have Account? Login !!",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    // fontFamily: 'pacificio',
                    letterSpacing: 1),
              ),
            ),
          ),
          const Positioned(
            top: 60,
            left: 40,
            child: Text(
              "Register !!",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontFamily: 'pacificio',
                  letterSpacing: 2),
            ),
          ),
        ],
      ),
    );
  }
}
