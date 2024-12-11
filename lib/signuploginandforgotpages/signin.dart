import 'package:flutter/material.dart';
import 'package:flutter_application_1/signuploginandforgotpages/forgotpassword.dart';
import 'package:flutter_application_1/signuploginandforgotpages/signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 100),
          child: SizedBox(
            height: 40,
            width: 290,
            child: TextField(
              decoration: InputDecoration(
                  label: Text("Enter your name"),
                  hintText: "Enter your name",
                  border: OutlineInputBorder()),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 40,
          width: 290,
          child: TextField(
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              label: const Text("Enter you password"),
              hintText: "password",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off)),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Forgotpassword()));
          },
          child: const SizedBox(
            child: Text("Forgot passord"),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          child: Text("Login"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, top: 20),
          child: Row(
            children: [
              const SizedBox(
                child: Text("Don't have account ?"),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: const SizedBox(
                  child: Text("Signup"),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
