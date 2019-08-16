import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/model/pokemon.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  DetailsPage({this.pokemon});

  getProps() {
    return

  }

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Text(
                this.pokemon.name,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text('Height: ${this.pokemon.height}'),
              Text('Weight: ${this.pokemon.weight}'),
              Text('Types', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: this.pokemon.type.map((t) => FilterChip(
                  backgroundColor: Colors.amber,
                  label: Text(t),
                  onSelected: (b) {},)).toList(),
              ),
              Text('Weakness', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: this.pokemon.weaknesses.map((w) => FilterChip(
                  backgroundColor: Colors.red,
                  label: Text(w, style: TextStyle(color: Colors.white)),
                  onSelected: (b) {},)).toList(),
              ),
              Text('Next Evolution', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: this.pokemon.nextEvolution.map((e) => FilterChip(
                  backgroundColor: Colors.green,
                  label: Text(e.name, style: TextStyle(color: Colors.white)),
                  onSelected: (b) {},)).toList(),
              )
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: this.pokemon.img,
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(this.pokemon.img)
              )
            ),
          ),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
      backgroundColor: Colors.cyan,
        title: Text(this.pokemon.name),
      ),
      body: this.bodyWidget(context)
    );
  }
}