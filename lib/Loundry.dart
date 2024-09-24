import 'package:flutter/material.dart';
import 'package:hostel_management/Home.dart';
import 'package:intl/intl.dart'; // For date formatting

class LaundryPage extends StatelessWidget {
  // Sample data for the last 30 days with current date and laundry pairs
  final List<Map<String, dynamic>> laundryData = List.generate(30, (index) {
    DateTime today = DateTime.now();
    DateTime day = today.subtract(Duration(days: index));
    return {
      'date': day,
      'clothes': (index + 1) % 5 + 1, // Random clothes count for demo
    };
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the total charge
    int totalPairs = laundryData.fold(0, (sum, item) => sum + (item['clothes'] as int));
    int totalCharge = totalPairs * 10;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          },
        ),
        title: const Text('Laundry Status', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Laundry Records (Last 30 Days)",
              style: TextStyle(
                fontSize: 19, 
                fontWeight: FontWeight.w700, 
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: laundryData.length,
                itemBuilder: (context, index) {
                  DateTime date = laundryData[index]['date'];
                  String formattedDate = DateFormat('dd MMM yyyy').format(date);
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        'Date: $formattedDate',
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'Clothes: ${laundryData[index]['clothes']} pair(s)',
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Total Charge: ₹$totalCharge (₹10 per pair)',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
