import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // แถวบน: รูปโปรไฟล์ และ สถิติ
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJjRjxU1g9zyptv4Q-hQqS8st_fNu1LcBNyg&s'), // ใส่ URL รูปจริงได้ที่นี่
                backgroundColor: Colors.grey[300],
              ),
              Expanded(
                child: Container(), 
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Scooby-Doo 🐾",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            "Professional Snack Taster | Mystery Machine Co-pilot 🚐",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            "Will solve mysteries for Scooby Snacks 🦴",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            "📍 Looking for the nearest buffet",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text( 
            "scooby_doo_official",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          const SizedBox(height: 2),
          
        ],
      ),
    );
  }
}