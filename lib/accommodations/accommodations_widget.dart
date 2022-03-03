import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_search/mapbox_search.dart';

class AccommodationsWidget extends StatefulWidget {
  const AccommodationsWidget({Key key}) : super(key: key);

  @override
  _AccommodationsWidgetState createState() => _AccommodationsWidgetState();
}

class _AccommodationsWidgetState extends State<AccommodationsWidget> {
  List<String> checkboxGroupValues;
  TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Accommodations',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFFF9F9F9),
                fontSize: 26,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Stack(
              children: [],
            ),
          ),
          Image.asset(
            'assets/images/White_Background_generated.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: searchFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            'bmzkgjgi' /* Search accommodations */,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.05, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FlutterFlowCheckboxGroup(
                    initiallySelected:
                        checkboxGroupValues != null ? checkboxGroupValues : [],
                    options: ['honesty bar', 'meeting room', '...\n'],
                    onChanged: (val) =>
                        setState(() => checkboxGroupValues = val),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    checkColor: Colors.white,
                    checkboxBorderColor: Color(0xFF95A1AC),
                    textStyle: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: StreamBuilder<List<AccommodationsRecord>>(
                    stream: queryAccommodationsRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: Color(0xFF0A9782),
                            ),
                          ),
                        );
                      }
                      List<AccommodationsRecord>
                          listViewAccommodationsRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewAccommodationsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewAccommodationsRecord =
                              listViewAccommodationsRecordList[listViewIndex];
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.33, 0),
                                    child: Image.network(
                                      listViewAccommodationsRecord.image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    listViewAccommodationsRecord.name,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.73, 0),
                                    child: FlutterFlowStaticMap(
                                      location:
                                          listViewAccommodationsRecord.locatie,
                                      apiKey:
                                          'sk.eyJ1Ijoic3BpdHRpZSIsImEiOiJjbDBiMGFldTQwNmUzM2ptanVhbGI3Nm5vIn0.6GSQsbuoWkJDDeAlMJJAZg',
                                      style: MapBoxStyle.Light,
                                      width: 100,
                                      height: 300,
                                      fit: BoxFit.cover,
                                      borderRadius: BorderRadius.circular(0),
                                      markerColor: Color(0xFF0A9782),
                                      zoom: 14,
                                      tilt: 0,
                                      rotation: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
