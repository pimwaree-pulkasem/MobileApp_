import 'dart:convert';
import 'package:first_project/Answer1/model/AirData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Airdatascreen extends StatefulWidget {
  const Airdatascreen({super.key});

  @override
  State<Airdatascreen> createState() => _AirdatascreenState();
}

class _AirdatascreenState extends State<Airdatascreen> {
  AirData? airData;
  TextEditingController _idSearchController = TextEditingController();

  void fetchAirData() async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://api.waqi.info/feed/here/?token=42492a8e0c093e331af02ff42e44d5a53ef2b3f5',
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        AirData airDataFromJson = AirData.fromJson(data);
        setState(() {
          airData = airDataFromJson;
        });
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAirData(); // สั่งให้ดึงข้อมูลทันทีที่เปิดหน้านี้
  }

  @override
  Widget build(BuildContext context) {
    Color getAqiColor(int? aqi) {
      if (aqi == null) return Colors.grey;
      if (aqi <= 50) return Colors.green;
      if (aqi <= 100) return Colors.yellow[700]!;
      if (aqi <= 150) return Colors.orange;
      return Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Quality Index (AQI)'),
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
      ),
      body: airData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      airData!.city,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      decoration: BoxDecoration(
                        color: getAqiColor(airData?.aqi),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${airData?.aqi}',
                            style: const TextStyle(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      'temperature: ${airData?.temperature}°C',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'Last update: ${airData?.time}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: fetchAirData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Refresh',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
