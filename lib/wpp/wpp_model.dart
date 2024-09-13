import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wpp_widget.dart' show WppWidget;
import 'package:flutter/material.dart';

class WppModel extends FlutterFlowModel<WppWidget> {
  ///  Local state fields for this page.

  bool buscou = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Buscar Cliente)] action in wpp widget.
  ApiCallResponse? respAPI;
  // State field(s) for mensal widget.
  bool mensalHovered = false;
  // State field(s) for bimestral widget.
  bool bimestralHovered = false;
  // State field(s) for trimestral widget.
  bool trimestralHovered = false;
  // State field(s) for semestral widget.
  bool semestralHovered = false;
  // State field(s) for anual widget.
  bool anualHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
