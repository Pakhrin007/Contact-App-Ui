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

  // Function to delete a contact
  Future<void> deleteContact(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('addcontacts')
          .doc(user.uid)
          .collection('contacts')
          .doc(docId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contact deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete contact: $e')),
      );
    }
  }

  // Function to update a contact
  Future<void> updateContact(
      String docId, String newName, String newNumber) async {
    try {
      await FirebaseFirestore.instance
          .collection('addcontacts')
          .doc(user.uid)
          .collection('contacts')
          .doc(docId)
          .update({
        'name': newName,
        'number': newNumber,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contact updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update contact: $e')),
      );
    }
  }

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
                title: Text('Name: ${data['name'] ?? 'unknown'}'),
                subtitle: Text('Number: ${data['number'] ?? 'unknown'}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Open a dialog to update contact details
                        showDialog(
                          context: context,
                          builder: (context) {
                            final nameController =
                                TextEditingController(text: data['name']);
                            final numberController =
                                TextEditingController(text: data['number']);

                            return AlertDialog(
                              title: Text('Update Contact'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration:
                                        InputDecoration(labelText: 'Name'),
                                  ),
                                  TextField(
                                    controller: numberController,
                                    decoration:
                                        InputDecoration(labelText: 'Number'),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    final newName = nameController.text;
                                    final newNumber = numberController.text;

                                    if (newName.isNotEmpty &&
                                        newNumber.isNotEmpty) {
                                      await updateContact(
                                          data.id, newName, newNumber);
                                      Navigator.pop(context); // Close dialog
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Fields cannot be empty')),
                                      );
                                    }
                                  },
                                  child: Text('Update'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Confirm delete action
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Delete Contact'),
                            content: Text(
                                'Are you sure you want to delete this contact?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(context); // Close the dialog
                                  await deleteContact(
                                      data.id); // Delete contact
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
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
        child: Icon(Icons.add),
      ),
    );
  }
}
