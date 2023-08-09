import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/components_profile/about_points/about_points_widget.dart';
import '/profile/components_profile/no_awards/no_awards_widget.dart';
import '/profile/components_profile/profile_settings_container/profile_settings_container_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'profilePage'});
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: 471.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 250.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).secondary
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60.0),
                              bottomRight: Radius.circular(60.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: 319.0,
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEFEEF3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 24.0, 18.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 120.0,
                                    height: 120.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      currentUserPhoto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      '${currentUserDisplayName}, ${functions.calculateAge(getCurrentTimestamp, valueOrDefault(currentUserDocument?.dateOfBirth, '')).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/FC_Barcelona_(crest)_1.png',
                                        width: 18.0,
                                        height: 17.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                            currentUserDocument?.club, ''),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 18.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Color(0xFF9143F8),
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            '${valueOrDefault<String>(
                                              valueOrDefault(
                                                      currentUserDocument
                                                          ?.points,
                                                      0)
                                                  .toString(),
                                              '0',
                                            )} points',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'QuickSand',
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PROFILE_PAGE_PAGE_Icon_1xmvy633_ON_TAP');
                                          logFirebaseEvent('Icon_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Color(0x00FFFFFF),
                                            barrierColor: Color(0x5B000000),
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: 288.0,
                                                    child: AboutPointsWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Icon(
                                          FFIcons.kquestionMarkCircleOutline,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.noAwardsModel,
                                        updateCallback: () => setState(() {}),
                                        child: NoAwardsWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 50.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'vkl668bs' /* Profile */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'QuickSand',
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 24.0, 30.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '0cyqm8t3' /* Settings */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'QuickSand',
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                      ),
                      if (valueOrDefault<bool>(
                              currentUserDocument?.isClub, false) ==
                          true)
                        AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PROFILE_Container_gbgfgdi9_ON_TAP');
                              logFirebaseEvent(
                                  'ProfileSettingsContainer_navigate_to');

                              context.pushNamed('AdminPanel');
                            },
                            child: wrapWithModel(
                              model: _model.profileSettingsContainerModel1,
                              updateCallback: () => setState(() {}),
                              child: ProfileSettingsContainerWidget(
                                icon: Icon(
                                  Icons.sports_soccer,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 16.0,
                                ),
                                title: FFLocalizations.of(context).getText(
                                  'doi6a9xb' /* Admin panel */,
                                ),
                                description:
                                    FFLocalizations.of(context).getText(
                                  'dgli35rj' /* Control your courses */,
                                ),
                              ),
                            ),
                          ),
                        ),
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PROFILE_Container_w489i3g4_ON_TAP');
                            logFirebaseEvent(
                                'ProfileSettingsContainer_navigate_to');

                            context.pushNamed('ProfileInformationPage');
                          },
                          child: wrapWithModel(
                            model: _model.profileSettingsContainerModel2,
                            updateCallback: () => setState(() {}),
                            child: ProfileSettingsContainerWidget(
                              icon: Icon(
                                FFIcons.kprofile,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              title: valueOrDefault<bool>(
                                          currentUserDocument?.isClub, false) ==
                                      true
                                  ? 'Club data'
                                  : 'Personal data',
                              description: valueOrDefault<bool>(
                                          currentUserDocument?.isClub, false) ==
                                      true
                                  ? 'Change your club\'s information'
                                  : 'Change your profile information',
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PROFILE_Container_hnt9bb9z_ON_TAP');
                          logFirebaseEvent(
                              'ProfileSettingsContainer_navigate_to');

                          context.pushNamed('ChangeLanguagePage');
                        },
                        child: wrapWithModel(
                          model: _model.profileSettingsContainerModel3,
                          updateCallback: () => setState(() {}),
                          child: ProfileSettingsContainerWidget(
                            icon: Icon(
                              FFIcons.kglobe,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            title: FFLocalizations.of(context).getText(
                              '4l6h3j4m' /* Language */,
                            ),
                            description: FFLocalizations.of(context).getText(
                              '0n2qxvfn' /* Change app language */,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PROFILE_Container_wjas3ymf_ON_TAP');
                          logFirebaseEvent(
                              'ProfileSettingsContainer_navigate_to');

                          context.pushNamed('PrivacyPage');
                        },
                        child: wrapWithModel(
                          model: _model.profileSettingsContainerModel4,
                          updateCallback: () => setState(() {}),
                          child: ProfileSettingsContainerWidget(
                            icon: Icon(
                              FFIcons.klock,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            title: FFLocalizations.of(context).getText(
                              'w3v5fscj' /* Privacy */,
                            ),
                            description: FFLocalizations.of(context).getText(
                              'ddpkzhz4' /* Change your access settings */,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PROFILE_Container_j2ofan3u_ON_TAP');
                          logFirebaseEvent(
                              'ProfileSettingsContainer_navigate_to');

                          context.pushNamed('NotificationSettingsPage');
                        },
                        child: wrapWithModel(
                          model: _model.profileSettingsContainerModel5,
                          updateCallback: () => setState(() {}),
                          child: ProfileSettingsContainerWidget(
                            icon: Icon(
                              FFIcons.kbell,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            title: FFLocalizations.of(context).getText(
                              'jiy5vabt' /* Notifications */,
                            ),
                            description: FFLocalizations.of(context).getText(
                              'hbawedot' /* Change your notification setti... */,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PROFILE_Container_wkaxv0ar_ON_TAP');
                          logFirebaseEvent(
                              'ProfileSettingsContainer_navigate_to');

                          context.pushNamed('ContactSupportPage');
                        },
                        child: wrapWithModel(
                          model: _model.profileSettingsContainerModel6,
                          updateCallback: () => setState(() {}),
                          child: ProfileSettingsContainerWidget(
                            icon: Icon(
                              FFIcons.krocket,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            title: FFLocalizations.of(context).getText(
                              'ghmm6vco' /* Contact support */,
                            ),
                            description: FFLocalizations.of(context).getText(
                              'rxn5yzs8' /* Get help */,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PROFILE_Container_x2pon8mv_ON_TAP');
                          logFirebaseEvent(
                              'ProfileSettingsContainer_navigate_to');

                          context.pushNamed('AboutPage');
                        },
                        child: wrapWithModel(
                          model: _model.profileSettingsContainerModel7,
                          updateCallback: () => setState(() {}),
                          child: ProfileSettingsContainerWidget(
                            icon: Icon(
                              FFIcons.kinfo,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            title: FFLocalizations.of(context).getText(
                              '5af08lgq' /* About app */,
                            ),
                            description: FFLocalizations.of(context).getText(
                              'z3l0xpdg' /* Find our more about us */,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PROFILE_Container_kp9vptya_ON_TAP');
                          logFirebaseEvent('ProfileSettingsContainer_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('OnBoarding', context.mounted);
                        },
                        child: wrapWithModel(
                          model: _model.profileSettingsContainerModel8,
                          updateCallback: () => setState(() {}),
                          child: ProfileSettingsContainerWidget(
                            icon: Icon(
                              FFIcons.klogout,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            title: FFLocalizations.of(context).getText(
                              'qbn7k6ao' /* Log out */,
                            ),
                            description: 'Leave the app',
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 4.0))
                        .around(SizedBox(height: 4.0)),
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
