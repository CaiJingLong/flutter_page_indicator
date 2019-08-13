import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.pink,
        child: Container(
          height: 120.0,
          child: PageIndicatorContainer(
            key: key,
            child: PageView(
              children: <Widget>[
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
              ],
              controller: controller,
              reverse: true,
            ),
            align: IndicatorAlign.bottom,
            length: 4,
            indicatorSpace: 10.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        tooltip: "force refresh indicator",
        onPressed: () {
          key.currentState.forceRefreshState();
        },
      ),
    );
  }
}
