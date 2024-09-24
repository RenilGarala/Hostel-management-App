import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hostel_management/Home.dart';

class Ragister extends StatefulWidget {
  const Ragister({super.key, required String title});

  @override
  State<Ragister> createState() => _RagisterState();
}

class _RagisterState extends State<Ragister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController conformpassword = TextEditingController();

  // String numberValidation = "";
  RegExp regExp = new RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
  
  String email = "",  username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Your ID',selectionColor: Colors.white ),
        centerTitle: true, 
        backgroundColor: Colors.blue[700], 
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .stretch,
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Center(
                        child: Image.network(
                            'https://cdn-icons-png.freepik.com/512/10607/10607354.png')),
                  ),
                  Container(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border:
                          OutlineInputBorder(), // Add borders to the input fields
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                    onSaved: (value) => username = value!,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                    onSaved: (value) => email = value!,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    // onSaved: (value) => password = value!,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: conformpassword,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a confirm password';
                      }
                      if (value != password.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    // onSaved: (value) => conformpassword = value!,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        // Login logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Homepage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue[700], // Change the color of the button
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Home {
  const Home();
}
