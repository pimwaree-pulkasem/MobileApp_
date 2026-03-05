import 'package:flutter/material.dart';
import 'package:first_project/page_answer/form2.dart';
class Form3 extends StatelessWidget {
  const Form3({super.key});

  // This widget is the root of your application.3
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
  String? _selectedCountry;
  String? _gender;
  bool _isSwitched = true;
  String strInput = "";
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
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
                        "Registration Form",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                         
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
                        
                        decoration: InputDecoration(
                          labelText: 'Email',
                          
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
                      Row(
                        children: [
                         
                        RadioListTile<String>( 
                          title: const Text('Male'),
                          value: 'Male',
                          groupValue: _gender,
                          
                          onChanged: (String? value) {
                          setState(() {
                            _gender = value;
                          });
                         
                       
                        },),
                           RadioListTile<String>( 
                          title: const Text('Female'),
                          value: 'Female',
                          groupValue: _gender,
                          
                          onChanged: (String? value) {
                          setState(() {
                            _gender = value;
                          });
                         
                       
                        },),
                        ],
                        
                      ),
                    Row( children: [ DropdownButtonFormField<String>(
                     value: _selectedCountry,
                      decoration: const InputDecoration(
                      labelText: 'Province',
   
                      ),
                      items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Khon Kaen']
      .map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
  onChanged: (value) {
    setState(() {
      _selectedCountry = value;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select your province';
    }
    return null;
  },
),],),
                   
                      SwitchListTile(
                        title: const Text('Accept Terms and Conditions'),
                        value: _isSwitched,
                        onChanged: (bool value) {
                          setState(() {
                            _isSwitched = value;
                          });
                        },
                      ),
                      
                   
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              strInput =
                                  "Username : ${_usernameController.text} "
                                  "Password : ${_passwordController.text} "
                                  "Gender : ${_gender} "
                                  "Country : ${_selectedCountry} "
                                  "Accept Terms : ${_isSwitched ? 'Yes' : 'No'}";
  
                                 
                                
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => form2(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                  gender: _gender,
                                  selectedCountry: _selectedCountry, 
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
