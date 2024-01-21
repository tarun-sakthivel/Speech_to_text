// main.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  const apiUrl =
      'http://127.0.0.1:5000/predict'; // Replace with your Flask server URL

  final inputData = [1.0, 2.0, 3.0]; // Replace with your input data

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'data': inputData}),
  );

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    final prediction = result['prediction'];
    print('Prediction: $prediction');
  } else {
    print('Error: ${response.statusCode}');
  }
}
