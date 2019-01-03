import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {  
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ]
      ),
      body: _buildSuggetions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    // final bool alreadySaved = _saved.contains(pair);
    return Wrap( // Row(
      spacing: 20,
      runSpacing: 10,
      alignment: WrapAlignment.start,
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
            child: Text("AB")
            ),
          label: Text("123456789012345")
          ),
        Chip(
          avatar: CircleAvatar(
            child: Text("AB")
            ),
          label: Text("123456789012345")
          ),
        Chip(
          avatar: CircleAvatar(
            child: Text("AB")
            ),
          label: Text("123456789012345")
          ),
        ]
      );    
    // return Row(
    //   children: <Widget>[
    //     Expanded(
    //       flex: 1,
    //       child: FittedBox(
    //         child: const FlutterLogo()
    //         )
    //       ),
    //     Expanded(
    //       flex: 2,
    //       child: FittedBox(
    //         child: const FlutterLogo()
    //         )
    //       ),
    //     Expanded(
    //       flex: 3,
    //       child: FittedBox(
    //         child: const FlutterLogo()
    //         )
    //       )
    //     ]
    //   );
    // return ListTile(
    //   leading: Text("leading"),
    //   title: Text(
    //     pair.asPascalCase,
    //     style: _biggerFont,
    //   ),
    //   subtitle: Text("subtitle"),
    //   trailing: new Icon(
    //     alreadySaved ? Icons.favorite : Icons.favorite_border,
    //     color: alreadySaved ? Colors.red : null,
    //   ),
    //   isThreeLine: false,
    //   dense: false,
    //   enabled: true,
    //   onTap: () {
    //     setState(() {
    //       if (alreadySaved) {
    //         _saved.remove(pair);
    //       } else {
    //         _saved.add(pair);
    //       }
    //     });
    //   },
    // );
  }

  Widget _buildSuggetions() {
    return SafeArea(
      left: true,
      top: true,
      right: true,
      bottom: true,
      minimum: EdgeInsets.zero,
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        }),      
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute (
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles
          )
          .toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }
      )
    );
  }
}