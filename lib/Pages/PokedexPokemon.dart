import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PokedexPokemon extends StatefulWidget {
  final heroTag;
  final pokemonDetail;
  final color;
  const PokedexPokemon(
      {super.key, this.heroTag, this.pokemonDetail, this.color});
  @override
  State<PokedexPokemon> createState() => _PokedexPokemonState();
}

class _PokedexPokemonState extends State<PokedexPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.color,
        appBar: AppBar(
          actions: [const Icon(Icons.heart_broken)],
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                child: Container(
                  // color: Colors.white,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                )),
            Positioned(
                top: (MediaQuery.of(context).size.height / 4) - 75,
                right: 0,
                child: Image.asset(
                  "assets/pokeball.png",
                  height: 150,
                )),
            Positioned(
              top: (MediaQuery.of(context).size.height / 4) - 100,
              left: (MediaQuery.of(context).size.width / 4),
              height: 200,
              child: CachedNetworkImage(
                imageUrl: '${widget.pokemonDetail?.sprites.frontDefault}',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                top: 5,
                left: 30,
                child: Text(
                  capitalizefirst(widget.pokemonDetail?.name),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Positioned(
                top: 70,
                left: 40,
                child: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade600),
                  child: Center(
                      child: Text(
                    capitalizefirst(
                        widget.pokemonDetail?.types.elementAt(0).type.name),
                    style: const TextStyle(color: Colors.white),
                  )),
                )),
            Positioned(
                top: 70,
                left: 115,
                child: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade600),
                  child: Center(
                      child: Text(
                    capitalizefirst(
                        widget.pokemonDetail?.types.elementAt(0).type.name),
                    style: const TextStyle(color: Colors.white),
                  )),
                )),
            Positioned(
                top: 320,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Stats",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    const Gap(40),
                    Row(
                      children: [
                        const Gap(5),
                        const Text(
                          "HP",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Gap(70),
                        Text(
                            "${widget.pokemonDetail.stats.elementAt(0).baseStat}"),
                       const Gap(20),
                       SizedBox(width: 160,
                         child: LinearProgressIndicator(
                           color: Colors.greenAccent,
                           backgroundColor: Colors.grey.shade300,
                           borderRadius: BorderRadius.circular(20),
                           minHeight: 5,
                           value: widget.pokemonDetail.stats.elementAt(0).baseStat/360,

                         ),
                       )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Gap(5),
                        const Text(
                          "Attack",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Gap(46),
                        Text(
                            "${widget.pokemonDetail.stats.elementAt(1).baseStat}"),
                        const Gap(20),
                        SizedBox(width: 160,
                          child: LinearProgressIndicator(
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                            minHeight: 5,
                            value: widget.pokemonDetail.stats.elementAt(0).baseStat/360,

                          ),
                        )

                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Gap(5),
                        const Text(
                          "Defence",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Gap(33),
                        Text(
                            "${widget.pokemonDetail.stats.elementAt(2).baseStat}"),
                        const Gap(20),
                        SizedBox(width: 160,
                          child: LinearProgressIndicator(
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                            minHeight: 5,
                            value: widget.pokemonDetail.stats.elementAt(0).baseStat/360,

                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Gap(5),
                        const Text(
                          "S-Attack",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Gap(33),
                        Text(
                            "${widget.pokemonDetail.stats.elementAt(3).baseStat}"),
                        const Gap(20),
                        SizedBox(width: 160,
                          child: LinearProgressIndicator(
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                            minHeight: 5,
                            value: widget.pokemonDetail.stats.elementAt(0).baseStat/360,

                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Gap(5),
                        const Text(
                          "S-Defence",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Gap(20),
                        Text(
                            "${widget.pokemonDetail.stats.elementAt(4).baseStat}"),
                        const Gap(20),
                        SizedBox(width: 160,
                          child: LinearProgressIndicator(
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                            minHeight: 5,
                            value: widget.pokemonDetail.stats.elementAt(0).baseStat/360,

                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Gap(5),
                        const Text(
                          "Speed",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Gap(49),
                        Text(
                            "${widget.pokemonDetail.stats.elementAt(5).baseStat}"),
                        const Gap(20),
                        SizedBox(width: 160,
                          child: LinearProgressIndicator(
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                            minHeight: 5,
                            value: widget.pokemonDetail.stats.elementAt(0).baseStat/360,

                          ),
                        )
                      ],
                    )
                  ],
                )),
            Positioned(
              bottom: 300,
              right: 10,
              child: ElevatedButton(
                  onPressed: () {
                    log(widget.pokemonDetail.stats.toString());
                    log(widget.pokemonDetail.stats
                        .elementAt(0)
                        .baseStat
                        .toString());
                    log(widget.pokemonDetail.stats
                        .elementAt(0)
                        .stat
                        .name
                        .toString());
                  },
                  child: const Text("h")),
            ),
          ],
        ));
  }

  capitalizefirst(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }
}
