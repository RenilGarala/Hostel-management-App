import 'package:flutter/material.dart';
import 'package:hostel_management/Home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Icon
            Center(
              child: CircleAvatar(
                radius: 50, // Adjust size as needed
                backgroundColor: Colors.blue[100],
                child: const Icon(Icons.person, size: 50, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),

            _buildHeader("User Information"),
            _buildInfoTile(context, 'Username', 'John Doe', Icons.person),
            _buildInfoTile(context, 'Email', 'johndoe@example.com', Icons.email),
            _buildInfoTile(context, 'Phone Number', '+91 9876543210', Icons.phone),
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            _buildHeader("More Information"),
            _buildStaticInfo('Address', '123 Main St, City, State'),
            _buildStaticInfo('College Name', 'XYZ University'),
            _buildStaticInfo('Course Name', 'Bachelor of Engineering'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, String title, String value, IconData icon) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.edit, color: Colors.blue),
        onTap: () {
          _navigateToEditScreen(context, title, value);
        },
      ),
    );
  }

  Widget _buildStaticInfo(String title, String value) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  void _navigateToEditScreen(BuildContext context, String fieldName, String currentValue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFieldScreen(fieldName: fieldName, currentValue: currentValue),
      ),
    );
  }
}

class EditFieldScreen extends StatefulWidget {
  final String fieldName;
  final String currentValue;

  const EditFieldScreen({required this.fieldName, required this.currentValue, super.key});

  @override
  _EditFieldScreenState createState() => _EditFieldScreenState();
}

class _EditFieldScreenState extends State<EditFieldScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.fieldName}', style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(),
            const SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.fieldName,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      style: const TextStyle(fontSize: 18),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context, _controller.text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[700],
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text('Save', style: TextStyle(fontSize: 16)),
    );
  }
}
