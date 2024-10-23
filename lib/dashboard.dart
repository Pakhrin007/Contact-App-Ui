import 'package:flutter/material.dart';
import 'package:practice/details.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var names = [
      'Aryan',
      'Santosh',
      "Bishant",
      'Arjun',
      'Sahadev',
      'Ronish',
      'Mohan',
      'Sanjeep',
      'Roshan',
    ];
    var phoneNumbers = [
      '1234567890',
      '0987654321',
      '1122334455',
      '9988776655',
      '2233445566',
      '8877665544',
      '7788990011',
      '6677889900',
      '3344556677',
    ];
    var dates = [
      '2024-01-01',
      '2024-02-01',
      '2024-03-01',
      '2024-04-01',
      '2024-05-01',
      '2024-06-01',
      '2024-07-01',
      '2024-08-01',
      '2024-09-01',
    ];

    return Material(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black45, Colors.cyan.shade500],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                    height: 800,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white60,
                      border: Border(
                        top: BorderSide(width: 2),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('Assests/images/bg.jpg'),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        names[index],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        phoneNumbers[index],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        dates[index],
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Details()),
                                    );
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 45,
            left: 35,
            child: Text(
              "View Your Contact Details",
              style: TextStyle(fontSize: 28, fontFamily: 'pacificio'),
            ),
          )
        ],
      ),
    );
  }
}
