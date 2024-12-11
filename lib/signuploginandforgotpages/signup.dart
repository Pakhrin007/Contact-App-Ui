import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPasswordVisible = false;
  bool isconfirmpasswirdvisibile = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                    label: Text(
                      "Enter your Email",
                    ),
                    hintText: "Email",
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: TextField(
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  label: Text(
                    "Enter your password",
                  ),
                  hintText: "password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: TextField(
                obscureText: !isconfirmpasswirdvisibile,
                decoration: InputDecoration(
                    label: Text(
                      "confirm your password",
                    ),
                    hintText: "confirm password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isconfirmpasswirdvisibile =
                                !isconfirmpasswirdvisibile;
                          });
                        },
                        icon: Icon(isconfirmpasswirdvisibile
                            ? Icons.visibility
                            : Icons.visibility_off))),
              ),
            ),
          ),
          Container(
            child: Text("Signup"),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text("already have an account"),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text("Login"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
