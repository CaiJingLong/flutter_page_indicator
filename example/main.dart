import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        color: Colors.pink,
        child: Container(
          height: 120.0,
          child: PageIndicatorContainer(
            pageView: PageView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('1'),
                    RaisedButton.icon(
                      icon: Icon(Icons.publish),
                      label: Text("next page"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MyHomePage(
                                title: 'next page $counter',
                              );
                            },
                          ),
                        );
                      },
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.refresh),
                      label: Text(counter.toString()),
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
                  ],
                ),
                Text('2'),
                Text('3'),
                Text('4'),
              ],
              controller: controller,
            ),
            align: IndicatorAlign.bottom,
            length: 4,
            indicatorSpace: 10.0,
          ),
        ),
      ),
    );
  }
}
