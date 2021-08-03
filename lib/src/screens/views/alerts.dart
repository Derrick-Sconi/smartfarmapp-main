import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  get dismissKey => null;

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
              title: const Text('Message Alerts'),
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
                Column(
                  key: dismissKey,
                  children: <Widget>[
                    //i want to use a dismissal widget so if i swipe it dismisses the messages

                    Dismissible(
                      key: dismissKey,
                      child: ListTile(
                        leading: Icon(Icons.message),
                        title: Text(
                            'Soil water level is low kindly on your irrigation source'),
                        subtitle: Text('sunny, h: 30, t: 75, m: 20, pH: 7.5'),
                      ),
                      confirmDismiss: confirmDismiss(),
                      onDismissed: onDismiss(),
                    ),
                    Dismissible(
                      key: dismissKey,
                      child: ListTile(
                        leading: Icon(Icons.message),
                        title:
                            Text('Soil humidity is high kindly regulate farm'),
                        subtitle: Text('rainy, h: 70, t: 35, m: 80, pH: 7.5'),
                      ),
                      confirmDismiss: confirmDismiss(),
                      onDismissed: onDismiss(),
                    ),
                    Dismissible(
                        key: dismissKey,
                        child: ListTile(
                          leading: Icon(Icons.message),
                          title: Text(
                              'Soil moisture level is low kindly on your irrigation source'),
                          subtitle: Text('dry, h: 20, t: 95, m: 25, pH: 7.5'),
                        ),
                        confirmDismiss: confirmDismiss(),
                        onDismissed: onDismiss()),
                    Dismissible(
                      key: dismissKey,
                      child: ListTile(
                        leading: Icon(Icons.message),
                        title: Text(
                            'Soil CO2 level is high kindly chcek your farm for iminent Fire outbreak'),
                        subtitle: Text('wet, h: 80, t: 15, m: 75, pH: 7.5'),
                      ),
                    ),
                    Dismissible(
                      key: dismissKey,
                      child: ListTile(
                        leading: Icon(Icons.message),
                        title: Text(
                            'Soil pH level is high kindly check your irrigation source, might be contaminated'),
                        subtitle: Text('wet, h: 80, t: 15, m: 75, pH: 7.5'),
                      ),
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

  void get onDismissed => onDismissed;

  confirmDismiss() {}

  onDismiss() {}
}
