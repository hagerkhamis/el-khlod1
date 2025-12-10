import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/network/api/network_api.dart';
import 'package:elkhlod/core/utils/network/network_request.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';
import 'package:elkhlod/core/utils/network/network_utils.dart';

typedef LocationVacationResponse = Either<String, String>;
typedef VacationTypesResponse = Either<String, List<Map<String, dynamic>>>;

abstract class LocationVacationRemoteDataSource {
  Future<LocationVacationResponse> sendVacation(
    String moderEmpId,
    String empPhoneNum,
    String empName,
    String no3AgazaId,
    String fromDate,
    String toDate,
    String reason,
  );

  Future<VacationTypesResponse> getVacationTypes();
}

class LocationVacationRemoteDataSourceImpl
    extends LocationVacationRemoteDataSource {
  @override
  Future<LocationVacationResponse> sendVacation(
    String moderEmpId,
    String empPhoneNum,
    String empName,
    String no3AgazaId,
    String fromDate,
    String toDate,
    String reason,
  ) async {
    LocationVacationResponse response = left("حدث خطأ");

    var body = {
      "moder_emp_id": moderEmpId,
      "emp_phone_num": empPhoneNum,
      "emp_name": empName,
      "no3_agaza_id": no3AgazaId,
      "from_date": fromDate,
      "to_date": toDate,
      "reason": reason,
    };

    await getIt<NetworkRequest>().requestFutureData<Map<dynamic, dynamic>>(
      Method.post, // POST method
      params: body,
      url: NewApi.doServerAddLocationVacationApiCall, // endpoint من NewApi
      newBaseUrl: NewApi.baseUrl, // baseUrl من NewApi
      options:
          Options(contentType: Headers.formUrlEncodedContentType), // form data
      onSuccess: (data) {
        final Map<String, dynamic> jsonData = data as Map<String, dynamic>;
        if (jsonData['status'] == 200) {
          response = right(jsonData['message'] ?? "تم الإرسال بنجاح");
        } else {
          response = left(jsonData['message'] ?? "حدث خطأ");
        }
      },
      onError: (code, msg) {
        String errorMessage = "حدث خطأ";
        if (msg.isNotEmpty) {
          final msgLower = msg.toLowerCase();
          if (msgLower.contains("internet") ||
              msgLower.contains("network") ||
              msgLower.contains("connection") ||
              msgLower.contains("socket") ||
              code == 1001 ||
              code == 1002) {
            errorMessage = "تحقق من اتصال الإنترنت";
          } else if (msgLower.contains("timeout") || code == 1004) {
            errorMessage = "انتهت مهلة الاتصال، حاول مرة أخرى";
          } else {
            errorMessage = msg;
          }
        }
        response = left(errorMessage);
      },
    );

    return response;
  }

  @override
  Future<VacationTypesResponse> getVacationTypes() async {
    VacationTypesResponse response = left("حدث خطأ");

    await getIt<NetworkRequest>().requestFutureData<String>(
      Method.post,
      url: NewApi.doServerAlltypeLocationVacation,
      newBaseUrl: NewApi.baseUrl,
      options: Options(),
      onSuccess: (data) {
        print("📥 raw vacation types response: $data");
        final result = _extractTypes(data);
        print("📥 parsed vacation types result: $result");
        if (result != null) {
          response = right(result);
        } else {
          response = left("استجابة غير متوقعة من الخادم");
        }
      },
      onError: (code, msg) {
        String errorMessage = "حدث خطأ";
        if (msg.isNotEmpty) {
          final msgLower = msg.toLowerCase();
          if (msgLower.contains("internet") ||
              msgLower.contains("network") ||
              msgLower.contains("connection") ||
              msgLower.contains("socket") ||
              code == 1001 ||
              code == 1002) {
            errorMessage = "تحقق من اتصال الإنترنت";
          } else if (msgLower.contains("timeout") || code == 1004) {
            errorMessage = "انتهت مهلة الاتصال، حاول مرة أخرى";
          } else {
            errorMessage = msg;
          }
        }
        response = left(errorMessage);
      },
    );

    return response;
  }

  List<Map<String, dynamic>>? _extractTypes(dynamic raw) {
    try {
      final dynamic decoded = _decodeLooseStructure(raw);
      final result = _digForVacationList(decoded);
      return result;
    } catch (e, stack) {
      print("❌ parsing error: $e");
      print(stack);
      return null;
    }
  }

  List<Map<String, dynamic>>? _digForVacationList(dynamic node) {
    if (node is List) {
      final casted = node
          .whereType<Map>()
          .map((item) => Map<String, dynamic>.from(
              item.map((key, val) => MapEntry(key.toString(), val))))
          .toList();
      if (casted.isNotEmpty && casted.first.containsKey('vacation_id')) {
        return casted;
      }
    } else if (node is Map) {
      final normalized =
          node.map((key, value) => MapEntry(key.toString(), value));
      if (normalized.containsKey('vacation_id')) {
        return [Map<String, dynamic>.from(normalized)];
      }
      for (final value in normalized.values) {
        final nested = _digForVacationList(value);
        if (nested != null && nested.isNotEmpty) {
          return nested;
        }
      }
    }
    return null;
  }

  dynamic _decodeLooseStructure(dynamic raw) {
    if (raw is! String) return raw;
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return {};
    try {
      return jsonDecode(trimmed);
    } catch (_) {
      return _parseLooseMap(trimmed);
    }
  }

  Map<String, dynamic> _parseLooseMap(String source) {
    String normalized = source.trim();
    if (normalized.startsWith('{') && normalized.endsWith('}')) {
      normalized = normalized.substring(1, normalized.length - 1);
    }

    final Map<String, dynamic> result = {};
    final segments = _splitTopLevel(normalized);

    for (final segment in segments) {
      final index = segment.indexOf(':');
      if (index == -1) continue;
      final key = segment.substring(0, index).trim();
      final valueString = segment.substring(index + 1).trim();
      final normalizedKey = key.replaceAll('"', '');

      dynamic value;
      if (valueString.startsWith('{')) {
        value = _parseLooseMap(valueString);
      } else if (valueString.startsWith('[')) {
        value = _parseLooseList(valueString);
      } else {
        value = _parsePrimitive(valueString);
      }
      result[normalizedKey] = value;
    }

    return result;
  }

  List<dynamic> _parseLooseList(String source) {
    String normalized = source.trim();
    if (normalized.startsWith('[') && normalized.endsWith(']')) {
      normalized = normalized.substring(1, normalized.length - 1);
    }

    final segments = _splitTopLevel(normalized);
    return segments.map((segment) {
      final valueString = segment.trim();
      if (valueString.startsWith('{')) {
        return _parseLooseMap(valueString);
      } else if (valueString.startsWith('[')) {
        return _parseLooseList(valueString);
      }
      return _parsePrimitive(valueString);
    }).toList();
  }

  List<String> _splitTopLevel(String source) {
    final List<String> segments = [];
    final buffer = StringBuffer();
    int braceLevel = 0;
    int bracketLevel = 0;
    bool insideQuotes = false;

    for (int i = 0; i < source.length; i++) {
      final char = source[i];
      if (char == '"') {
        insideQuotes = !insideQuotes;
      }

      if (!insideQuotes) {
        if (char == '{') braceLevel++;
        if (char == '}') braceLevel--;
        if (char == '[') bracketLevel++;
        if (char == ']') bracketLevel--;

        if (char == ',' && braceLevel == 0 && bracketLevel == 0) {
          segments.add(buffer.toString());
          buffer.clear();
          continue;
        }
      }
      buffer.write(char);
    }

    if (buffer.isNotEmpty) {
      segments.add(buffer.toString());
    }

    return segments;
  }

  dynamic _parsePrimitive(String valueString) {
    final trimmed = valueString.trim();
    if (trimmed.isEmpty) return null;
    if (trimmed == 'null') return null;
    if (trimmed == 'true') return true;
    if (trimmed == 'false') return false;
    final numValue = num.tryParse(trimmed);
    if (numValue != null) return numValue;
    return trimmed;
  }
}
