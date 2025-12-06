import 'dart:convert';
import 'package:http/http.dart' as http;

import '../logger/log.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../logger/log.dart';

class BhashSmsService {
  final String user = 'BhashWAPai';
  final String pass = 'bwa@123';
  final String senderId = 'BUZWAP';
  final String message = 'Dear%20Customer,%20OTP%20is%201234,%20Thank%20you%20for%20using%20our%20service.-%20BhashSMS';


  Future<void>  sendSms(String mobile, String creditPaid, String remainingCredit) async {
    final Uri url = Uri.parse('https://bhashsms.com/api/sendmsg.php?user=$user&pass=$pass&sender=$senderId&phone=$mobile&text=$message&priority=ndnd&stype=normal');

    final Uri urlM = Uri.parse("http://bhashsms.com/api/sendmsg.php?user=psk_02&pass=123456&sender=Sender ID&phone=9908351768,9885613895&text=Test SMS&priority=Priority&stype=smstype");
    final Uri urlW = Uri.parse('https://bhashsms.com/api/sendmsg.php?user=BhashWAPai&pass=bwa@123&sender=BUZWAP&phone=9963474809&text=bsl_text_veriable&priority=wa&stype=normal&params=ABC,12345,Rs.1000');

    final response = await http.get(urlM);

    // Checking the response status
    if (response.statusCode == 200) {
      logger.d('Message sent successfully: ${response.body}');
    } else {
      logger.d('Failed to send message: ${response.statusCode}');
      logger.d('Response: ${response.body}');
    }
  }
}

// class BhashSmsService {
//   final String user = 'success';
//   final String pass = 'sms@123';
//   final String senderId = 'BHAINF';
//   final String message = 'Dear%20Customer,%20OTP%20is%201234,%20Thank%20you%20for%20using%20our%20service.-%20BhashSMS';
//   final String msg = 'You%20have%20successfully%20cleared%20credit%20of%20.%20%20Your%20remaining%20credit%20is';
//   final String mobile = "9908351768";
//
//   Future<void> sendSms() async {
//     final String encodedMsg = Uri.encodeComponent(msg);
//
//     final Uri url = Uri.parse('https://bhashsms.com/api/sendmsg.php?user=$user&pass=$pass&sender=$senderId&phone=$mobile&text=$msg&priority=ndnd&stype=normal');
//
//     final response = await http.get(url);
//
//     // Checking the response status
//     if (response.statusCode == 200) {
//       logger.d('Message sent successfully: ${response.body}');
//     } else {
//       logger.d('Failed to send message: ${response.statusCode}');
//       logger.d('Response: ${response.body}');
//     }
//   }
// }
