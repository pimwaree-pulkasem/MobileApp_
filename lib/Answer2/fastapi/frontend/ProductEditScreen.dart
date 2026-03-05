import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProductEditScreen extends StatefulWidget {
  final Map<String, dynamic> product; // รับข้อมูลสินค้าทั้งก้อนมาจากหน้า List
  ProductEditScreen({required this.product});

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    // เอาข้อมูลเก่ามาใส่ในช่องกรอกทันทีที่เปิดหน้า 
    nameController = TextEditingController(text: widget.product['name']);
    descriptionController = TextEditingController(text: widget.product['description'] ?? '');
    priceController = TextEditingController(text: widget.product['price'].toString());
  }

  Future<void> editProduct(BuildContext context) async {
    final String id = widget.product['id'].toString(); // ดึง ID มาจากข้อมูลที่ส่งมา
    
    final response = await http.put(
      Uri.parse('http://localhost:8001/products/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": nameController.text,
        "description": descriptionController.text,
        "price": double.tryParse(priceController.text) ?? 0.0,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('แก้ไขสำเร็จ!'), backgroundColor: Colors.blue),
      );
      Navigator.pop(context, true); 
       
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แก้ไขสินค้า: ${widget.product['name']}')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'ชื่อสินค้า')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'รายละเอียด')),
            TextField(controller: priceController, decoration: InputDecoration(labelText: 'ราคา'), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => editProduct(context), child: Text('บันทึกการแก้ไข'))
          ],
        ),
      ),
    );
  }
}