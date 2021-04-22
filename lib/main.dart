import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}

// 一覧画面
class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Items? _searchResults = Items();

  void _search(String searchWord) async {
    Items? result = Items();
    try {
      result = await searchYoutube(searchWord);
      if (result!.items != null) {
        result.items = result.items!.whereType<Item>().toList();
      }
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      _searchResults = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _search('ニュース');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("一覧画面"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onSubmitted: (String? searchWord) {
                _search(searchWord != null ? searchWord : '');
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _searchResults!.items!.map((item) {
                return VideoListItem(
                  item: item,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// 再生画面
class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// 一覧表示アイテム
class VideoListItem extends StatelessWidget {
  late final Item item;

  VideoListItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(item.snippet!.thumbnails!.defaultThumbnail!.url!),
          Text(
            item.snippet!.title!,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(item.snippet!.channelTitle!),
        ],
      ),
    );
  }
}

// Youtube検索API実行
Future<Items?>? searchYoutube(String word) async {
  final param = {
    'part': 'snippet',
    'type': 'video',
    'q': word,
    'key': 'api_key', // 自分のAPIキーを使用
  };
  final uri = Uri.https('www.googleapis.com', 'youtube/v3/search', param);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    Items items = Items.fromJson(decodedJson);
    print(items);

    return items;
  } else {
    return null;
  }
}
