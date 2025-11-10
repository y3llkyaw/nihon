import 'package:flutter/material.dart';

class AnimatedChipSelector extends StatefulWidget {
  const AnimatedChipSelector({Key? key}) : super(key: key);

  @override
  State<AnimatedChipSelector> createState() => _AnimatedChipSelectorState();
}

class _AnimatedChipSelectorState extends State<AnimatedChipSelector> {
  final List<String> items = ['Happy', 'Sad', 'Excited', 'Calm', 'Angry'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double totalWidth = constraints.maxWidth;
              double itemWidth = totalWidth / items.length;

              return Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  // Animated underline
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    left: selectedIndex * itemWidth,
                    bottom: 0,
                    child: Container(
                      width: itemWidth,
                      height: 3,
                      color: Colors.blueAccent,
                    ),
                  ),

                  // Chips row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(items.length, (index) {
                      final isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedIndex = index);
                        },
                        child: SizedBox(
                          width: itemWidth,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                items[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.blueAccent
                                      : Colors.grey,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
