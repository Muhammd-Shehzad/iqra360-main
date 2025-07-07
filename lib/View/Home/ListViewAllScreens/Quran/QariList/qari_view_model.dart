import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iqra360/Model/QariModel/qari_model.dart';
import 'package:http/http.dart' as http;

class QariViewModel extends ChangeNotifier {
  List<QariModel> qariList = [];

  Future<List<QariModel>> getQariList() async {
    final response = await http.get(
      Uri.parse('https://quranicaudio.com/api/qaris'),
    );

    jsonDecode(response.body).forEach((element) {
      if (qariList.length < 157) qariList.add(QariModel.formjson(element));
    });
    qariList.sort((a, b) => a.name!.compareTo(b.name!));
    return qariList;
  }
}
