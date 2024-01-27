import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  Map<String, dynamic> data = {};
  List<dynamic> ids = [];
  Future<void> getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://internshala.com/flutter_hiring/search"));
      data = jsonDecode(response.body);
      ids = data["internship_ids"];
      print("The response is ${response.statusCode} and ${response.body}");

      print(" the response is ${response.statusCode}  and $ids");
      notifyListeners();
    } catch (e) {
      print("the error $e");
    }
  }

  List<Map<String, dynamic>> searchInternships(
      List<dynamic> ids, Map<String, dynamic> data, String query) {
    List<Map<String, dynamic>> results = [];
    for (int id in ids) {
      String idString = id.toString();
      if (data["internships_meta"].containsKey(idString)) {
        Map<String, dynamic> internshipDetails =
            data["internships_meta"][idString];
        if (internshipDetails["title"]
            .toLowerCase()
            .contains(query.toLowerCase())) {
          print("this is second if true");
          results.add(internshipDetails);
          // refresh();
        }
      }
    }
    return results;
  }

  void refresh() {
    notifyListeners();
  }
}
