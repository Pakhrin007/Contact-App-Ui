import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/dashboard/dashboard.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPasswordVisible = false;
  bool isconfirmpasswirdvisibile = false;

  String? selectedGender;
  String? selectedCountry;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  signup() async {
    try {
      if (email.text.isEmpty ||
          password.text.isEmpty ||
          fullName.text.isEmpty) {
        Get.snackbar("Error", "Please fill all input fields");
        return;
      }
      if (password.text != confirmpassword.text) {
        Get.snackbar("Error", "Passwords do not match");
        return;
      }
      if (selectedGender == null || selectedCountry == null) {
        Get.snackbar("Error", "Please select gender and country");
        return;
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      await storeUserDetails(
          fullName.text, email.text, selectedGender!, selectedCountry!);

      Get.snackbar("Success", "Signup successful!");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      Get.snackbar("Error", "Signup failed: ${e.toString()}");
    }
  }

  Future<void> storeUserDetails(
      String fullName, String email, String gender, String country) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'fullname': fullName,
        'email': email,
        'gender': gender,
        'country': country,
        'createAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Handle any errors in storing user details
      Get.snackbar("Error", "Could not save user details: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              child: TextField(
                controller: fullName,
                decoration: const InputDecoration(
                    label: Text(
                      "Enter your Fullname",
                    ),
                    hintText: "fullname",
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                label: Text("Gender"),
                border: OutlineInputBorder(),
              ),
              value: selectedGender,
              hint: const Text("Select your gender"),
              items: ['Male', 'Female', 'Other']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  label: Text("country"),
                ),
                items: ['Nepal', 'India']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                value: selectedCountry,
                hint: Text("Select your country"),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
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
                controller: password,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  label: const Text(
                    "Enter your password",
                  ),
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
                controller: confirmpassword,
                obscureText: !isconfirmpasswirdvisibile,
                decoration: InputDecoration(
                    label: const Text(
                      "confirm your password",
                    ),
                    hintText: "confirm password",
                    border: const OutlineInputBorder(),
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
          GestureDetector(
            onTap: () {
              signup();
            },
            child: Container(
              child: const Text("Signup"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: const Text("already have an account"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: const Text("Login"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
