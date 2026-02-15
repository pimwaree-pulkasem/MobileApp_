import 'package:flutter/material.dart';


class answer2 extends StatelessWidget {
  final String username;
  final String password;
  final String name;
  final String surname;

  const answer2({
    super.key,
    required this.username,
    required this.password,
    required this.name,
    required this.surname,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Success"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(20),
              
              width: 400,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle,
                      color: Colors.green, size: 80),
                  const SizedBox(height: 20),

               const Text(
              "สมัครสมาชิกสำเร็จ 🎉",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text("Username: $username",
                style: const TextStyle(fontSize: 18)),
            Text("Password: $password",
                style: const TextStyle(fontSize: 18)),
            Text("Name: $name",
                style: const TextStyle(fontSize: 18)),
            Text("Surname: $surname",
                style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"),
              ),
            )
            ],

              ),

          
            ),
        ],),],
      ),
    ),);
  }
}