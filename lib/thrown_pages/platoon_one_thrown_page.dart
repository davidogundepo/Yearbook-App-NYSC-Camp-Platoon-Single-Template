import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../about_menu_details_pages/about_nysc_federal.dart';
import '../thrown_searches/platoon_one_thrown_search.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_camp.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/platoon_one_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/platoon_one_details_page.dart';
import '../notifier/platoon_one_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


String nyscName = "NYSC";
String campName = "Nonwa Gbam Tai NYSC Orientation Camp";
String thrownName = "Platoon One Corpers";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";


String whoWeAre = "Who We Are";
String aboutCamp = "About $campName";
String aboutNYSC = "About $nyscName 2021";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/fin_inc_36.jpeg";


Color backgroundColor = Color.fromRGBO(180, 43, 81, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(180, 43, 81, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Color.fromRGBO(180, 43, 81, 1);
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(180, 43, 81, 1);
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(180, 43, 81, 1);
Color borderColor = Colors.black;


class MyPlatoonOnePage extends StatefulWidget with NavigationStates {

  MyPlatoonOnePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyPlatoonOnePageState createState() => _MyPlatoonOnePageState();
}

class _MyPlatoonOnePageState extends State<MyPlatoonOnePage> {

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    PlatoonOneNotifier platoonOneNotifier = Provider.of<PlatoonOneNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              platoonOneNotifier.currentPlatoonOne = platoonOneNotifier.platoonOneList[index];
              navigateToPlatoonOneDetailsPage(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                        alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                platoonOneNotifier.platoonOneList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  platoonOneNotifier.platoonOneList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              (() {
                                if (platoonOneNotifier.platoonOneList[index].platoonExecutive == "Yes") {
                                  return
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon (
                                          MdiIcons.checkboxMarkedCircle,
                                          color: iconColor,
                                        ),
                                      ],
                                    );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon (
                                      MdiIcons.checkboxMarkedCircle,
                                      color: iconColor,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),
                        ),
                        (() {
                          if (platoonOneNotifier.platoonOneList[index].twitter.toString().isNotEmpty) {
                            if (!platoonOneNotifier.platoonOneList[index].twitter.toString().contains("@")) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    platoonOneNotifier.platoonOneList[index].twitter == platoonOneNotifier.platoonOneList[index].twitter ? '@'+platoonOneNotifier.platoonOneList[index].twitter : platoonOneNotifier.platoonOneList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                            else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    platoonOneNotifier.platoonOneList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                          } else {
                            return Visibility(
                              visible: !_isVisible,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    platoonOneNotifier.platoonOneList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              ),
                            );
                          }
                        }()),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToPlatoonOneDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlatoonOneDetailsPage()));
  }
  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutCamp(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutCamp()));
  }
  Future navigateToAboutNYSCFederalState(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutNYSCFederalState()));
  }

  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }


  @override
  void initState() {
    PlatoonOneNotifier platoonOneNotifier = Provider.of<PlatoonOneNotifier>(context, listen: false);
    getPlatoonOne(platoonOneNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    PlatoonOneNotifier platoonOneNotifier = Provider.of<PlatoonOneNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft,
                        color: appBarIconColor),
                      onPressed: () async {
                        showModalBottomSheet(
                            backgroundColor: modalBackgroundColor,
                            context: context,
                            builder: (context) => Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: modalColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColor,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                            leading: new Icon(MdiIcons.atom, color: iconColor),
                                            title: new Text(whoWeAre,
                                              style: GoogleFonts.zillaSlab(
                                                  color: textColor
                                              ),),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToWhoWeArePage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: new Icon(MdiIcons.chessQueen, color: iconColor),
                                          title: new Text(aboutCamp,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutCamp(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: new Icon(MdiIcons.chessKing, color: iconColor),
                                          title: new Text(aboutNYSC,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutNYSCFederalState(context);
                                          },
                                        ),
                                        ListTile(
                                            leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: iconColor),
                                            title: new Text(acronymMeanings,
                                              style: GoogleFonts.zillaSlab(
                                                  color: textColor
                                              ),),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToAcronymsMeaningsPage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: new Icon(MdiIcons.opacity, color: iconColor),
                                          title: new Text(aboutApp,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutAppDetailsPage(context);
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: platoonOneNotifier.platoonOneList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyPlatoonOneSearch(all: platoonOneNotifier.platoonOneList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Center(
                      heightFactor: 0.6,
                      child: Text(
                          thrownName,
                          style: GoogleFonts.abel(
                              color: appBarTextColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    background: Image.asset(imgAsset,
                      alignment: Alignment(0, -0.6),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: platoonOneNotifier.platoonOneList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
