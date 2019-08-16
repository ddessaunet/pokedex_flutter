import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex_flutter/core/model/poke_hub.dart';
import 'package:pokedex_flutter/views/details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  PokeHub pokeHub = new PokeHub(pokemon: []);

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  fetchData() async {
    var result = await http.get(url);
    var decodedJson = jsonDecode(result.body);
    setState(() => this.pokeHub = PokeHub.fromJson(decodedJson));
  }

  gridWidget() {
    return GridView.count(
      crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(pokemon: poke)
                )
              );
            },
            child: Card(
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(poke.img)
                        )
                    ),
                  ),
                  Text(
                    poke.name,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
      )).toList()
    );
  }

  bodyWidget() {
    return pokeHub.pokemon.length == 0 ?
      Center(child: CircularProgressIndicator()) :
      this.gridWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: this.bodyWidget(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Refresh'),
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}