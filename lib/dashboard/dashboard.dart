import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/addcontact.dart';
import 'package:flutter_application_1/dashboard/viewcontact.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text("No user data found.");
            }

            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome, ${userData['fullname']}}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text('Gender: ${userData['gender']}'),
                SizedBox(height: 10),
                Text('Email: ${userData['email']}'),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Viewcontact()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.blue,
                    child: Text("Add Contact",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.red,
                    child:
                        Text("Logout", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
