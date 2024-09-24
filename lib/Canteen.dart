import 'package:flutter/material.dart';
import 'package:hostel_management/Home.dart';

class CanteenPage extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyMenu = [
    {
      'day': 'Monday',
      'breakfast': 'Poha, Tea',
      'lunch': 'Dal, Rice, Roti, Sabzi',
      'snacks': 'Samosa, Tea',
      'dinner': 'Paneer Butter Masala, Roti, Rice',
    },
    {
      'day': 'Tuesday',
      'breakfast': 'Idli, Sambar, Chutney',
      'lunch': 'Chole, Rice, Roti, Salad',
      'snacks': 'Pakoda, Tea',
      'dinner': 'Aloo Gobi, Roti, Rice, Dal',
    },
    {
      'day': 'Wednesday',
      'breakfast': 'Paratha, Curd, Pickle',
      'lunch': 'Rajma, Rice, Roti, Sabzi',
      'snacks': 'Biscuits, Tea',
      'dinner': 'Vegetable Biryani, Raita',
    },
    {
      'day': 'Thursday',
      'breakfast': 'Upma, Tea',
      'lunch': 'Kadhi, Rice, Roti, Salad',
      'snacks': 'Bread Pakora, Tea',
      'dinner': 'Dal Makhani, Roti, Rice',
    },
    {
      'day': 'Friday',
      'breakfast': 'Aloo Paratha, Curd',
      'lunch': 'Palak Paneer, Rice, Roti, Salad',
      'snacks': 'Bhel Puri, Tea',
      'dinner': 'Mixed Veg, Roti, Dal, Rice',
    },
    {
      'day': 'Saturday',
      'breakfast': 'Dosa, Sambar, Chutney',
      'lunch': 'Aloo Chole, Rice, Roti, Sabzi',
      'snacks': 'Namkeen, Tea',
      'dinner': 'Malai Kofta, Roti, Rice',
    },
    {
      'day': 'Sunday',
      'breakfast': 'Chole Bhature',
      'lunch': 'Pulao, Raita, Salad',
      'snacks': 'Pani Puri, Tea',
      'dinner': 'Paneer Tikka, Roti, Dal, Rice',
    },
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
        title: const Text(
          'Weekly Canteen Menu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: weeklyMenu.length,
          itemBuilder: (context, index) {
            final dayMenu = weeklyMenu[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Day Header with Icon
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.blue[700],
                        ),
                        const SizedBox(width: 10),
                        Text(
                          dayMenu['day'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Meal Row
                    mealInfoRow('Breakfast', dayMenu['breakfast']),
                    const SizedBox(height: 10),
                    mealInfoRow('Lunch', dayMenu['lunch']),
                    const SizedBox(height: 10),
                    mealInfoRow('Snacks', dayMenu['snacks']),
                    const SizedBox(height: 10),
                    mealInfoRow('Dinner', dayMenu['dinner']),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Custom widget to display meal info in a well-structured row format
  Widget mealInfoRow(String mealType, String meal) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$mealType:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            meal,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
