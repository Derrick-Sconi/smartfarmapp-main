import 'package:flutter/material.dart';
import 'package:smartfarmapp/core/model/soil_condition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final soilConditionsList = <SoilCondition>[
    SoilCondition(
      humidity: '10',
      temperature: '5',
      ph: '7',
      moisture: '20',
      cO2Level: '32',
    ),
    SoilCondition(
      humidity: '70',
      temperature: '15',
      ph: '7',
      moisture: '10',
      cO2Level: '32',
    ),
    SoilCondition(
      humidity: '50',
      temperature: '5',
      ph: '7',
      moisture: '35',
      cO2Level: '20',
    ),
    SoilCondition(
      humidity: '60',
      temperature: '23',
      ph: '6.5',
      moisture: '35',
      cO2Level: '400',
    ),
    SoilCondition(
      humidity: '45',
      temperature: '5',
      ph: '5.5',
      moisture: '80',
      cO2Level: '416',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: <Widget>[
              SliverAppBar(
                stretch: true,
                onStretchTrigger: () {
                  // Function callback for stretch
                  return Future<void>.value();
                },
                expandedHeight: 300.0,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const <StretchMode>[
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  centerTitle: true,
                  title: const Text('Monitoring status'),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'assets/plant5.jpg',
                        fit: BoxFit.cover,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, 0.5),
                            end: Alignment.center,
                            colors: <Color>[
                              Color(0x60000000), //Colors.black45,
                              Color(0x00000000),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      height: 400,
                      child: ListView.builder(
                        itemCount: soilConditionsList.length,
                        itemBuilder: (context, index) {
                          final soilCondition =
                              soilConditionsList.elementAt(index);

                          return ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text('Soil Condition'),
                            subtitle: Text(
                                'sunny, h: ${soilCondition.humidity}, t: ${soilCondition.temperature}, m: ${soilCondition.moisture}, pH:  ${soilCondition.ph}, CO2:  ${soilCondition.cO2Level}'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
