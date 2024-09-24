import 'package:flutter/material.dart';
import 'package:hostel_management/Home.dart';

class RoomAvailabilityScreen extends StatelessWidget {
  final List<Map<String, dynamic>> roomData = [
    {'roomNumber': '101', 'status': 'Available'},
    {'roomNumber': '102', 'status': 'Occupied'},
    {'roomNumber': '103', 'status': 'Available'},
    {'roomNumber': '104', 'status': 'Occupied'},
    {'roomNumber': '201', 'status': 'Available'},
    {'roomNumber': '202', 'status': 'Available'},
    {'roomNumber': '203', 'status': 'Occupied'},
    {'roomNumber': '204', 'status': 'Available'},
    {'roomNumber': '301', 'status': 'Available'},
    {'roomNumber': '302', 'status': 'Occupied'},
    {'roomNumber': '303', 'status': 'Occupied'},
    {'roomNumber': '304', 'status': 'Occupied'},
    {'roomNumber': '401', 'status': 'Available'},
    {'roomNumber': '402', 'status': 'Available'},
    {'roomNumber': '403', 'status': 'Occupied'},
    {'roomNumber': '404', 'status': 'Available'},
  ];

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Room Availability', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Room Status",
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.w700, 
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: roomData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        'Room ${roomData[index]['roomNumber']}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        roomData[index]['status'] == 'Available' 
                          ? 'Status: Available' 
                          : 'Status: Occupied',
                        style: TextStyle(
                          fontSize: 16,
                          color: roomData[index]['status'] == 'Available'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      trailing: Icon(
                        roomData[index]['status'] == 'Available'
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: roomData[index]['status'] == 'Available'
                            ? Colors.green
                            : Colors.red,
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
