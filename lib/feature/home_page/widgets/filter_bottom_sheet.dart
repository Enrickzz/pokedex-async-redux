import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/pokemon_filtered_page/pokemon_filtered_connector.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    required this.onFilterTap,
    Key? key,
  }) : super(key: key);
  final Function(String typeFilter) onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
            child: Icon(
              Icons.remove,
              size: 30,
            ),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 30,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: colorFilters.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokemonFilteredPageConnector(filterKey: colorFilters[index])));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorFilters[index].getPokemonColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        bottom: 5,
                        child: Text(
                          colorFilters[index].capitalize,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
