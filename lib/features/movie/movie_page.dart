import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var searchController = TextEditingController();

  List<Map<String, dynamic>> movieResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Movie Titles',
                hintText: 'Enter your movie title....',
                suffixIcon: InkWell(
                  onTap: () {
                    searchMovieTitles();
                  },
                  child: Icon(Icons.search),
                ),
              ),
            ),
            Text('Found ${movieResults.length} results...'),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 48,
                  crossAxisSpacing: 16,
                ),
                itemCount: movieResults.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = movieResults[index];
                  final poster = movie['Poster'];
                  return Column(
                    children: [
                      Text(
                        movie['Title'],
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      if (poster != 'N/A')
                        Expanded(
                          child: Image.network(
                            poster,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        )
                      else
                        Text('No poster.........'),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> searchMovieTitles() async {
    var request = Request(
      'GET',
      Uri.parse('http://www.omdbapi.com/?s=${searchController.text}&apikey=30a0f0d1'),
    );
    StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final resultsJson = await response.stream.bytesToString();
      print(resultsJson);
      final json = jsonDecode(resultsJson);
      print(json['Search']);
      setState(() {
        movieResults = List<Map<String, dynamic>>.from(json['Search']);
      });
    }
  }
}
