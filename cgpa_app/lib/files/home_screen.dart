import 'package:flutter/material.dart';

import 'courses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();
  var rollnoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300, // Adjust the width as needed
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300, // Adjust the width as needed
                child: TextFormField(
                  controller: rollnoController,
                  decoration: InputDecoration(
                    hintText: 'RollNo',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CoursesScreen(
                       name: nameController.text.toString(),
                       rollno: rollnoController.text.toString(),

                      )));
                },
                child: Container(
                  width: 150, // Set a specific width
                  height: 50, // Set a specific height
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
