import 'package:flutter/material.dart';

void main() {
  runApp(const Answer4());
}

class Answer4 extends StatelessWidget {
  const Answer4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 170,
            color: Colors.blue,
            child: Center(
              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
  width: 80,
  height: 80,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      image: NetworkImage(
        'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
      ),
      fit: BoxFit.cover,
    ),
  ),
),
    SizedBox(height: 8),
                  Text(
                    'Pimwaree Pulkasem',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
                  ),
                ], 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
             
              children: [
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Pimwaree@silpakorn.edu',
                      style:
                          TextStyle(fontSize: 16 ),
                         
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      '123-234-5678',
                      style:
                          TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                 SizedBox(height: 15),
                 Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      '123 Main Street',
                      style:
                          TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
   bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly
      ,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.purple),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor:const Color.fromARGB(255, 255, 255, 255),
          ),
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ],
    ),
  ),
);
      
    
  }
}
