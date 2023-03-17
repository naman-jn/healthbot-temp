import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:healthbot/utils/logger.dart';

class ApiHelper {
  static Future<String> ask(String messageText) async {
    var url = Uri.http('192.168.29.8015', '/ask');
    // var url = Uri.http('10.0.2.2:8000', '/ask');
    var res = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
      },
      body: json.encode({'msg': messageText}),
    );
    var body = res.body;
    var statusCode = res.statusCode;
    logger.wtf(statusCode);
    logger.d(body);
    return body.toString();
  }
}
