import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/subject.dart';

class CgpaCalculator extends StatefulWidget {
  final List<Subject> subjects; // Accept subjects as input

  const CgpaCalculator({Key? key, required this.subjects}) : super(key: key);

  @override
  _CgpaCalculatorState createState() => _CgpaCalculatorState();
}

class _CgpaCalculatorState extends State<CgpaCalculator> {
  double cgpa = 0.0;

  @override
  void initState() {
    super.initState();
    calculateCGPA();
  }

  void calculateCGPA() {
    double totalPoints = 0.0;
    double totalCredits = 0.0;

    for (var subject in widget.subjects) {
      totalCredits += subject.creditHours;
      totalPoints += subject.gpa * subject.creditHours;
    }

    setState(() {
      cgpa = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'CGPA Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CGPA Display Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your CGPA',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cgpa.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Pie Chart
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: cgpa,
                      color: Colors.green,
                      title: '${(cgpa * 25).toStringAsFixed(0)}%',
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: 4.0 - cgpa,
                      color: Colors.red,
                      title: '${((4.0 - cgpa) * 25).toStringAsFixed(0)}%',
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  sectionsSpace: 2,
                  centerSpaceRadius: 50,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Subjects List
            Expanded(
              child: ListView.builder(
                itemCount: widget.subjects.length,
                itemBuilder: (context, index) {
                  final subject = widget.subjects[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subject.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'GPA: ${subject.gpa.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                'Credits: ${subject.creditHours}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
