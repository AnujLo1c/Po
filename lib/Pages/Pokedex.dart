
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pikachu/Pages/PokedexPokemon.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

List? response;

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();

  static fetchData() async {
    // final dynamic  finalResponse;
    response = await PokeAPI.getObjectList<Pokemon>(1, 20);
    print("help");
  }
}
class _PokedexState extends State<Pokedex> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    // fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Pokedex",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
          ),
          const Gap(10),
          response != null
              ? Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: response?.elementAt(index).types.elementAt(0).type.name == "grass" ? Colors.green.shade300 : response?.elementAt(index).types.elementAt(0).type.name == "fire" ? Colors.red.shade400
                                : response?.elementAt(index).types.elementAt(0).type.name == "water" ? Colors.blue.shade400 : response?.elementAt(index).types.elementAt(0).type.name == "poison" ? Colors.deepPurple.shade400
                                : response?.elementAt(index).types.elementAt(0).type.name == "electric" ? Colors.amber : response?.elementAt(index).types.elementAt(0).type.name == "rock" ? Colors.grey
                                : response?.elementAt(index).types.elementAt(0).type.name == "ground" ? Colors.brown : response?.elementAt(index).types.elementAt(0).type.name == "psychic" ? Colors.indigo
                                : response?.elementAt(index).types.elementAt(0).type.name == "fighting" ? Colors.orange : response?.elementAt(index).types.elementAt(0).type.name == "bug" ? Colors.lightGreenAccent.shade700
                                : response?.elementAt(index).types.elementAt(0).type.name == "ghost" ? Colors.deepPurple : response?.elementAt(index).types.elementAt(0).type.name == "normal" ? Colors.black26 : Colors.pink,
                            child: Stack(children: [
                              Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: Image.asset(
                                    "assets/pokeball.png",
                                    height: 100,
                                  )),
                              Positioned(
                                  bottom: -5,
                                  right: -10,
                                  child: Image.network(
                                    "${response?.elementAt(index).sprites.frontDefault}",
                                    width: 100,
                                    height: 100,
                                  )),
                              Positioned(
                                top: 20,
                                left: 10,
                                child: Text(
                                  "${response?.elementAt(index).name.toString().toUpperCase()}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                top: 50,left: 10,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 72,
                                      height: 28,
                                      // color: Colors.greenAccent.shade200,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          "${response?.elementAt(index).types.elementAt(0).type.name}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              // backgroundColor: Colors.grey,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const Gap(10),
                                    response?.elementAt(index).types.length == 2
                                        ? Container(
                                            width: 72,
                                            height: 28,
                                            // color: Colors.greenAccent.shade200,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "${(response?.elementAt(index).types.elementAt(1).type.name)}",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        : const Gap(1),
                                  ],
                                ),
                              )

                              //         // TextButton(onPressed: (){
                              //         //   // debugPrint(response?.elementAt(0).toString());
                              //         //   print("${response?.elementAt(0).sprites.frontDefault
                              //         //   }");
                              //         // }
                              //         //     , child: Text("help"))

                            ])),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PokedexPokemon(heroTag: index, pokemonDetail: response?.elementAt(index),
                            color: response?.elementAt(index).types.elementAt(0).type.name == "grass" ? Colors.green.shade400 : response?.elementAt(index).types.elementAt(0).type.name == "fire" ? Colors.red.shade400
                                : response?.elementAt(index).types.elementAt(0).type.name == "water" ? Colors.blue.shade400 : response?.elementAt(index).types.elementAt(0).type.name == "poison" ? Colors.deepPurple.shade400
                                : response?.elementAt(index).types.elementAt(0).type.name == "electric" ? Colors.amber : response?.elementAt(index).types.elementAt(0).type.name == "rock" ? Colors.grey
                                : response?.elementAt(index).types.elementAt(0).type.name == "ground" ? Colors.brown : response?.elementAt(index).types.elementAt(0).type.name == "psychic" ? Colors.indigo
                                : response?.elementAt(index).types.elementAt(0).type.name == "fighting" ? Colors.orange : response?.elementAt(index).types.elementAt(0).type.name == "bug" ? Colors.lightGreenAccent.shade700
                                : response?.elementAt(index).types.elementAt(0).type.name == "ghost" ? Colors.deepPurple : response?.elementAt(index).types.elementAt(0).type.name == "normal" ? Colors.black26 : Colors.pink,
                          )));
                        },
                      );
                    },
                  ),
                )
              : const CircularProgressIndicator(
                  color: Colors.orange,
                ),
        ],
      ),
    );
  }
  // fetchData() async {
  //   // final dynamic  finalResponse;
  //   response = await PokeAPI.getObjectList<Pokemon>(1, 100);
  //   setState(() {});
  // }
}
