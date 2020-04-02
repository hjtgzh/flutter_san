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
//             new Icon(Icons.star, color: Colors.red[500]),
//             new Text('41')
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
//     // return new Container(
//     //   decoration: new BoxDecoration(color: Colors.white),
//     //   child: new Center(
//     //       child: new Text('Hello jinting',
//     //           textDirection: TextDirection.ltr,
//     //           style: new TextStyle(fontSize: 40.0, color: Colors.black87))),
//     // );
//   }
// }

/* 左右布局 */
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* start */
    Widget starts = new Row(
      children: <Widget>[
        new Expanded(
            child: new Row(
          children: <Widget>[
            new Icon(
              Icons.star,
              size: 18,
              color: Colors.red,
            ),
            new Icon(Icons.star, size: 18, color: Colors.red),
            new Icon(Icons.star, size: 18, color: Colors.red),
            new Icon(Icons.star, size: 18, color: Colors.red),
            new Icon(Icons.star, size: 18, color: Colors.red),
          ],
        )),
        new Text('170')
      ],
    );

    /* icon */
    Widget iconList =
        new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      new Column(
        children: <Widget>[
          new Icon(
            Icons.book,
            color: Colors.green,
          ),
          new Text('prep'),
          new Text('25min'),
        ],
      ),
      new Column(
        children: <Widget>[
          new Icon(
            Icons.collections_bookmark,
            color: Colors.green,
          ),
          new Text('cook'),
          new Text('1hr'),
        ],
      ),
      new Column(
        children: <Widget>[
          new Icon(
            Icons.ac_unit,
            color: Colors.green,
          ),
          new Text('feeds'),
          new Text('4-6'),
        ],
      )
    ]);

    Widget leftColumd = new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(children: [
          new Text(
            'Strawberry Pavlova',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          new Text(
            'Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova.',
            softWrap: true,
          ),
          starts,
          iconList
        ]));

    Widget mainImage = new Expanded(
        flex: 3,
        child: new Image.asset('images/berries.jpg',
            height: 200, fit: BoxFit.cover));

    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('自定义布局'),
            ),
            body: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(flex: 2, child: leftColumd),
                mainImage,
              ],
            )));
  }
}
