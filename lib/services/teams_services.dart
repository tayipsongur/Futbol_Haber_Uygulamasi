import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:okulprojesi/models/teams_model.dart';

Future<List<Teams>> fetchData() async {
  final response =
  await http.get(Uri.parse('https://gist.githubusercontent.com/tayipsongur/109128ed07060145029cef2875b08c95/raw/1602a84edf4d87bf24bc3af86915c21ae32dd70d/takimlar.json'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Teams.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}