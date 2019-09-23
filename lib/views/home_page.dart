import 'package:flutter/material.dart';

import 'package:pokedex_flutter/core/model/poke_hub.dart';
import 'package:pokedex_flutter/core/resources/pokemon_service.dart';
import 'package:pokedex_flutter/views/details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeHub pokeHub = new PokeHub(pokemon: []);
  PokemonService pokemonService = new PokemonService();

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  fetchData() async {
    var pokemons = await pokemonService.getPokemons();
    setState(() => this.pokeHub = PokeHub.fromJson(pokemons));
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
          child: Hero(
            tag: poke.img,
            child: Card(
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
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
        ),
      )).toList()
    );
  }

  bodyWidget() {
    return pokeHub.pokemon.length == 0 ?
      Center(child: CircularProgressIndicator()) :
      this.gridWidget();
  }

  refresh() {
    setState(() { pokeHub.pokemon.clear(); });
    setState(() { this.fetchData(); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: this.bodyWidget(),
      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Darío Dessaunet"),
                accountEmail: Text("dario.dessaunet@globant.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.blue
                      : Colors.white,
                  child: Text(
                    "D",
                    style: TextStyle(fontSize: 40.0),
                  ),
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => this.refresh(),
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}