import '/auth/firebase_auth/auth_util.dart';
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
import 'email_page_model.dart';
export 'email_page_model.dart';

class EmailPageWidget extends StatefulWidget {
  const EmailPageWidget({
    Key? key,
    String? choice,
  })  : this.choice = choice ?? 'login',
        super(key: key);

  final String choice;

  @override
  _EmailPageWidgetState createState() => _EmailPageWidgetState();
}

class _EmailPageWidgetState extends State<EmailPageWidget> {
  late EmailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EmailPage'});
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
                  logFirebaseEvent('EMAIL_Container_mm1msrcs_ON_TAP');
                  logFirebaseEvent('BackComponent_navigate_back');
                  context.safePop();
                },
                child: wrapWithModel(
                  model: _model.backComponentModel,
                  updateCallback: () => setState(() {}),
                  child: BackComponentWidget(),
                ),
              ),
              if (widget.choice != 'Login')
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
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
                widget.choice == 'Login' ? 'Welcome' : 'Let’s get started!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 24.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'lelu3pee' /* Please, enter your email  */,
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
                      'b8lnt7n5' /* E-mail */,
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
              if (widget.choice != 'Login')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'EMAIL_PAGE_PAGE_RichText_00w5o0g3_ON_TAP');
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
                              '3ur6cxcq' /* I agree with the  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'otgqi4pw' /* Terms of Use  */,
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'lo8qwg94' /* and  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'x6xfjvgv' /* Privacy policy */,
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
                          logFirebaseEvent('EMAIL_Container_vuss9cpx_ON_TAP');
                          if (widget.choice == 'Login') {
                            logFirebaseEvent('BtnMain_backend_call');
                            _model.apiResulto2j = await SendEmailCall.call(
                              destinationEmail: _model.textController.text,
                              passwordEmail: btnMainUsersRecord?.password,
                            );
                            if ((_model.apiResulto2j?.succeeded ?? true)) {
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

                          logFirebaseEvent('BtnMain_wait__delay');
                          await Future.delayed(
                              const Duration(milliseconds: 1000));

                          setState(() {});
                        },
                        onDoubleTap: () async {
                          logFirebaseEvent(
                              'EMAIL_Container_vuss9cpx_ON_DOUBLE_TAP');
                          logFirebaseEvent('BtnMain_backend_call');
                          _model.apiResultomz = await SendEmailCall.call(
                            destinationEmail: currentUserEmail,
                            passwordEmail: FFAppState().password,
                          );
                          if ((_model.apiResultomz?.succeeded ?? true)) {
                            logFirebaseEvent('BtnMain_navigate_to');

                            context.pushNamed('MainPage');
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
