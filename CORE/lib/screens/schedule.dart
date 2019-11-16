import 'package:flutter/material.dart';
import 'package:core/screens/rankings.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('CORE'),
          backgroundColor: new Color(0xFF002A72),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Rankings();
                }));
              })),
      body: WeekView(),
    );
  }
}

const headerHeight = 110.0;
const hourHeight = 100.0;

class WeekView extends StatelessWidget {

  List<String> hours = [
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00"
  ];

  List<String> days = [
    "Nov 15th",
    "Nov 16th",
    "Nov 17th",
  ];


  Widget getDays(int i) {
    return Container(
      child: Center(
          child: Text(
              days[i],
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              )
          )
      ),
    );
  }

  Widget getWhiteCell() {
    return Container(
      padding: const EdgeInsets.all(8),
    );
  }

  Widget getGreyCell() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[100],
    );
  }

  Widget getGreenCell() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.green[100],
    );
  }

  Widget getHours(int i) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              hours[i],
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 4,
            children: <Widget>[
              getWhiteCell(),
              getDays(0),
              getDays(1),
              getDays(2),
              getHours(0),
              getGreyCell(),
              getGreenCell(),
              getGreyCell(),
              getHours(1),
              getGreenCell(),
              getGreenCell(),
              getGreyCell(),
              getHours(2),
              getGreenCell(),
              getGreyCell(),
              getGreyCell(),
              getHours(3),
              getGreyCell(),
              getGreyCell(),
              getGreyCell(),
              getHours(4),
              getGreyCell(),
              getGreyCell(),
              getGreenCell(),
              getHours(5),
              getGreyCell(),
              getGreyCell(),
              getGreenCell(),
              getHours(6),
              getGreyCell(),
              getGreyCell(),
              getGreyCell(),
              getHours(7),
              getGreyCell(),
              getGreyCell(),
              getGreyCell(),
              getHours(8),
              getGreyCell(),
              getGreyCell(),
              getGreyCell(),
              getHours(9),
              getGreyCell(),
              getGreyCell(),
              getGreyCell(),
              getHours(10),
              getGreyCell(),
              getGreyCell(),
              getGreyCell(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildHoursColumn(int d) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
      child: Text(
        hours[d],
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }


  Widget buildFirstDay(int d) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
      child: Text(
        hours[d],
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget buildSecondDay(int d) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
      child: Text(
        hours[d],
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget buildThirdDay(int d) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
      child: Text(
        hours[d],
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

}

class WeekViewHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFF002A72).withOpacity(0.5),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'MY SCHEDULE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Nov 12th",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Nov 13th",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Nov 14th",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => headerHeight;

  @override
  double get minExtent => headerHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}