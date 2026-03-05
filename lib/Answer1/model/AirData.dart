class AirData {
  final int aqi;
  final String city;
  final double temperature;
  final String time;

  // Constructor
  AirData({
    required this.aqi,
    required this.city,
    required this.temperature,
    required this.time,
  });

  // convert json to Object
  // ต้องไล่ลำดับ Key ตามโครงสร้าง JSON ที่ส่งมา
  factory AirData.fromJson(Map<String, dynamic> json) {
    // ดึงก้อน 'data' ออกมาก่อนเพราะข้อมูลเกือบทั้งหมดอยู่ในนั้น
    var data = json['data']; 
    
    return AirData(
      aqi: data['aqi'], // อยู่ชั้น data -> aqi
      city: data['city']['name'], // อยู่ชั้น data -> city -> name
      temperature: data['iaqi']['t']['v'].toDouble(), // อยู่ชั้น data -> iaqi -> t -> v
      time: data['time']['s'], // อยู่ชั้น data -> time -> s
    );
  }
}