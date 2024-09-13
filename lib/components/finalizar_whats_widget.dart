import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'finalizar_whats_model.dart';
export 'finalizar_whats_model.dart';

class FinalizarWhatsWidget extends StatefulWidget {
  const FinalizarWhatsWidget({
    super.key,
    required this.valor,
    required this.clientid,
    required this.months,
    required this.rf,
    required this.whats,
    String? ts,
  }) : ts = ts ?? '1';

  final double? valor;
  final String? clientid;
  final int? months;
  final String? rf;
  final String? whats;
  final String ts;

  @override
  State<FinalizarWhatsWidget> createState() => _FinalizarWhatsWidgetState();
}

class _FinalizarWhatsWidgetState extends State<FinalizarWhatsWidget> {
  late FinalizarWhatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalizarWhatsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.aleatorio50 = functions.digitosUserID(widget.clientid!);
      _model.aleatorio12num = functions.retornar12Digitos(widget.clientid!);
      _model.email = functions.gerarEmailAleatorio(
          functions.gerarNomeAleatorio(_model.aleatorio50!),
          functions.gerarSobrenomeAleatorio(_model.aleatorio50!));
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            'https://i.imgur.com/wbu8Cwn.png',
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
          ))
            const SizedBox(
              height: 100.0,
              child: VerticalDivider(
                width: 40.0,
                thickness: 1.0,
                color: Color(0x00FFFFFF),
              ),
            ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0x7A0B1116),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        desktop: false,
                      ))
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                'Valor a pagar R\$: ${widget.valor?.toString()}',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).tertiary400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              'Recarga do App',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: FlutterFlowTheme.of(context).tertiary400,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6.0, 13.0, 6.0, 5.0),
                            child: AutoSizeText(
                              'Clique no botão para comprar',
                              maxLines: 1,
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: const Color(0xFFEFF1F7),
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.criarPIX =
                                    await ComprarDigitoPayCall.call(
                                  vendedor: widget.rf,
                                  monts: widget.months,
                                  cliente: widget.clientid,
                                  whats: widget.whats,
                                  valor: widget.valor,
                                  ts: valueOrDefault<String>(
                                    widget.ts,
                                    '1',
                                  ),
                                );

                                if ((_model.criarPIX?.succeeded ?? true)) {
                                  if (ComprarDigitoPayCall.resposta(
                                        (_model.criarPIX?.jsonBody ?? ''),
                                      ) ==
                                      'ok') {
                                    context.pushNamed(
                                      'pix',
                                      queryParameters: {
                                        'qr': serializeParam(
                                          ComprarDigitoPayCall.qr(
                                            (_model.criarPIX?.jsonBody ?? ''),
                                          ),
                                          ParamType.String,
                                        ),
                                        'id': serializeParam(
                                          widget.clientid,
                                          ParamType.String,
                                        ),
                                        'rf': serializeParam(
                                          widget.rf,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('erro'),
                                          content: const Text(
                                              'Sem sucesso, tente novamente..'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Erro'),
                                        content: const Text(
                                            'Verifique o número do seu WhatsApp e tente novamente.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: 'COMPRAR',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsets.all(8.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF018E41),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Escolher outro pacote',
                              icon: const Icon(
                                Icons.chevron_left,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF1557F4),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 20.0,
                              height: 30.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFF3FFF94),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StyledDivider(
                                    height: 2.0,
                                    thickness: 1.0,
                                    color: Color(0xFF3FFF94),
                                    lineStyle: DividerLineStyle.dashed,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 20.0,
                              height: 30.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFF3FFF94),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xFF03AB6F),
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
                                child: Text(
                                  'Pagamento Seguro',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: const Color(0xFFF8F3F3),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 20.0),
                            child: Text(
                              'Os pagamentos são efetuados por meio do Mercado Pago. Após a validação do pagamento através da plataforma, a renovação do seu usuário ocorre automaticamente.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: const Color(0xFF3FFF94),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xFF03AB6F),
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
                                child: Text(
                                  'Renovação garantida',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: const Color(0xFFF8F3F3),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 40.0),
                            child: Text(
                              'A renovação é realizada e sua conta mantém os mesmos canais, filmes e séries, sem nenhuma restrição. A renovação também inclui atualizações de conteúdo durante o período vigente.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: const Color(0xFF3FFF94),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
          ))
            const SizedBox(
              height: 100.0,
              child: VerticalDivider(
                width: 80.0,
                thickness: 1.0,
                color: Color(0x00FFFFFF),
              ),
            ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 0.0,
                      sigmaY: 0.0,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/Sem_nome_(1500__1920_px).png',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Valor a pagar',
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: const Color(0xFF9196A3),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'R\$: ${widget.valor?.toString()}',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 55.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(
                                        Icons.check_circle_rounded,
                                        color: Color(0xFF03AB6F),
                                        size: 24.0,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Pagamento Seguro',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Text(
                                      'Os pagamentos são efetuados por meio do Mercado Pago. Após a validação do pagamento através da plataforma, a renovação do seu usuário ocorre automaticamente.',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: const Color(0xFF767A84),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.check_circle_rounded,
                                        color: Color(0xFF03AB6F),
                                        size: 24.0,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Renovação garantida',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: Text(
                                      'Para renovaçoes sua conta se mantém os mesmos conteúdos, sem nenhuma restrição. A renovação também inclui atualizações no período vigente.',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: const Color(0xFF767A84),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0x6100FFE1),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Pagamento via PIX',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: const Color(0xDF090F13),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
          ))
            const SizedBox(
              height: 100.0,
              child: VerticalDivider(
                width: 20.0,
                thickness: 1.0,
                color: Color(0x00FFFFFF),
              ),
            ),
        ],
      ),
    );
  }
}
