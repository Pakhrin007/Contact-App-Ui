import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/addcontact.dart';

class Viewcontact extends StatefulWidget {
  const Viewcontact({super.key});

  @override
  State<Viewcontact> createState() => _ViewcontactState();
}

class _ViewcontactState extends State<Viewcontact> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact details"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('addcontacts')
            .doc(user.uid)
            .collection('contacts')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          final contactData = snapshot.data!.docs;

          return ListView.builder(
            itemCount: contactData.length,
            itemBuilder: (context, index) {
              final data = contactData[index];
              return ListTile(
                leading: Icon(Icons.person),
                title: Text('Name ${data['name'] ?? 'unknown'}'),
                subtitle: Text('Number ${data['number'] ?? 'unknown'}'),
              );
            },
          );
        },
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addcontact()));
          },
          child: Icon(Icons.add)),
    );
  }
}
