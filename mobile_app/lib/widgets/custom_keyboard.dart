import 'package:flutter/material.dart';
import 'package:orderease/widgets/keyboard_key.dart';

class CustomKeyboard extends StatefulWidget {
  final ValueSetter<dynamic> onTap;


  const CustomKeyboard({super.key, required this.onTap});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  final keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['00', '0', const Icon(Icons.keyboard_backspace)],
  ];


  renderKeyboard(){
    return keys
            .map((x) => Row(
                  children: x
                      .map((y) => Expanded(
                          child:
                              KeyboardKey(label: y, 
                              value: y, 
                              onTap: (val) {
                                widget.onTap(val);
                              }
                            )
                        )
                      )
                      .toList(),
                ))
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: renderKeyboard(),
          );
  }
}
