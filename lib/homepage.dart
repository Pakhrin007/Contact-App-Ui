import 'package:flutter/material.dart';
import 'package:practice/register.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assests/images/back.jpg'),
            fit: BoxFit.fill,
            opacity: 0.7,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Contact App",
              style: TextStyle(
                fontSize: 38,
                fontFamily: 'pacificio',
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 340,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Save your all contacts",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      fontFamily: 'pacificio'),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.red.shade600,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.red.shade100,
                        )
                      ],
                    ),
                    child: const Center(
                        child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
