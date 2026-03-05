import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ProductFormScreen.dart';
import 'ProductEditScreen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse('http://localhost:8001/products'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('โหลดข้อมูลไม่สำเร็จ');
    }
  }


  void confirmDelete(String id) async {
    String? result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ยืนยันการลบ'),
        content: Text('คุณต้องการลบสินค้านี้ใช่หรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text('ตกลง'),
          ),
        ],
      ),
    );

    if (result == 'OK') {
      final response = await http.delete(
        Uri.parse('http://localhost:8001/products/$id'),
      );
      if (response.statusCode == 200) {
        // โชว์ SnackBar เมื่อลบสำเร็จ
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ลบข้อมูลสำเร็จ!'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {}); // รีเฟรชหน้าจอ
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รายการสินค้า')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));

          return ListView.separated(
            itemCount: snapshot.data?.length ?? 0,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[300],
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              var item = snapshot.data![index];
              return ListTile(
                leading: Text('${index + 1}', style: TextStyle(fontSize: 14)),
                title: Text(
                  item['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item['description']),

                trailing: Container(
                  width: 200, // กำหนดพื้นที่ให้พอสำหรับราคาและปุ่มลบ
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${item['price'] ?? 0} บาท',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ), // ไอคอนแก้ไข
                        onPressed: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductEditScreen(product: item),
                              ),
                            ).then((value) {
                              if (value == true) {
                                // ถ้ากลับมาพร้อมค่า true (แปลว่าแก้ไขสำเร็จ) ให้สั่งวาดหน้าใหม่
                                setState(() {});
                              }
                            }), // กดแล้วไปหน้าแก้ไข
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => confirmDelete(item['id'].toString()),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // กดแล้วไปหน้า Form
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductFormScreen()),
          ).then((value) => setState(() {}));
        },
      ),
    );
  }
}
