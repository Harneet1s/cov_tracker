import 'dart:convert';
import 'package:covtracker/custom_widgets/virus_loader.dart';
import 'package:covtracker/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:covtracker/panels/mosteffectedcountries.dart';
import 'package:covtracker/panels/worldwidepanel.dart';
import 'package:http/http.dart' as http;

import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  double offset = 0;

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchdata() async{
    fetchWorldWideData();
    fetchCountryData();
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    fetchdata();
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
            children: <Widget>[
              MyHeader(
                image: "assets/icons/Drcorona.svg",
                textTop: "#StayHome",
                textBottom: "#StaySafe",
                offset: offset,
              ),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  worldData == null
                      ? VirusLoader()
                      :PieChart(

                    animationDuration: Duration(milliseconds: 1500),

                    dataMap:
                    {
                      'Confirmed':worldData['cases'].toDouble(),
                      'Active':worldData['active'].toDouble(),
                      'Recovered':worldData['recovered'].toDouble(),
                      'Deaths':worldData['deaths'].toDouble(),
                    },
                    chartType: ChartType.ring,

                    colorList: [
                      Colors.red,
                      Colors.blue,
                      Colors.lightGreenAccent,
                      Colors.yellowAccent,

                    ],

                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Worldwide',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),

                  worldData == null
                      ? Container()
                      : WorldwidePanel(
                    worldData: worldData,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Most affected Countries',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  countryData == null
                      ? Container()
                      : MostAffectedPanel(
                    countryData: countryData,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                        'WE ARE TOGETHER IN THE FIGHT',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  SizedBox(
                    height: 50,
                  )
                ],
              )
            ]),
      ),
    );
  }
}
