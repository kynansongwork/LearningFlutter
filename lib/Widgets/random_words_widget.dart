import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:test_app/Widgets/stateless_widget.dart';

import 'stateful_widget.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold (
        appBar: AppBar(
          title: Text('Start the name generator'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.audiotrack)),
              Tab(icon: Icon(Icons.ac_unit)),
              Tab(icon: Icon(Icons.access_alarm)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildSuggestions(),
            StatefulAction(),
            StatelessAction()
          ],
        )
      ),
    ); 
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved suggestions'),
            ),
            body: ListView(children: divided),
          );
        }
      )
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  //Adding favourites interaction

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}