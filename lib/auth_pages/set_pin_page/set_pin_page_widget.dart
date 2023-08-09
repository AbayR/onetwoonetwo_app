import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'set_pin_page_model.dart';
export 'set_pin_page_model.dart';

class SetPinPageWidget extends StatefulWidget {
  const SetPinPageWidget({Key? key}) : super(key: key);

  @override
  _SetPinPageWidgetState createState() => _SetPinPageWidgetState();
}

class _SetPinPageWidgetState extends State<SetPinPageWidget> {
  late SetPinPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetPinPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SetPinPage'});
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'syxvzmza' /* Enter your pin */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displaySmall,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'm2aa8yoc' /* To quickly enter the mobile ap... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelSmall,
                ),
              ),
              PinCodeTextField(
                autoDisposeControllers: false,
                appContext: context,
                length: 6,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                enableActiveFill: false,
                autoFocus: false,
                enablePinAutofill: false,
                errorTextSpace: 16.0,
                showCursor: true,
                cursorColor: FlutterFlowTheme.of(context).primary,
                obscureText: false,
                pinTheme: PinTheme(
                  fieldHeight: 44.0,
                  fieldWidth: 44.0,
                  borderWidth: 0.0,
                  borderRadius: BorderRadius.circular(12.0),
                  shape: PinCodeFieldShape.box,
                  activeColor: FlutterFlowTheme.of(context).primary,
                  inactiveColor: FlutterFlowTheme.of(context).alternate,
                  selectedColor: FlutterFlowTheme.of(context).primary,
                  activeFillColor: FlutterFlowTheme.of(context).primary,
                  inactiveFillColor: FlutterFlowTheme.of(context).alternate,
                  selectedFillColor: FlutterFlowTheme.of(context).primary,
                ),
                controller: _model.pinCodeController,
                onChanged: (_) {},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    _model.pinCodeControllerValidator.asValidator(context),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_q53azlnc_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.pincode = _model.pincode.toList().cast<int>();
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'te3exo4i' /* 1 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_qrf89u01_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(2);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '2ezuw106' /* 2 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_y4jmyvd8_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(3);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'gb0x1vv4' /* 3 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_6udx8g72_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(4);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '8yv7ef3l' /* 4 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_jaaffdr3_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(5);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'op5ivuor' /* 5 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_ghzuug1o_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(6);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'rocqpgr4' /* 6 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_fh1q26wu_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(7);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'g1yicrbq' /* 7 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_tmxr0ilp_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(8);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '1jfaf68m' /* 8 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_91eoa46d_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(9);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'c6hfnh9k' /* 9 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Icon_g6e2yefy_ON_TAP');
                          logFirebaseEvent('Icon_biometric_verification');
                          final _localAuth = LocalAuthentication();
                          bool _isBiometricSupported =
                              await _localAuth.isDeviceSupported();

                          if (_isBiometricSupported) {
                            _model.biometric = await _localAuth.authenticate(
                                localizedReason:
                                    FFLocalizations.of(context).getText(
                              '1nadfh9k' /* Please authenticate yourself t... */,
                            ));
                            setState(() {});
                          }

                          setState(() {});
                        },
                        child: FaIcon(
                          FontAwesomeIcons.expand,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 34.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Text_1uqovfhq_ON_TAP');
                          logFirebaseEvent('Text_update_widget_state');
                          _model.addToPincode(0);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '7j11ohc8' /* 0 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'QuickSand',
                                fontSize: 34.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SET_PIN_PAGE_PAGE_Icon_ycxn8v0n_ON_TAP');
                          logFirebaseEvent('Icon_update_widget_state');
                          setState(() {
                            _model
                                .removeAtIndexFromPincode(_model.pincode.last);
                          });
                        },
                        child: Icon(
                          Icons.backspace,
                          color: Color(0x337514F5),
                          size: 34.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
