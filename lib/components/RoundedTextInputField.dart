import 'package:flutter/material.dart';
import 'package:lockery/components/TextFieldContainer.dart';

class RoundedTextInputField extends StatelessWidget {
  final String? hitText;
  final Widget? textIcon;
  final ValueChanged<String> onChanged;
  const RoundedTextInputField({
    Key? key,
    required this.hitText,
    required this.textIcon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hitText,
            icon: textIcon, //Icon(Icons.person)
            border: InputBorder.none),
      ),
    );
  }
}
