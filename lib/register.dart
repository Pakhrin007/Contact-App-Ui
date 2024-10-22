import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                  topRight: Radius.circular(45),
                ),
                border: Border(
                  top: BorderSide(width: 2),
                ),
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    height: 60,
                    width: 350,
                    child: TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                        hintText: "Enter Your Username",
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(40),
                        //   ),
                        // ),
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: 350,
                    child: TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(40),
                        //   ),
                        // ),
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: 40,
            child: Text(
              "Login !!",
              style: TextStyle(
                  color: Colors.black, fontSize: 36, fontFamily: 'pacificio'),
            ),
          ),
          // Align(

          //   alignment: Alignment.bottomRight,
          //   child: Text(
          //     "Forgot password",
          //     style: TextStyle(fontSize: 15),
          //   ),
          // )
          Positioned(
            top: 400,
            left: 230,
            child: Text(
              "Forgot Password ?",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Positioned(
            top: 500,
            left: 130,
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red.shade600,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'pacificio',
                      letterSpacing: 3),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
