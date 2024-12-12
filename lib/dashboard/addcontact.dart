import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addcontact extends StatefulWidget {
  const Addcontact({super.key});

  @override
  State<Addcontact> createState() => _AddcontactState();
}

class _AddcontactState extends State<Addcontact> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  add() async {
    try {
      if (name.text.isEmpty || number.text.isEmpty) {
        Get.snackbar("Error", 'Please fill the data');
        return;
      }
      await addcontact(name.text, number.text);
    } catch (e) {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Addcontact",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 400,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Enter the number",
                    label: Text("Number"),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 400,
              child: TextField(
                controller: number,
                decoration: InputDecoration(
                    hintText: "Enter the Name",
                    label: Text("Name"),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              add();
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(color: Colors.red.shade200),
                child: Center(
                    child: Text(
                  "Add contacts",
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> addcontact(String name, String number) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('addcontacts')
          .doc(user.uid)
          .collection('contacts')
          .add({
        'name': name,
        'number': number,
      });
    } catch (e) {}
  }
}
