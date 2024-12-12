import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/dashboard.dart';
import 'package:flutter_application_1/signuploginandforgotpages/forgotpassword.dart';
import 'package:flutter_application_1/signuploginandforgotpages/signup.dart';
import 'package:get/get.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    try {
      if (email.text.isEmpty || password.text.isEmpty) {
        Get.snackbar("Error", "please fill the input box");
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      Get.snackbar("Login", "Login successfully");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred.");
    }
  }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SizedBox(
            height: 40,
            width: 290,
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                  label: Text("Enter your email"),
                  hintText: "your email",
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
            controller: password,
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Forgotpassword()));
          },
          child: const SizedBox(
            child: Text("Forgot passord"),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            login();
          },
          child: const SizedBox(
            child: Text("Login"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, top: 20),
          child: Row(
            children: [
              const SizedBox(
                child: Text("Don't have account ?"),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup()));
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
