import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ComprarDigitoPayCall {
  static Future<ApiCallResponse> call({
    String? vendedor = '',
    int? monts,
    String? cliente = '',
    String? whats = '',
    double? valor,
    String? ts = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vendedor": "$vendedor",
  "meses": $monts,
  "cliente": "$cliente",
  "whats": "$whats",
  "ts": "$ts",
  "valor": $valor
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Comprar DigitoPay',
      apiUrl: 'https://wh.notifique.net/webhook/pixdigito',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? resposta(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? qr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.qr''',
      ));
  static int? transferencia(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.transferencia''',
      ));
}

class BuscarClienteCall {
  static Future<ApiCallResponse> call({
    String? user = '',
    String? rf = '',
    String? ts = '1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar Cliente',
      apiUrl: 'https://wh.notifique.net/webhook/buscav2Sitepix',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': user,
        'rf': rf,
        'ts': ts,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? mac(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mac''',
      ));
  static String? vencimento(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.vencimento''',
      ));
  static String? clienteid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.clienteid''',
      ));
  static double? mensal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.mensal''',
      ));
  static double? trimestral(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.trimestral''',
      ));
  static double? semestral(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.semestral''',
      ));
  static double? anual(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.anual''',
      ));
  static double? bimestral(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.bimestral''',
      ));
  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nome''',
      ));
  static String? whats(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.whats''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
