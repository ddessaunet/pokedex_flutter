import 'package:flutter_web/material.dart';
import 'package:pokedex_flutter/core/model/pokemon.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  DetailsPage({this.pokemon});

  getChildrens({
    List<String> list,
    Color backgroundColor,
    Color textStyleColor = Colors.black
  }) {
    if (list.length == 0) {
      return <Widget>[].toList();
    }
    return list.map((t) => FilterChip(
      backgroundColor: backgroundColor,
      label: Text(t, style: TextStyle(color: textStyleColor)),
      onSelected: (b) {},)).toList();
  }

  getTypes() {
    if (this.pokemon.type.length == 0) return [];
    return [
      Text('Types', style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this.getChildrens(
            list: this.pokemon.type,
            backgroundColor: Colors.amber
        ),
      ),
    ];
  }

  getWeakness() {
    if (this.pokemon.weaknesses.length == 0) return [];
    return [
      Text('Weakness', style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this.getChildrens(
            list: this.pokemon.weaknesses,
            backgroundColor: Colors.red,
            textStyleColor: Colors.white
        ),
      ),
    ];
  }

  getNextEvolutions() {
    if (this.pokemon.nextEvolution.length == 0) return [];
    return [
      Text('Next Evolution', style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this.getChildrens(
            list: this.pokemon.nextEvolution.map((e) => e.name).toList(),
            backgroundColor: Colors.green,
            textStyleColor: Colors.white
        ),
      )
    ];
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
              ...this.getTypes(),
              ...this.getWeakness(),
              ...this.getNextEvolutions()
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