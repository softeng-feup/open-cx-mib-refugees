import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:core/screens/schedule.dart';

class Rankings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rankings();
  }
}

class _Rankings extends State<Rankings> {

  final database = FirebaseDatabase.instance.reference().child("Program");
  List allLectures= new List();

  void getData() async {
    List allLec= new List();
    database.once().then((snap) {
      Map<dynamic,dynamic> map = snap.value;
      map.forEach((key, value) {
        var lecture=snap.value[key];
        allLec.add(lecture);
        debugPrint(lecture['title']);
      });
    });
    allLectures=allLec;
  }

  List allItems = [
    {
      'name': 'Talk 1',
      'title': 'SmaCC',
      'speaker': 'Jason Lecerf',
      'abstract': 'SmaCC (Smalltalk Compiler-Compiler) is a freely available parser generator for Smalltalk. It generates LR parsers and is a replacement for the T-Gen parser generator. SmaCC overcomes many of T-Gen’s limitations that make it difficult to produce parsers. SmaCC can generate parsers for ambiguous grammars and grammars with overlapping tokens. ',
      'date': '17/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:15',
      'rank': '97%',
      'selected': false
    },
    {
      'name': 'Talk 2',
      'title': 'PetitParser',
      'speaker': 'Andrei Chiş',
      'abstract': 'PetitParser combines ideas from scannerless parsing, parser combinators, parsing expression grammars and packrat parsers to model grammars and parsers as objects that can be reconfigured dynamically. ',
      'date': '17/11/2019',
      'start_hour': '12:15',
      'end_hour': '14:30',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 3',
      'title': 'Language Engineering with Rascal',
      'speaker': 'Tijs van der Storm',
      'abstract': 'Software Language Engineering (SLE) is concerned with the principled techniques and concepts for the construction of software languages. In this tutorial we will explore how the Rascal metaprogramming environment and language workbench addresses aspects of implementing software languages. We will work on a simple DSL for defining questionnaires, called QL, touching upon syntax definition, static analysis, transformation, language extension, and code generation. ',
      'date': '17/11/2019',
      'start_hour': '16:30',
      'end_hour': '18:00',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 4',
      'title': 'Orchestrated Crowdsourced Testing of a Mobile Web Application',
      'speaker': 'Maurizio Leotta',
      'abstract': 'Responsive mobile web applications are quite challenging to test, especially if they require heavy interaction with the environment (e.g., through GPS-based location tracking and camera-based QR code acquisition and recognition) and among different users, as in the case of collaborative games support, where the app needs to support the real-time interaction of a large number of users. In this paper, we propose a case study of orchestrated crowdsourced testing of such a mobile web app, as an approach to face such challenges. ',
      'date': '18/11/2019',
      'start_hour': '08:30',
      'end_hour': '09:00',
      'rank': '86%',
      'selected': false
    },
    {
      'name': 'Talk 5',
      'title': 'A framework for big-step semantics',
      'speaker': 'Francesco Dagnino',
      'abstract': 'No abstract. ',
      'date': '18/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:00',
      'rank': '86%',
      'rank': '85%',
      'selected': false
    },
    {
      'name': 'Talk 6',
      'title': 'Quickref: Auto-Documenting the Common Lisp Ecosystem',
      'speaker': 'Didier Verna',
      'abstract': 'This demonstration is intended for people interested in software documentation, and more specifically, in what can be achieved with a reflexive language, fully equipped for introspection. Quickref is a global documentation project for the Common Lisp Ecosystem. In a single function call, it builds an entire website containing reference manuals for almost two thousand Common Lisp libraries. The system is unintrusive: library authors do not have anything to do to make their code “Quickref aware”. A public website is maintained with the resulting full documentation, but individuals can also use Quickref to generate a local website, documenting only what is present on their machine. ',
      'date': '18/11/2019',
      'start_hour': '14:00',
      'end_hour': '17:15',
      'rank': '81%',
      'selected': false
    },
    {
      'name': 'Talk 7',
      'title': 'Proving Inequational Propositions about Haskell Programs in Coq',
      'speaker': 'Jan Christiansen and Sandra Dylus',
      'abstract': 'To prove properties about a Haskell function in Coq, we have to translate the Haskell function to Coq. Proofs about Haskell func- tions are performed in various levels of detail. For example, some- times proofs are performed as if Haskell were a total language and sometimes we are interested in explicitly reasoning about effects like partiality, exceptions or tracing. By translating a Haskell func- tion into a Coq function that is parametrised over a monad, we can model all these cases. ',
      'date': '18/11/2019',
      'start_hour': '10:00',
      'end_hour': '10:30',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 8',
      'title': 'Lazy, Parallel Multiple Value Reductions in Common Lisp',
      'speaker': 'Marco Heisig',
      'abstract': 'No abstract. ',
      'date': '19/11/2019',
      'start_hour': '14:00',
      'end_hour': '15:45',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 9',
      'title': 'Efficient Implementation of Smalltalk Activation Records in Language Implementation Frameworks',
      'speaker': 'Fabio Niephaus',
      'abstract': 'Language implementation frameworks such as RPython or Truffle help to build runtimes for dynamic languages. For this, they make certain design decisions and trade-offs upfront to make common language concepts easy to implement. Because of this, however, some language-specific concepts may be rather tedious to support, especially the modification of activation records. For example, Smalltalk provides reification of activations through context objects. Since they are used to implement other mechanisms such as exception handling on the language level, contexts need to be entirely supported by the underlying runtime. ',
      'date': '19/11/2019',
      'start_hour': '17:15',
      'end_hour': '18:00',
      'rank': '70%',
      'selected': false
    }
  ];

  void _showDialog(String title, String speaker, String date, String start, String end, String abstract) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Speaker: " + speaker),
              Text(""),
              Text("Date: " + date),
              Text(""),
              Text("Hour: " + start + "-" + end),
              Text(""),
              new Expanded(
                  child: new SingleChildScrollView(
                    child: new Text(abstract, style: TextStyle(fontWeight: FontWeight.w300),),
                  )),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget getCards(item) {
    var sel = false;

    return Padding(
      padding: EdgeInsets.only(top: 20, right: 30, left: 30),
      child: InkWell(
        onTap: () {
          _showDialog(item['title'], item['speaker'], item['date'], item['start_hour'], item['end_hour'], item['abstract']);
        },
        child: Container(
          child: Card(
              child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          item['title'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Checkbox(
                        value: item['selected'],
                        onChanged: (bool value) {
                          setState(() {
                            item['selected'] = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(item['speaker']),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.favorite),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(item['rank']),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
        ),
      ),
    );
  }

  Widget getRanking() {
    getData();
    return Container(
      child: ListView(
        children: allItems.map((element) {
          return getCards(element);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('CORE'),
            backgroundColor: new Color(0xFF002A72),),
        body: Center(child: getRanking()),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 100, right: 100, bottom: 20),
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: () {
                    List<int> items = [];
                    for(var i=0; i<allItems.length; i++) {
                      if(allItems[i]['selected'] == true) {
                        items.add(i);
                      }
                    }
                    debugPrint("Talks selected: " + items.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Schedule(items: items);
                    }));
                  },
                  child: Text("Done", style: TextStyle(color: Colors.white)),
                  color: new Color(0xFF002A72),
                  elevation: 5,
                ))));
  }
}