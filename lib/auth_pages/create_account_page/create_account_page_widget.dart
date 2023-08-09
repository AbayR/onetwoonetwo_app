import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_component/back_component_widget.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'create_account_page_model.dart';
export 'create_account_page_model.dart';

class CreateAccountPageWidget extends StatefulWidget {
  const CreateAccountPageWidget({
    Key? key,
    String? email,
    required this.confirmPassword,
  })  : this.email = email ?? 'null@gmail.com',
        super(key: key);

  final String email;
  final int? confirmPassword;

  @override
  _CreateAccountPageWidgetState createState() =>
      _CreateAccountPageWidgetState();
}

class _CreateAccountPageWidgetState extends State<CreateAccountPageWidget> {
  late CreateAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAccountPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateAccountPage'});
    _model.nameController ??= TextEditingController();
    _model.surnameController ??= TextEditingController();
    _model.dateOfBirthController ??= TextEditingController();
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                wrapWithModel(
                  model: _model.backComponentModel,
                  updateCallback: () => setState(() {}),
                  child: BackComponentWidget(),
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
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ch3v18fz' /* Tell us about
yourself */
                      ,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 12.0),
                        child: TextFormField(
                          controller: _model.nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '479vibo1' /* Name */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
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
                          validator: _model.nameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 12.0),
                        child: TextFormField(
                          controller: _model.surnameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '2pzgiubw' /* Surname */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
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
                          validator: _model.surnameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: CountriesCall.call(),
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
                            final countryCountriesResponse = snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller: _model.countryValueController ??=
                                  FormFieldController<String>(null),
                              options: (CountriesCall.name(
                                countryCountriesResponse.jsonBody,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()!,
                              onChanged: (val) =>
                                  setState(() => _model.countryValue = val),
                              width: 300.0,
                              height: 50.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'QuickSand',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: false,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'QuickSand',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    useGoogleFonts: false,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '23yjqj1b' /* Country */,
                              ),
                              searchHintText:
                                  FFLocalizations.of(context).getText(
                                '0hz5u9hd' /* Enter country */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: Color(0xFFEFEEF3),
                              elevation: 2.0,
                              borderColor: Color(0x00E0E3E7),
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isSearchable: true,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.partnerClubValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            FFLocalizations.of(context).getText(
                              'nglaidvz' /* SC Braga */,
                            )
                          ],
                          onChanged: (val) =>
                              setState(() => _model.partnerClubValue = val),
                          width: 300.0,
                          height: 50.0,
                          searchHintTextStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'QuickSand',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                useGoogleFonts: false,
                              ),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'QuickSand',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                useGoogleFonts: false,
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'vvzx396y' /* Partner Club */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'py7mbskr' /* Enter Club */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFEFEEF3),
                          elevation: 2.0,
                          borderColor: Color(0x00E0E3E7),
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isSearchable: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEFEEF3),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.dateOfBirthController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '8vunchbq' /* Date of birth */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'QuickSand',
                                      color: Color(0xFF6C6F71),
                                      useGoogleFonts: false,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '0uxsvl6d' /* dd.mm.yyyy */,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'QuickSand',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: false,
                                  ),
                              validator: _model.dateOfBirthControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.dateOfBirthMask],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_ACCOUNT_Container_icgkzhbi_ON_TAP');
                            logFirebaseEvent('BtnMain_validate_form');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            if (_model.countryValue == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Choose your country',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 2000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              );
                              return;
                            }
                            if (_model.partnerClubValue == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Choose your club',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              );
                              return;
                            }
                            logFirebaseEvent('BtnMain_auth');
                            GoRouter.of(context).prepareAuthEvent(true);
                            if (widget.confirmPassword.toString() !=
                                valueOrDefault<String>(
                                  widget.confirmPassword.toString(),
                                  'null',
                                )) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFLocalizations.of(context).getText(
                                      'b4irxrri' /* Passswords dont match */,
                                    ),
                                  ),
                                ),
                              );
                              return;
                            }

                            final user =
                                await authManager.createAccountWithEmail(
                              context,
                              valueOrDefault<String>(
                                widget.email,
                                'null@gmail.com',
                              ),
                              widget.confirmPassword.toString(),
                            );
                            if (user == null) {
                              return;
                            }

                            await UsersRecord.collection.doc(user.uid).update({
                              ...createUsersRecordData(
                                email: widget.email,
                                displayName: _model.nameController.text,
                                club: _model.partnerClubValue,
                                country: _model.countryValue,
                                dateOfBirth: _model.dateOfBirthController.text,
                                role: 'Player',
                                password: widget.confirmPassword,
                                biometrics: true,
                                photoUrl:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/one-two-one-two-app-o8j7ss/assets/exjuohgfsfua/default-profile-picture-avatar-photo-placeholder-vector-illustration-default-profile-picture-avatar-photo-placeholder-vector-189495158.webp',
                                points: 0,
                                surname: _model.surnameController.text,
                              ),
                              'created_time': FieldValue.serverTimestamp(),
                            });

                            logFirebaseEvent('BtnMain_backend_call');

                            await RequestsRecord.collection
                                .doc()
                                .set(createRequestsRecordData(
                                  club: _model.partnerClubValue,
                                  user: currentUserReference,
                                ));
                            logFirebaseEvent('BtnMain_navigate_to');

                            context.goNamedAuth(
                              'MainPage',
                              context.mounted,
                              ignoreRedirect: true,
                            );
                          },
                          child: wrapWithModel(
                            model: _model.btnMainModel,
                            updateCallback: () => setState(() {}),
                            child: BtnMainWidget(
                              btnText: FFLocalizations.of(context).getText(
                                'u23vsiwg' /* Start using */,
                              ),
                            ),
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
      ),
    );
  }
}
