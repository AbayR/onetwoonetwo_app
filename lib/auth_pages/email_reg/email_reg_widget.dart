import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_component/back_component_widget.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/components/privacy_policy/privacy_policy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_reg_model.dart';
export 'email_reg_model.dart';

class EmailRegWidget extends StatefulWidget {
  const EmailRegWidget({Key? key}) : super(key: key);

  @override
  _EmailRegWidgetState createState() => _EmailRegWidgetState();
}

class _EmailRegWidgetState extends State<EmailRegWidget> {
  late EmailRegModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailRegModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EmailReg'});
    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('EMAIL_REG_PAGE_Container_ni8ns7hz_ON_TAP');
                  logFirebaseEvent('BackComponent_navigate_back');
                  context.safePop();
                },
                child: wrapWithModel(
                  model: _model.backComponentModel,
                  updateCallback: () => setState(() {}),
                  child: BackComponentWidget(),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 82.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Container(
                        width: 82.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 82.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                FFLocalizations.of(context).getText(
                  'ezwtcnxk' /* Let’s get started! */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 24.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'bftd0qdc' /* Please, enter your email  */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelSmall,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 1000),
                    () => setState(() {}),
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'pg1eqvo8' /* E-mail */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'QuickSand',
                              color: Color(0xFF6C6F71),
                              useGoogleFonts: false,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).accent4,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).warning,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).warning,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFFEFEEF3),
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('EMAIL_REG_PAGE_RichText_0fegbis6_ON_TAP');
                    logFirebaseEvent('RichText_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => FocusScope.of(context)
                              .requestFocus(_model.unfocusNode),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.9,
                              child: PrivacyPolicyWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'l5ha4aqv' /* I agree with the  */,
                          ),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'jyv0416l' /* Terms of Use  */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'tvmjyfnw' /* and  */,
                          ),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'd4ure36t' /* Privacy policy */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
              if (_model.textController.text != null &&
                  _model.textController.text != '')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where('email',
                          isEqualTo: _model.textController.text != ''
                              ? _model.textController.text
                              : null),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UsersRecord> btnMainUsersRecordList = snapshot.data!;
                      final btnMainUsersRecord =
                          btnMainUsersRecordList.isNotEmpty
                              ? btnMainUsersRecordList.first
                              : null;
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'EMAIL_REG_PAGE_Container_ph9fliw3_ON_TAP');
                          if (_model.textController.text ==
                              btnMainUsersRecord?.email) {
                            logFirebaseEvent('BtnMain_backend_call');
                            _model.apiResultwk7 = await SendEmailCall.call(
                              destinationEmail: _model.textController.text,
                              passwordEmail: btnMainUsersRecord?.password,
                            );
                            if ((_model.apiResultwk7?.succeeded ?? true)) {
                              logFirebaseEvent('BtnMain_navigate_to');

                              context.pushNamed(
                                'PasswordPage',
                                queryParameters: {
                                  'emailEntered': serializeParam(
                                    _model.textController.text,
                                    ParamType.String,
                                  ),
                                  'choice': serializeParam(
                                    'Login',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          } else {
                            logFirebaseEvent('BtnMain_navigate_to');

                            context.pushNamed(
                              'PasswordPage',
                              queryParameters: {
                                'emailEntered': serializeParam(
                                  _model.textController.text,
                                  ParamType.String,
                                ),
                                'choice': serializeParam(
                                  'Register',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            logFirebaseEvent('BtnMain_update_app_state');
                            setState(() {
                              FFAppState().password = valueOrDefault<int>(
                                random_data.randomInteger(100000, 999999),
                                100000,
                              );
                            });
                            logFirebaseEvent('BtnMain_backend_call');
                            _model.apiResult6vw = await SendEmailCall.call(
                              destinationEmail: _model.textController.text,
                              passwordEmail: valueOrDefault<int>(
                                FFAppState().password,
                                100000,
                              ),
                            );
                          }

                          setState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.btnMainModel,
                          updateCallback: () => setState(() {}),
                          child: BtnMainWidget(
                            btnText: 'Send code',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
