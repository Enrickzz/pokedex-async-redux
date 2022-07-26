import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    required this.height,
    required this.weight,
    required this.abilities,
    required this.baseExperience,
    Key? key,
  }) : super(key: key);
  final int height;
  final int weight;
  final int baseExperience;
  final List<Ability> abilities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      aboutHeight,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text('${height / 10} m'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      aboutWeight,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text('${weight / 10} kg'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      aboutAbilities,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                Flexible(child: Text(abilities.map((e) => e.ability?.name?.capitalize ?? '').toList().join(', '))),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      aboutBaseExperience,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(baseExperience.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
