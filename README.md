# page_indicator

## preview

![image](https://raw.githubusercontent.com/CaiJingLong/some_asset/master/page_indicator1.gif)

## install

[see](#-installing-tab-)

1. Depend on it
   Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  page_indicator: ^0.1.3
```

2. Install it

You can install packages from the command line:

with Flutter:

`flutter packages get`

Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

3. Import it
   Now in your Dart code, you can use:

`import 'package:page_view_indicator/page_view_indicator.dart';`

## use

[see](#-example-tab-)

```dart
PageIndicatorContainer(
    pageView: PageView(
        children: <Widget>[
        Column(
        Text('1'),
        Text('2'),
        Text('3'),
        Text('4'),
        ],
        controller: controller,
    ),
    align: IndicatorAlign.bottom, // your indicator align with container
    length: 4, // indicator count
    indicatorColor: Colors.white, // unselected indicator color
    indicatorSelectorColor: Colors.grey, // selected indicator color
    padding: EdgeInsets.only(bottom: 10.0), // padding with bottom .when align top you should use properties `top:10.0`
    size: 15.0, // indicator size.
    indicatorSpace: 10.0, // space between circles
    )
```
