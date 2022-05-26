import 'package:flutter/material.dart';
import 'package:flutter_newsapp/screen/newspage.dart';
import 'package:flutter_newsapp/service/service.dart';
import 'package:flutter_newsapp/model/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.black, shape: BoxShape.circle,
          ),
          width: 10,
          margin: EdgeInsets.all(8),
        ),
        title: Text('Good Morning', style: TextStyle(fontSize: 20, color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark, color: Colors.blue,))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) => snapshot.data != null
        ? NewsPage(article: snapshot.data as List<Article>)
        : const Center(child: CircularProgressIndicator(),),
        
      ),
    );
  }
}