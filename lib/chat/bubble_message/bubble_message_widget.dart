import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bubble_message_model.dart';
export 'bubble_message_model.dart';

class BubbleMessageWidget extends StatefulWidget {
  const BubbleMessageWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final String? question;

  @override
  _BubbleMessageWidgetState createState() => _BubbleMessageWidgetState();
}

class _BubbleMessageWidgetState extends State<BubbleMessageWidget> {
  late BubbleMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BubbleMessageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 134.0,
          maxWidth: 248.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFEFEEF3),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.question!,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'bxhne8m4' /* 18:47 */,
                ),
                textAlign: TextAlign.end,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'QuickSand',
                      color: Color(0xFF6C6F71),
                      fontSize: 10.0,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
