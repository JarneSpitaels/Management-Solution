import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../cart/cart_widget.dart';
import '../create_bar_item/create_bar_item_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../item/item_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinksandfoodWidget extends StatefulWidget {
  const DrinksandfoodWidget({
    Key key,
    this.name,
  }) : super(key: key);

  final String name;

  @override
  _DrinksandfoodWidgetState createState() => _DrinksandfoodWidgetState();
}

class _DrinksandfoodWidgetState extends State<DrinksandfoodWidget> {
  String choiceChipsValue;
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
          'Honesty bar',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartWidget(
                user: currentUserReference,
              ),
            ),
          );
        },
        backgroundColor: Color(0xFF0A9782),
        icon: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        elevation: 50,
        label: Align(
          alignment: AlignmentDirectional(-0.1, 0),
          child: StreamBuilder<List<CartRecord>>(
            stream: queryCartRecord(
              singleRecord: true,
            ),
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
              List<CartRecord> badgeCartRecordList = snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final badgeCartRecord = badgeCartRecordList.isNotEmpty
                  ? badgeCartRecordList.first
                  : null;
              return Badge(
                badgeContent: Text(
                  '1',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                ),
                showBadge: true,
                shape: BadgeShape.circle,
                badgeColor: FlutterFlowTheme.of(context).primaryColor,
                elevation: 4,
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                position: BadgePosition.topEnd(),
                animationType: BadgeAnimationType.scale,
                toAnimate: true,
              );
            },
          ),
        ),
      ),
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
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-2.39, -5.67),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                        child: TextFormField(
                          controller: searchFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Search food, drinks...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    if ((currentUserDocument?.isAdmin) == true)
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                          child: AuthUserStreamWidget(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateBarItemWidget(),
                                  ),
                                );
                              },
                              text: 'Create new bar item',
                              options: FFButtonOptions(
                                width: 200,
                                height: 20,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-0.97, 45.94),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 150, 10),
                    child: FlutterFlowChoiceChips(
                      initiallySelected: choiceChipsValue != null
                          ? [choiceChipsValue]
                          : ['drink'],
                      options: [
                        ChipData('food', Icons.fastfood_rounded),
                        ChipData('drink', Icons.sports_bar)
                      ],
                      onChanged: (val) =>
                          setState(() => choiceChipsValue = val.first),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: Color(0xFF262D34),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        iconColor: Colors.white,
                        iconSize: 18,
                        elevation: 4,
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF262D34),
                                ),
                        iconColor: Color(0xFF262D34),
                        iconSize: 18,
                        elevation: 4,
                      ),
                      chipSpacing: 20,
                      multiselect: false,
                      initialized: choiceChipsValue != null,
                      alignment: WrapAlignment.start,
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<ItemsRecord>>(
                    stream: queryItemsRecord(
                      queryBuilder: (itemsRecord) => itemsRecord.where('type',
                          isEqualTo: choiceChipsValue),
                    ),
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
                      List<ItemsRecord> listViewItemsRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewItemsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewItemsRecord =
                              listViewItemsRecordList[listViewIndex];
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemWidget(
                                        items: listViewItemsRecord,
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.96, -0.75),
                                      child: Text(
                                        listViewItemsRecord.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0A9782),
                                              fontSize: 18,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-0.09, 0),
                                      child: Hero(
                                        tag: listViewItemsRecord.imageurl,
                                        transitionOnUserGestures: true,
                                        child: Image.network(
                                          listViewItemsRecord.imageurl,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.97, -0.79),
                                      child: Text(
                                        formatNumber(
                                          listViewItemsRecord.value,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: '€',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF57636C),
                                              fontSize: 20,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
