import 'dart:async';

import 'package:flutter/material.dart';
import 'package:core/screens/Initial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_maps_clusters/helpers/map_marker.dart';


class Info extends StatefulWidget {
  @override
  _Info createState() => new _Info();
}

class _Info extends State<Info> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  void choiceAction(String choice){
    if(choice == Menu.SignOut){
      print('SignOut');
    }
  }

  Completer<GoogleMapController> mapController = Completer();
  static final CameraPosition _myLocation =
  CameraPosition(
    target: LatLng(41.178775,  -8.596223),
    zoom: 16,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('CORE'),
          backgroundColor: new Color(0xFF002A72),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return Menu.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
      body:  new ListView(
            children: <Widget>[
              new Container(
                height: 50,
                color: Color(0xFF002A72),
                child: new TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  controller: _controller,
                  tabs: [
                    new Tab(
                      icon: const Icon(Icons.info),
                    ),
                    new Tab(
                      icon: const Icon(Icons.location_on),
                    ),
                  ],
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 1.3,
                margin: EdgeInsets.only(left: 10, right:10),
                child: new TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    new Card(
                      child: Container(
                          child:  Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: new RichText(
                                  text: TextSpan(
                                  text: 'The International Conference on the Art, Science, and Engineering of Programming is a new conference focused on programming topics including the experience of programming. We have named it ‹Programming› for short. \n\nAfter Brussels, Nice, and Genova, this fourth edition will take place in Porto, Portugal, Mon 23 - Thu 26 March, 2020, a charming city that will embrace you as soon as you arrive! ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        decorationStyle: TextDecorationStyle.wavy,
                                        fontSize: 20
                                    ),
                                  ),
                              )
                          )
                      )
                    ),
                    new Card(
                      child: Container(
                        child: GoogleMap(
                          // 2
                          initialCameraPosition: _myLocation,
                          // 3
                          mapType: MapType.normal,
                          // 4
                          onMapCreated: (GoogleMapController controller) {
                            mapController.complete(controller);
                          },
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
      );
  }
}
