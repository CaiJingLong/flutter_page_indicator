# page_indicator

[![pub package](https://img.shields.io/pub/v/page_indicator.svg)](https://pub.dartlang.org/packages/page_indicator)

- [page_indicator](#pageindicator)
  - [Preview](#preview)
  - [Install](#install)
  - [Usage](#usage)
    - [Force refersh state](#force-refersh-state)
  - [Migration guide](#migration-guide)

## Preview

![image](https://raw.githubusercontent.com/CaiJingLong/some_asset/master/page_indicator1.gif)

![image](https://github.com/kikt-blog/image/raw/master/img/Kapture%202019-04-17%20at%2020.51.49.gif)

## Install

[see](#-installing-tab-)

1. Depend on it
   Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  page_indicator: ^0.3.0
```

2. Install it

You can install packages from the command line:

with Flutter:

`flutter packages get`

Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

3. Import it
   Now in your Dart code, you can use:

```dart
import 'package:page_indicator/page_indicator.dart';
```

## Usage

[see example file](https://github.com/CaiJingLong/flutter_page_indicator/blob/master/example/main.dart)

or

```dart
PageIndicatorContainer(
  pageView: PageView(
    children: <Widget>[
      Text("1"),
      Text('2'),
      Text('3'),
      Text('4'),
    ],
    controller: controller,
  ),
  align: IndicatorAlign.bottom,
  length: 4,
  indicatorSpace: 20.0,
  padding: const EdgeInsets.all(10),
  indicatorColor: Colors.white,
  indicatorSelectorColor: Colors.blue,
  shape: IndicatorShape.circle(size: 12),
  // shape: IndicatorShape.roundRectangleShape(size: Size.square(12),cornerSize: Size.square(3)),
  // shape: IndicatorShape.oval(size: Size(12, 8)),
}
```

### Force refersh state

```dart
final key = GlobalKey<PageContainerState>();
PageIndicatorContainer(
  key: key,
  // other ...
);

// force refersh
key.currentState.forceRefreshState();
```

## Migration guide

0.1.x => 0.2.x

```dart
PageIndicatorContainer(
  ...
--  size: 12.0,
++  shape: IndicatorShape.circle(size: 12),
)
```
