import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_component/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'password_page_model.dart';
export 'password_page_model.dart';

class PasswordPageWidget extends StatefulWidget {
  const PasswordPageWidget({
    Key? key,
    String? emailEntered,
    required this.choice,
  })  : this.emailEntered = emailEntered ?? 'footballmaster001@gmail.com ',
        super(key: key);

  final String emailEntered;
  final String? choice;

  @override
  _PasswordPageWidgetState createState() => _PasswordPageWidgetState();
}

class _PasswordPageWidgetState extends State<PasswordPageWidget> {
  late PasswordPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PasswordPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PASSWORD_PasswordPage_ON_INIT_STATE');
      logFirebaseEvent('PasswordPage_timer');
      _model.timerController.onExecute.add(StopWatchExecute.start);
    });

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
                  logFirebaseEvent('PASSWORD_Container_f6pqvff9_ON_TAP');
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
                            color: FlutterFlowTheme.of(context).primary,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '290nz1hk' /* Enter verification code */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 24.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.emailEntered,
                    'footballmaster001@gmail.com ',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelSmall,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'qgzsy5ne' /* We have sent a verification co... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelSmall,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  onFieldSubmitted: (_) async {
                    logFirebaseEvent(
                        'PASSWORD_TextField_yn9hneu0_ON_TEXTFIELD');
                    if (widget.choice == 'Login') {
                      logFirebaseEvent('TextField_auth');
                      GoRouter.of(context).prepareAuthEvent(true);

                      final user = await authManager.signInWithEmail(
                        context,
                        widget.emailEntered,
                        _model.textController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      logFirebaseEvent('TextField_navigate_to');

                      context.goNamedAuth(
                        'MainPage',
                        context.mounted,
                        ignoreRedirect: true,
                      );
                    } else {
                      logFirebaseEvent('TextField_update_app_state');
                      setState(() {
                        FFAppState().password =
                            int.parse(_model.textController.text);
                      });
                      logFirebaseEvent('TextField_navigate_to');

                      context.goNamedAuth(
                        'CreateAccountPage',
                        context.mounted,
                        queryParameters: {
                          'confirmPassword': serializeParam(
                            int.tryParse(_model.textController.text),
                            ParamType.int,
                          ),
                          'email': serializeParam(
                            widget.emailEntered,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        ignoreRedirect: true,
                      );
                    }
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      '75aglfls' /* Verification code */,
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
              Builder(
                builder: (context) {
                  if (_model.timerMilliseconds == 00) {
                    return Visibility(
                      visible: _model.timerMilliseconds == 0,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord.where(
                                'email',
                                isEqualTo: widget.emailEntered != ''
                                    ? widget.emailEntered
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
                            List<UsersRecord> textUsersRecordList =
                                snapshot.data!;
                            final textUsersRecord =
                                textUsersRecordList.isNotEmpty
                                    ? textUsersRecordList.first
                                    : null;
                            return Text(
                              FFLocalizations.of(context).getText(
                                'pe0amljz' /* Send again */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'QuickSand',
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: false,
                                  ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '3b5ir64b' /* Send again in  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'QuickSand',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  useGoogleFonts: false,
                                ),
                          ),
                          FlutterFlowTimer(
                            initialTime: _model.timerMilliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              minute: false,
                              milliSecond: false,
                            ),
                            timer: _model.timerController,
                            updateStateInterval: Duration(milliseconds: 30000),
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerMilliseconds = value;
                              _model.timerValue = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              logFirebaseEvent(
                                  'PASSWORD_Timer_tkx3od03_ON_TIMER_END');
                              if (_model.timerMilliseconds == 0) {
                                if (widget.choice == 'Login') {
                                  logFirebaseEvent('Timer_backend_call');
                                  _model.apilog = await SendEmailCall.call(
                                    destinationEmail: widget.emailEntered,
                                    passwordEmail: valueOrDefault(
                                        currentUserDocument?.password, 0),
                                  );
                                  if ((_model.apilog?.succeeded ?? true)) {
                                    logFirebaseEvent('Timer_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Succeed! Check your email!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent('Timer_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Error! Try again',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                } else {
                                  logFirebaseEvent('Timer_backend_call');
                                  _model.apireg = await SendEmailCall.call(
                                    destinationEmail: widget.emailEntered,
                                    passwordEmail: FFAppState().password,
                                  );
                                  if ((_model.apireg?.succeeded ?? true)) {
                                    logFirebaseEvent('Timer_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Succeed! Check your email!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent('Timer_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Error! Try again',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                }

                                logFirebaseEvent('Timer_timer');
                                _model.timerController.onExecute
                                    .add(StopWatchExecute.reset);
                              } else {
                                logFirebaseEvent('Timer_timer');
                                _model.timerController.onExecute
                                    .add(StopWatchExecute.reset);
                              }

                              setState(() {});
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'QuickSand',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'gs0wnvs3' /*  sec */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'QuickSand',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
