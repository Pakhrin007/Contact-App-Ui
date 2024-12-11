import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter your email",
                  label: Text("Email"),
                  border: OutlineInputBorder()),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(color: Colors.red.shade200),
          child: Center(child: Text("Send Link")),
        )
      ],
    ));
  }
}
