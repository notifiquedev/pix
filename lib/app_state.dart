import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _logado = false;
  bool get logado => _logado;
  set logado(bool value) {
    _logado = value;
  }

  String _vencimento = '';
  String get vencimento => _vencimento;
  set vencimento(String value) {
    _vencimento = value;
  }

  String _mac = '';
  String get mac => _mac;
  set mac(String value) {
    _mac = value;
  }

  String _clienteid = '';
  String get clienteid => _clienteid;
  set clienteid(String value) {
    _clienteid = value;
  }

  String _rf = '';
  String get rf => _rf;
  set rf(String value) {
    _rf = value;
  }
}
