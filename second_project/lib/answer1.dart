import 'package:flutter/material.dart';
import 'package:second_project/answer2.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  String strInput = "";
  bool _obscurePassword = true;
  bool _obscurePasswordConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ), // AppBar
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
       
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  width: 500,
                 
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      Text(
                        "Register Form",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          icon: Icon(Icons.person),
                        ),
                        controller: _usernameController,

                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: const Icon(Icons.key),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }

                          return null;
                        },
                      ),

                      TextFormField( 
                         controller: _passwordConfirmController,
                         obscureText: _obscurePasswordConfirm,
                         decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          icon: const Icon(Icons.key),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePasswordConfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePasswordConfirm = !_obscurePasswordConfirm;
                              });
                            },
                          ),
                        ),
                      
                        
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password confirmation';
                          }

                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          icon: Icon(Icons.person),
                        ),
                        controller: _nameController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Surname',
                          icon: Icon(Icons.person),
                        ),
                        controller: _surnameController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your surname';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              strInput =
                                  "Username : ${_usernameController.text} "
                                  "Password : ${_passwordController.text} "
                                  "Confirm Password : ${_passwordConfirmController.text} "
                                  "Name : ${_nameController.text} "
                                  "Surname : ${_surnameController.text}";
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => answer2(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                  name: _nameController.text,
                                  surname: _surnameController.text,
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              strInput = "Please fill in the form";
                            });
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _usernameController.clear();
                            _passwordController.clear();
                            _passwordConfirmController.clear();
                            _nameController.clear();
                            _surnameController.clear();
                            strInput = "";
                          });
                        },
                        child: const Text('Clear'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _usernameController.text = "Pimwaree";
                            _passwordController.text = "12345678";
                            _passwordConfirmController.text = "12345678";
                            _nameController.text = "Pimwaree";
                            _surnameController.text = "Pulkasem";
                          });
                        },

                        child: const Text('Auto Fill'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // Form
    ),); //
  }
}
