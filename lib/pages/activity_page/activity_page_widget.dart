import '/components/basic_form_field_widget.dart';
import '/components/date_time_form_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'activity_page_model.dart';
export 'activity_page_model.dart';

class ActivityPageWidget extends StatefulWidget {
  const ActivityPageWidget({super.key});

  @override
  State<ActivityPageWidget> createState() => _ActivityPageWidgetState();
}

class _ActivityPageWidgetState extends State<ActivityPageWidget> {
  late ActivityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/logo-1-removebg-preview.PNG',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 1.0),
                  child: Text(
                    ' ',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Aktivite Ekleme Sayfası',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        decoration: TextDecoration.underline,
                      ),
                ),
                wrapWithModel(
                  model: _model.basicFormFieldModel1,
                  updateCallback: () => setState(() {}),
                  child: const BasicFormFieldWidget(
                    titleText: 'Etkinlik Başlığı',
                    hintText: 'örneğin koli taşınması',
                  ),
                ),
                wrapWithModel(
                  model: _model.basicFormFieldModel2,
                  updateCallback: () => setState(() {}),
                  child: const BasicFormFieldWidget(
                    titleText: 'İçerik',
                    hintText: 'örneğin hayır için birebir...',
                  ),
                ),
                wrapWithModel(
                  model: _model.dateTimeFormFieldModel1,
                  updateCallback: () => setState(() {}),
                  child: const DateTimeFormFieldWidget(
                    titleText: 'Başlangıç Zamanı',
                  ),
                ),
                wrapWithModel(
                  model: _model.dateTimeFormFieldModel2,
                  updateCallback: () => setState(() {}),
                  child: const DateTimeFormFieldWidget(
                    titleText: 'Sona Eriş Zamanı',
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.createdEvent = await actions.eventToJson(
                        _model.basicFormFieldModel1.textController.text,
                        _model.basicFormFieldModel2.textController.text,
                        _model.dateTimeFormFieldModel1.datePicked!,
                        _model.dateTimeFormFieldModel2.datePicked!,
                      );
                      _model.accessToken = await actions.signWithGoogle();
                      await actions.addEventToCalendar(
                        _model.accessToken!,
                        _model.createdEvent!,
                      );

                      setState(() {});
                    },
                    text: 'Takvime Ekle',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'calendar',
                      queryParameters: {
                        'accessToken': serializeParam(
                          _model.accessToken,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Takvimi Gör',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
