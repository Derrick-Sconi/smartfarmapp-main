import 'package:flutter/material.dart';

class PlantInfo extends StatefulWidget {
  @override
  _PlantInfoState createState() => _PlantInfoState();
}

class _PlantInfoState extends State<PlantInfo> {
  late int temp;
  late int pH;
  late int cotwo;
  late int moist;
  late int humid;
  bool isCompare = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              title: const Text('Crop Recommendations'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'assets/plant6.jpg',
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
                Column(
                  children: const <Widget>[
                     ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text('Tomato'),
                      subtitle: Text(
                          'sunny, h: 80, t: 10-30, m: 4000-6000mm3/ha, pH: 6.0-6.5, CO2: 400ppm'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Lettuce'),
                      subtitle: Text(
                          'rainy, h: 70, t: 10-20, m: 370-600mm, pH: 5.5-6.5, CO2: 400ppm'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny_sharp),
                      title: Text('Maize'),
                      subtitle: Text(
                          'dry, h: 70, t: 10-32, m: 4000-6000m3/ha, pH: 6.0-6.5, CO2: 400ppm'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Eggplant'),
                      subtitle: Text(
                          'wet, h: 80, t: 10-30, m: 350-550mm, pH: 6.0-7.5, CO2: 400ppm'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Banana'),
                      subtitle: Text(
                          'wet, h: 90, t: 23-30, m: <10000m3/ha, pH: 5.5-6.5, CO2: 400ppm'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Onion'),
                      subtitle: Text(
                          'wet, h: 90, t: 15-25, m: 350-550, pH: 6-7, CO2: 400ppm'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Cucumber'),
                      subtitle: Text(
                          'wet, h: 90, t: 19-28, m: 25-50mm, pH: 6.0-6.8, CO2: 400ppm'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Pepper'),
                      subtitle: Text(
                          'wet, h: 90, t: 13-40, m: 4000-6000m3/ha, pH: 6.5-7.5, CO2: 400ppm'),
                    ),

                    // ListTiles++
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
