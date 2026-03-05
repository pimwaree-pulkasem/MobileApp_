import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProductFormScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();


  Future<void> saveProduct(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost:8001/products'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": nameController.text,
        "description": descriptionController.text,
        "price": double.parse(priceController.text),
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // โชว์ SnackBar ว่าสำเร็จแล้ว และกลับหน้าแรก
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('บันทึกสำเร็จ!'), backgroundColor: Colors.green),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เพิ่มสินค้า')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'ชื่อสินค้า')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'รายละเอียด')),
            TextField(controller: priceController, decoration: InputDecoration(labelText: 'ราคา'), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => saveProduct(context), child: Text('บันทึกข้อมูล'))
          ],
        ),
      ),
    );
  }
}