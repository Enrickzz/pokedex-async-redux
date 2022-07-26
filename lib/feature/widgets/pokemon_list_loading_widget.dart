import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PokemonListLoading extends StatelessWidget {
  const PokemonListLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Scaffold(
        body: Center(child: SpinKitDualRing(color: Colors.black)),
      ),
    );
  }
}
