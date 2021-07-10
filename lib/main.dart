import 'package:digitalpsychologist/Network/api_call.dart';
import 'package:digitalpsychologist/my_app.dart';
import 'package:flutter/material.dart';

void main() async{

  ApiCall().getStressLevel();
  runApp(MyApp());
}
