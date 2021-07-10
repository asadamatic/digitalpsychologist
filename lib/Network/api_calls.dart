import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class ApiCall{

  String apiUrl = 'http://0.0.0.0:8000/analyze';
  String apiUrlAndroidEmulator = 'http://10.0.2.2:8000/analyze';

  Future<int> getStressLevel() async{

    final response = await post(Uri.parse(Platform.isAndroid ? apiUrlAndroidEmulator : apiUrl), body: jsonEncode({
      'raw_data': [1, 2, 3]
    }));
    final stressLevel = jsonDecode(response.body);
    print(stressLevel['stress_level']);
    return stressLevel['stress_level'];
  }
}