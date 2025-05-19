import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project4/features/receipt/data/model/receipt_model.dart';

class ReceiptApiRecognizer {
  static const String _baseURL = "https://api.mindee.net/v1";
  static const String _apiKey = "Token 5636f55864bea1f8d72caa3cd4963bc8";
  static const String _receiptsEndBoint =
      "/products/mindee/expense_receipts/v5/predict";

  static Future<ReceiptModel?> analyzeReceipt({required File imageFile}) async {
    //convert url to uri
    var url = Uri.parse(_baseURL + _receiptsEndBoint);
    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = _apiKey;
    //Read file by using MultipartFile(Body)
    request.files.add(
      await http.MultipartFile.fromPath('document', imageFile.path),
    );
    try {
      //Send request
      final response = await request.send();
      // Check the status code of the response
      if (response.statusCode == 201) {
        //read response data
        final responseData = await http.Response.fromStream(response);
        final responseBody = jsonDecode(responseData.body);
        final receipt = ReceiptModel.fromJson(responseBody);
        return receipt;
      } else {
        throw FormatException(
          "The error with status Code: ${response.statusCode}",
        );
      }
    } catch (e) {
      return null;
    }
  }
}
