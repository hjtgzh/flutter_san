/* 列表 */
// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         theme: new ThemeData(primaryColor: Colors.white),
//         // title: 'welcome to Flutter',
//         // home: new Scaffold(
//         //   appBar: new AppBar(title: new Text('Welcome to Flutter this is title')),
//         //   // body: new Center(child: new Text('Hello world')),
//         //   body: new Center(child: new RandomWords()),
//         // ),
//         title: 'Startup Name Generator',
//         home: new RandomWords());
//   }
// }

// /* 有状态的部件（Stateful widget） */
// class RandomWords extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new RandomWordsState();
//   }
// }

// class RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   final _saved = new Set<WordPair>();

//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);
//     return new ListTile(
//       title: new Text(pair.asPascalCase, style: _biggerFont),
//       trailing: new Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }

//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: (context, i) {
//           if (i.isOdd) return Divider();

//           final index = i ~/ 2;
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//       final tiles = _saved.map((pair) {
//         return new ListTile(
//             title: new Text(pair.asPascalCase, style: _biggerFont));
//       });
//       final divided =
//           ListTile.divideTiles(tiles: tiles, context: context).toList();
//       return new Scaffold(
//         appBar: new AppBar(title: new Text('Saved Suggestions')),
//         body: new ListView(children: divided),
//       );
//     }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final wordPair = new WordPair.random();
//     // return new Text(wordPair.asCamelCase);
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Startup Name Generator'),
//           actions: <Widget>[
//             new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
//           ],
//         ),
//         body: _buildSuggestions());
//   }
// }

/* 详情 */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class FavoriteWidget extends StatefulWidget {
//   @override
//   _FavoriteWidgetState createState() => new _FavoriteWidgetState();
// }

// class _FavoriteWidgetState extends State<FavoriteWidget> {
//   bool _isFavorited = true;
//   int _favoriteCount = 41;

//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorited) {
//         _favoriteCount -= 1;
//         _isFavorited = false;
//       } else {
//         _favoriteCount += 1;
//         _isFavorited = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         new Container(
//             padding: new EdgeInsets.all(0.0),
//             child: new IconButton(
//               icon: _isFavorited
//                   ? new Icon(Icons.star)
//                   : new Icon(Icons.star_border),
//               color: Colors.red[500],
//               onPressed: _toggleFavorite,
//             )),
//         new SizedBox(
//             width: 18.0,
//             child: new Container(
//               child: new Text('$_favoriteCount'),
//             ))
//       ],
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     @override
//     Widget titleSection = new Container(
//         padding: const EdgeInsets.all(32.0),
//         child: new Row(
//           children: <Widget>[
//             new Expanded(
//                 child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 new Container(
//                     padding: const EdgeInsets.all(8.0),
//                     child: new Text(
//                       'Oeschinen Lake Campground',
//                       style: new TextStyle(fontWeight: FontWeight.bold),
//                     )),
//                 new Text('Kandersteg, Switzerland',
//                     style: new TextStyle(color: Colors.grey[500]))
//               ],
//             )),
//             new FavoriteWidget()
//           ],
//         ));

//     Column buildButtonColumn(IconData icon, String label) {
//       Color color = Theme.of(context).primaryColor;
//       return new Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             new Icon(icon, color: color),
//             new Container(
//               margin: const EdgeInsets.only(top: 8.0),
//               child: new Text(label,
//                   style: new TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.w400,
//                       color: color)),
//             )
//           ]);
//     }

//     Widget buttonSection = new Container(
//         child: new Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//           buildButtonColumn(Icons.call, 'CALL'),
//           buildButtonColumn(Icons.near_me, 'ROUTE'),
//           buildButtonColumn(Icons.share, 'SHARE'),
//         ]));

//     Widget textSection = new Container(
//         padding: const EdgeInsets.all(32.0),
//         child: new Text(
//           '''
// Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
//           ''',
//           softWrap: true,
//         ));

//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(primarySwatch: Colors.blue),
//       home: new Scaffold(
//           appBar:
//               new AppBar(title: new Text('Welcome to Flutter this is title')),
//           body: new ListView(children: [
//             new Image.asset('images/lake.jpg',
//                 width: 600.0, height: 240.0, fit: BoxFit.cover),
//             titleSection,
//             buttonSection,
//             textSection
//           ])),
//     );
//   }
// }

/* 左右布局 */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     /* start */
//     Widget starts = new Row(
//       children: <Widget>[
//         new Expanded(
//             child: new Row(
//           children: <Widget>[
//             new Icon(
//               Icons.star,
//               size: 18,
//               color: Colors.red,
//             ),
//             new Icon(Icons.star, size: 18, color: Colors.red),
//             new Icon(Icons.star, size: 18, color: Colors.red),
//             new Icon(Icons.star, size: 18, color: Colors.red),
//             new Icon(Icons.star, size: 18, color: Colors.red),
//           ],
//         )),
//         new Text('170')
//       ],
//     );

//     /* icon */
//     Widget iconList =
//         new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       new Column(
//         children: <Widget>[
//           new Icon(
//             Icons.book,
//             color: Colors.green,
//           ),
//           new Text('prep'),
//           new Text('25min'),
//         ],
//       ),
//       new Column(
//         children: <Widget>[
//           new Icon(
//             Icons.collections_bookmark,
//             color: Colors.green,
//           ),
//           new Text('cook'),
//           new Text('1hr'),
//         ],
//       ),
//       new Column(
//         children: <Widget>[
//           new Icon(
//             Icons.ac_unit,
//             color: Colors.green,
//           ),
//           new Text('feeds'),
//           new Text('4-6'),
//         ],
//       )
//     ]);

//     Widget leftColumd = new Container(
//         height: 300,
//         padding: const EdgeInsets.all(10),
//         margin: const EdgeInsets.all(5),
//         decoration: new BoxDecoration(
//             border: new Border.all(width: 10, color: Colors.black38),
//             borderRadius: const BorderRadius.all(const Radius.circular(8.0))),
//         child: new Column(children: [
//           new Text(
//             'Strawberry Pavlova',
//             style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
//           ),
//           new Text(
//             'Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova.',
//             softWrap: true,
//           ),
//           starts,
//           iconList
//         ]));

//     Widget mainImage = new Expanded(
//         flex: 3,
//         child: new Image.asset('images/berries.jpg',
//             height: 200, fit: BoxFit.cover));

//     return new MaterialApp(
//         home: new Scaffold(
//             appBar: new AppBar(
//               title: new Text('自定义布局'),
//             ),
//             body: new Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 new Expanded(flex: 2, child: leftColumd),
//                 mainImage,
//               ],
//             )));
//   }
// }

/* grid布局 */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   List<Container> _gridTileList(int count) {
//     return new List<Container>.generate(
//         count,
//         (int index) =>
//             new Container(child: new Image.asset('images/lake.jpg')));
//   }

//   Widget grid() {
//     return new GridView.extent(
//       maxCrossAxisExtent: 150,
//       padding: const EdgeInsets.all(4.0),
//       mainAxisSpacing: 4.0,
//       crossAxisSpacing: 4.0,
//       children: _gridTileList(30),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         home: new Scaffold(
//       appBar: new AppBar(title: new Text('grid布局')),
//       body: grid(),
//     ));
//   }
// }

/* listView */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> list = <Widget>[
//       new ListTile(
//         title: new Text(
//           '测试1',
//           style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//         subtitle: new Text('85 w protal ave'),
//         leading: new Icon(Icons.theaters, color: Colors.blue[500]),
//       ),
//       new ListTile(
//         title: new Text(
//           '测试2',
//           style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//         subtitle: new Text('429 Castro St'),
//         leading: new Icon(
//           Icons.theaters,
//           color: Colors.blue[500],
//         ),
//       )
//     ];
//     return new MaterialApp(
//         home: new Scaffold(
//       appBar: new AppBar(
//         title: new Text('listView 列表'),
//       ),
//       body: new Center(child: new ListView(children: list)),
//     ));
//   }
// }

/* stack */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var stack = new Stack(alignment: const Alignment(0.6, 0.6), children: [
//       new CircleAvatar(
//         backgroundImage: new AssetImage('images/lake.jpg'),
//         radius: 100,
//       ),
//       new Container(
//         decoration: new BoxDecoration(color: Colors.black45),
//         child: new Text(
//           'Mia B',
//           style: new TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       )
//     ]);

//     return new MaterialApp(
//         home: new Scaffold(
//       appBar: new AppBar(
//         title: new Text('stack 页面'),
//       ),
//       body: new Center(child: stack),
//     ));
//   }
// }

/* card */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var card = new SizedBox(
//         height: 210,
//         child: new Column(
//           children: <Widget>[
//             new ListTile(
//               title: new Text('1625 Main Street',
//                   style: new TextStyle(fontWeight: FontWeight.w500)),
//               subtitle: new Text('My City, CA 99984'),
//               leading: new Icon(
//                 Icons.restaurant_menu,
//                 color: Colors.blue[500],
//               ),
//             ),
//             new Divider(),
//             new ListTile(
//               title: new Text('(408) 555-1212',
//                   style: new TextStyle(fontWeight: FontWeight.w500)),
//               leading: new Icon(
//                 Icons.contact_phone,
//                 color: Colors.blue[500],
//               ),
//             ),
//             new ListTile(
//               title: new Text('costa@example.com'),
//               leading: new Icon(
//                 Icons.contact_mail,
//                 color: Colors.blue[500],
//               ),
//             ),
//           ],
//         ));

//     return new MaterialApp(
//         home: new Scaffold(
//       appBar: new AppBar(
//         title: new Text('stack 页面'),
//       ),
//       body: new Center(child: card),
//     ));
//   }
// }

/* 状态管理 widget管理自己的状态 */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class TapboxA extends StatefulWidget {
//   @override
//   _TapboxAState createState() => new _TapboxAState();
// }

// class _TapboxAState extends State<TapboxA> {
//   bool _active = false;

//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new GestureDetector(
//         onTap: _handleTap,
//         child: new Container(
//           child: new Center(
//             child: new Text(_active ? 'Active' : 'Inactive',
//                 style: new TextStyle(fontSize: 32, color: Colors.white)),
//           ),
//           width: 200,
//           height: 200,
//           decoration: new BoxDecoration(
//               color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
//         ));
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Flutter Demo'),
//         ),
//         body: new Center(
//           child: new TapboxA(),
//         ),
//       ),
//     );
//   }
// }

/* 状态管理 父widget管理widget的state */
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class TapboxA extends StatelessWidget {
//   TapboxA({Key key, this.active: false, @required this.onChanged})
//       : super(key: key);

//   final bool active;
//   final ValueChanged<bool> onChanged;

//   void _handleTap() {
//     onChanged(!active);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new GestureDetector(
//         onTap: _handleTap,
//         child: new Container(
//           child: new Center(
//             child: new Text(active ? 'Active' : 'Inactive',
//                 style: new TextStyle(fontSize: 32, color: Colors.white)),
//           ),
//           width: 200,
//           height: 200,
//           decoration: new BoxDecoration(
//               color: active ? Colors.lightGreen[700] : Colors.grey[600]),
//         ));
//   }
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _active = false;

//   void _handleTapboxChanged(bool newValue) {
//     setState(() {
//       _active = newValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Flutter Demo'),
//         ),
//         body: new Center(
//           child: new TapboxA(active: _active, onChanged: _handleTapboxChanged),
//         ),
//       ),
//     );
//   }
// }

/* 状态管理 混合管理 */
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class TapboxA extends StatefulWidget {
  TapboxA({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTap: _handleTap,
        onTapCancel: _handleTapCancel,
        child: new Container(
          child: new Center(
            child: new Text(widget.active ? 'Active' : 'Inactive',
                style: new TextStyle(fontSize: 32, color: Colors.white)),
          ),
          width: 200,
          height: 200,
          decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? new Border.all(
                    color: Colors.teal[700],
                    width: 10.0,
                  )
                : null,
          ),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Demo'),
        ),
        body: new Center(
          child: new TapboxA(active: _active, onChanged: _handleTapboxChanged),
        ),
      ),
    );
  }
}
