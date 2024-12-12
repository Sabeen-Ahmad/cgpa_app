import 'package:flutter/material.dart';
import '../model/subject.dart';
import 'cgpa_calculator.dart';

class CoursesScreen extends StatefulWidget {
  final name;
  final rollno;
  const CoursesScreen({Key? key,required this.name,required this.rollno}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {


  // Initialize the controllers for each field
  final List<TextEditingController> nameControllers = [];
  final List<TextEditingController> codeControllers = [];
  final List<TextEditingController> creditControllers = [];
  final List<TextEditingController> gpaControllers = [];

  List<Subject> subjects = [];

  // Function to add a new subject
  void addSubject() {
    setState(() {
      // Add new empty controllers to the list
      nameControllers.add(TextEditingController());
      codeControllers.add(TextEditingController());
      creditControllers.add(TextEditingController());
      gpaControllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Courses',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Change the icon here
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Opens the drawer
          },
        ),
      ),

      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(title: Text('Home',style: TextStyle(color: Colors.black),),subtitle: Icon(Icons.home,color: Colors.black,),),
        ListTile(title: Text('About',style: TextStyle(color: Colors.black),),subtitle: Icon(Icons.info,color:Colors.black),),
        ListTile(title: Text('Logout',style: TextStyle(color: Colors.black),),subtitle: Icon(Icons.logout,color: Colors.black,),),

        ],
        ),

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // User profile section
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar and Dropdown
                  const Column(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images.png'),
                      ),
                      const SizedBox(height: 10),

                    ],
                  ),
                  // User info and CGPA
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.numbers, color: Colors.black),
                          const SizedBox(width: 8),
                          Text(
                            widget.rollno,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 1),
              const SizedBox(height: 20),

              // Add Subject Button

              const SizedBox(height: 10),

              // Displaying the input fields for each subject
              Expanded(
                child: ListView.builder(
                  itemCount: nameControllers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: TextField(
                            controller: nameControllers[index],
                            decoration: const InputDecoration(
                              hintText: 'Subject Name',
                              prefixIcon: Icon(Icons.book),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          leading: SizedBox(
                            width:
                                90, // Adjust the width of the leading widget (Credit Hours)
                            child: TextField(
                              controller: creditControllers[index],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Credit Hours',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          trailing: SizedBox(
                            width:
                                90, // Adjust the width of the trailing widget (GPA or another field)
                            child: TextField(
                              controller: gpaControllers[
                                  index], // Assuming the trailing is for GPA
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'GPA',
                                prefixIcon: Icon(Icons.grade),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),

              TextButton(
                onPressed: () {
                  // Collect subject data and pass it to the next page
                  for (int i = 0; i < nameControllers.length; i++) {
                    final subject = Subject(
                      name: nameControllers[i].text,
                      courseCode: codeControllers[i].text,
                      creditHours: int.parse(creditControllers[i].text),
                      gpa: double.parse(gpaControllers[i].text),
                    );
                    subjects.add(subject);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CgpaCalculator(subjects: subjects),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150, // Set a specific width
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: addSubject,
                        child: Center(
                            child: const Text(
                              'Add Subject',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(width: 30,),
                    Container(
                      width: 150, // Set a specific width
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: const Text(
                        'Calculate CGPA',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
