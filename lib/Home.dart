import 'package:flutter/material.dart';
import 'package:hostel_management/Canteen.dart';
import 'package:hostel_management/Login.dart';
import 'package:hostel_management/Loundry.dart';
import 'package:hostel_management/Profile.dart';
import 'package:hostel_management/Room.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hostel App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
              child: const Text(
                'Hostel App Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.hotel),
              title: const Text('Rooms'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoomAvailabilityScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_laundry_service),
              title: const Text('Laundry'),
              
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LaundryPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Canteen'),
             
               onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  CanteenPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Welcome Section
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Here are your hostel details:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              // Room Information Card
              buildRoomInfoCard(),

              const SizedBox(height: 20),

              // Laundry Service Card
              buildLaundryServiceCard(),

              const SizedBox(height: 20),

              // Canteen Timing Card
              buildCanteenTimingCard(),

              const SizedBox(height: 20),

              // Notification Section
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              buildNotificationCard('Room inspection on 10th October',
                  'Make sure your room is clean and organized.'),
              const SizedBox(height: 10),
              buildNotificationCard('Laundry delay',
                  'Laundry service will be delayed due to maintenance.'),
              const SizedBox(height: 10),
              buildNotificationCard('Canteen special menu',
                  'Enjoy a special dinner menu on 15th September!'),
              const SizedBox(height: 10),
              buildNotificationCard('Wi-Fi maintenance',
                  'Wi-Fi will be down for 2 hours tomorrow (3 PM - 5 PM).'),
            ],
          ),
        ),
      ),
    );
  }

  // Room Information Card
  Widget buildRoomInfoCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Room Number and Capacity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.hotel, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      'Room No: A-202',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ],
                ),
                const Text(
                  '2 Persons',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Rent and Features
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '\$500/month',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  'Free Wi-Fi, TV Available',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Laundry Service Card
  Widget buildLaundryServiceCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.local_laundry_service,
                color: Colors.blue, size: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Laundry Service',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                SizedBox(height: 8),
                Text(
                  'Available: 8 AM - 6 PM',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Canteen Timing Card
  Widget buildCanteenTimingCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.restaurant, color: Colors.blue, size: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Canteen Timings',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                SizedBox(height: 8),
                Text(
                  'Breakfast: 7 AM - 9 AM',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Text(
                  'Lunch: 12 PM - 2 PM',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Text(
                  'Dinner: 7 PM - 9 PM',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Notification Card
  Widget buildNotificationCard(String title, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.notifications, color: Colors.blue, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
