import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../api/camp_images_api.dart';
import '../notifier/camp_images_notifier.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';



String campName = "Nonwa Gbam Tai NYSC Orientation Camp";
String aboutCamp = "About $campName";

String visionSwipe = "Swipe left on 'OUR VISION STATEMENT'  >>>";
String visionTitle = "OUR VISION STATEMENT";
String visionStatement = "Raising the total Nigerian youth through comprehensive education.";
String missionTitle = "OUR MISSION STATEMENT";
String missionStatement = "Mobilizing Academic, Moral, Social, Political and Religious tools, by dedicated and vision driven educators in a proactive environment of teaching and learning, which is geared towards impacting and equipping our corp members to be THE TOTAL NIGERIAN YOUTH the world will be proud of.";

String coreValues = "OUR CORE VALUES";
String cvStatement1 = "1. We are dedicated to the success of your ward\n\n";
String cvStatement2 = "2. We teach academics as well as morals\n\n";
String cvStatement3 = "3. We are genuinely interested in deploying the full capacity of your ward.\n\n";
String cvStatement4 = "4. We create a social atmosphere for corpers and we believe every youth can excel.";

String whyCampGroup = "WHY $campName?".toUpperCase();
String whyCampGroupStatement = "$campName was established on the 3rd of October 1974 out of the vision and passion of President David Oludepo to empower today’s youth for tomorrows challenges.\n\nWe offer students (both domestic and international) the opportunity to earn an unparalleled high-quality educational experience. With passionate and  qualified teaching staff, a clean and caring school atmosphere, and the resources to supply students with the skills necessary for their continued personal success, our school looks to help students to realize their potential.";
String campBody = "Nonwa Gbam Tai NYSC Orientation Camp Student Body\n\n";
String campStaffBody = "Nonwa Gbam Tai NYSC Orientation Camp Body\n\n";
String campCorpersBodyStatement = "We currently have 53 corp members in $campName, 31 male corpers and 22 female corpers. 13 corp members have graduated from $campName.";
String campStaffBodyStatement = "We currently have 42 staff members in $campName, 19 male staff and 23 female staff.";
String campCorpersPopulationChart = "$campName Corp Members Population Chart";
String campStaffPopulationChart = "$campName Staff Members Population Chart";

String nyscCampArial = "Some of our campArial";
String nyscCampArialSwipe = "Swipe left or right for more photos";

double maleCampCorperPopulation = 31;
double femaleCampCorperPopulation = 22;

double campStaffPopulation = 42;


Color backgroundColor = Color.fromRGBO(34, 87, 126, 1.0);
Color appBarBackgroundColor = Color.fromRGBO(34, 87, 126, 1);
Color appBarIconColor = Colors.white70;
Color appBarBackgroundTextColor = Colors.white70;
Color cardBackgroundColor = Color.fromRGBO(12, 49, 74, 1.0);
Color cardTextColor = Colors.white70;
Color materialColor = Colors.transparent;
Color materialInkWellColor = Color.fromRGBO(50, 106, 152, 1.0);
Color materialTextColor = Colors.white70;
Color containerColor = Color.fromRGBO(50, 106, 152, 1.0);
Color containerTextColor = Colors.white70;
Color containerColor2 = Color.fromRGBO(50, 106, 152, 1.0);
Color chartBackgroundColor = Color.fromRGBO(21, 65, 93, 1.0);
Color chartTextColor = Colors.white70;
Color firstCampCorperChartColor = Color.fromRGBO(34, 87, 126, 1);
Color secondCampCorperChartColor = Color.fromRGBO(21, 65, 93, 1.0);
Color firstCampBodyChartColor = Color.fromRGBO(34, 87, 126, 1);
Color secondCampBodyChartColor = Color.fromRGBO(21, 65, 93, 1.0);
Color thirdCampBodyChartColor = Color.fromRGBO(12, 49, 74, 1.0);


class AboutCamp extends StatefulWidget {

  @override
  _AboutCamp createState() => _AboutCamp();
}

class _AboutCamp extends State<AboutCamp> {

  final controlla = PageController(
    initialPage: 0,
  );

  var scrollDirection = Axis.horizontal;


  @override
  void initState() {

    CampArialNotifier campArialNotifier = Provider.of<CampArialNotifier>(context, listen: false);
    getCampArial(campArialNotifier);

    campBodyMap.putIfAbsent("Male Corp Members", () => 31);
    campBodyMap.putIfAbsent("Female Corp Members", () => 22);
    campBodyMap.putIfAbsent("Camp Staff Members", () => 42);

    campCorperMap.putIfAbsent("Male Corp Members", () => 31);
    campCorperMap.putIfAbsent("Female Corp Members", () => 22);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CampArialNotifier campArialNotifier = Provider.of<CampArialNotifier>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(aboutCamp,
        style: TextStyle(
          color: appBarBackgroundTextColor)),
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(visionSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: materialTextColor,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    visionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                visionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    missionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                missionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    coreValues,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: cvStatement1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement2,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement3,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement4,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    whyCampGroup,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                whyCampGroupStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: campBody,
                                  style: TextStyle(
                                    color: materialTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ), TextSpan(
                                  text: campCorpersBodyStatement,
                                  style: TextStyle(
                                    color: materialTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10, right: 10),
                            child: Text(campCorpersPopulationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: materialTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: campCorperMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 22,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: campCorperColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: materialTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: chartTextColor
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: campBody,
                                  style: TextStyle(
                                    color: materialTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ), TextSpan(
                                  text: campStaffBodyStatement,
                                  style: TextStyle(
                                    color: materialTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 380,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10, right: 10),
                            child: Text(campStaffPopulationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: materialTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: campBodyMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 22,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: campBodyColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: materialTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: chartTextColor
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            

            
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(nyscCampArial,
                style: TextStyle(
                    fontSize: 20,
                    color: materialTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(nyscCampArialSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: materialTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: campArialNotifier.campArialList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            image: DecorationImage(
                              alignment: Alignment(0, -0.6),
                              image: CachedNetworkImageProvider(
                                  campArialNotifier.campArialList[index].image
                              ),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            color: containerColor2
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                campArialNotifier.campArialList[index].toastName,
                                style: TextStyle(
                                  color: containerTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemWidth: 350,
                layout: SwiperLayout.STACK,
              ),

            ),

          ],
        ),
      ),
    );

  }
}

class CampCorperPopulation{
  String x;
  double y;
  CampCorperPopulation(this.x,this.y);
}

dynamic getCampCorperPopulationData(){
  List<CampCorperPopulation> campCorperPopulationData = <CampCorperPopulation>[
    CampCorperPopulation('Male', maleCampCorperPopulation),
    CampCorperPopulation('Female', femaleCampCorperPopulation),
  ];
  return campCorperPopulationData;
}

class CampBodyPopulation{
  String x;
  double y;
  CampBodyPopulation(this.x,this.y);
}

dynamic getCampBodyPopulationData(){
  List<CampBodyPopulation> campBodyPopulationData = <CampBodyPopulation>[
    CampBodyPopulation('Male', maleCampCorperPopulation),
    CampBodyPopulation('Female', femaleCampCorperPopulation),
    CampBodyPopulation('Staff', campStaffPopulation),
  ];
  return campBodyPopulationData;
}



bool toggle = false;

Map<String, double> campBodyMap = Map();
Map<String, double> campCorperMap = Map();

List<Color> campCorperColorList = [
  firstCampCorperChartColor,
  secondCampCorperChartColor,
];

List<Color> campBodyColorList = [
  firstCampBodyChartColor,
  secondCampBodyChartColor,
  thirdCampBodyChartColor,
];