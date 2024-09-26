import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  List<Map<String, String>> complaints = [
    {'title': 'Water Leakage', 'description': 'There is a water leakage in the bathroom.'},
    {'title': 'Food Quality', 'description': 'The quality of food served in the canteen is not good.'},
  ];

  void _addComplaint(String title, String description) {
    setState(() {
      complaints.add({'title': title, 'description': description});
    });
  }

  void _editComplaint(int index, String title, String description) {
    setState(() {
      complaints[index] = {'title': title, 'description': description};
    });
  }

  void _deleteComplaint(int index) {
    setState(() {
      complaints.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildComplaintForm(),
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            const Text('Previous Complaints', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(child: _buildComplaintList()),
          ],
        ),
      ),
    );
  }

  Widget _buildComplaintForm() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add New Complaint',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Complaint Title',
                border: OutlineInputBorder(),
                filled: true,

              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Complain Description',
                border: OutlineInputBorder(),
                filled: true,

              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  _addComplaint(titleController.text, descriptionController.text);
                  titleController.clear();
                  descriptionController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Submit Complaint', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComplaintList() {
    if (complaints.isEmpty) {
      return const Center(
        child: Text('No complaints yet', style: TextStyle(fontSize: 16)),
      );
    }

    return ListView.builder(
      itemCount: complaints.length,
      itemBuilder: (context, index) {
        return _buildComplaintTile(index);
      },
    );
  }

  Widget _buildComplaintTile(int index) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          complaints[index]['title']!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(complaints[index]['description']!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                _showEditDialog(index);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _deleteComplaint(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(int index) {
    final TextEditingController titleController = TextEditingController(text: complaints[index]['title']);
    final TextEditingController descriptionController = TextEditingController(text: complaints[index]['description']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Complaint'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Complaint Title'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Complaint Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _editComplaint(index, titleController.text, descriptionController.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
