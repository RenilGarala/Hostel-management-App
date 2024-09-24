import 'package:flutter/material.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[700],
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> movies = [
    {
      'name': 'Movie 1',
      'image': 'https://via.placeholder.com/150', // Add actual image links here
      'rating': 4.5
    },
    {
      'name': 'Movie 2',
      'image': 'https://via.placeholder.com/150',
      'rating': 3.9
    },
    {
      'name': 'Movie 3',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.7
    },
    {
      'name': 'Movie 4',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.1
    },
    {
      'name': 'Movie 5',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.6
    },
    {
      'name': 'Movie 6',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.0
    },
    {
      'name': 'Movie 7',
      'image': 'https://via.placeholder.com/150',
      'rating': 3.5
    },
    {
      'name': 'Movie 8',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.8
    },
    {
      'name': 'Movie 9',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.2
    },
    {
      'name': 'Movie 10',
      'image': 'https://via.placeholder.com/150',
      'rating': 3.8
    },
    {
      'name': 'Movie 11',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.3
    },
    {
      'name': 'Movie 12',
      'image': 'https://via.placeholder.com/150',
      'rating': 4.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicketBookingScreen(movie: movie['name'])),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    movie['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  movie['name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Rating: ${movie['rating']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Name: John Doe'),
            ),
            ListTile(
              title: Text('Email: johndoe@example.com'),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketBookingScreen extends StatefulWidget {
  final String movie;

  TicketBookingScreen({required this.movie});

  @override
  _TicketBookingScreenState createState() => _TicketBookingScreenState();
}

class _TicketBookingScreenState extends State<TicketBookingScreen> {
  String? selectedSeat;
  String? selectedTime;
  DateTime? selectedDate;
  String? paymentMethod;
  double price = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Ticket - ${widget.movie}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Seat'),
              items: ['A1', 'A2', 'B1', 'B2'].map((seat) {
                return DropdownMenuItem(value: seat, child: Text(seat));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSeat = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Time'),
              items: ['10:00 AM', '1:00 PM', '6:00 PM'].map((time) {
                return DropdownMenuItem(value: time, child: Text(time));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Select Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              readOnly: true,
              controller: TextEditingController(
                text: selectedDate != null
                    ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                    : '',
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Payment Method'),
              items: ['Credit Card', 'PayPal', 'Google Pay'].map((method) {
                return DropdownMenuItem(value: method, child: Text(method));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  paymentMethod = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Price: \$$price'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingConfirmationScreen()),
                );
              },
              child: Text('Book Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Congratulations!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Your ticket has been booked successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                
                onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
