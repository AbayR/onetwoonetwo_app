import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/course_information/course_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'course_details_page_model.dart';
export 'course_details_page_model.dart';

class CourseDetailsPageWidget extends StatefulWidget {
  const CourseDetailsPageWidget({
    Key? key,
    required this.course,
    bool? bottomSheet,
  })  : this.bottomSheet = bottomSheet ?? false,
        super(key: key);

  final CoursesRecord? course;
  final bool bottomSheet;

  @override
  _CourseDetailsPageWidgetState createState() =>
      _CourseDetailsPageWidgetState();
}

class _CourseDetailsPageWidgetState extends State<CourseDetailsPageWidget> {
  late CourseDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseDetailsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CourseDetailsPage'});
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('COURSE_DETAILS_arrow_back_rounded_ICN_ON');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'jfedla3c' /* Course details */,
              ),
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: wrapWithModel(
            model: _model.courseInformationModel,
            updateCallback: () => setState(() {}),
            child: CourseInformationWidget(
              course: widget.course!,
              isBottomSheet: false,
            ),
          ),
        ),
      ),
    );
  }
}
