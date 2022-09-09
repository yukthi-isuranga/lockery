import 'package:flutter/material.dart';
import 'package:lockery/components/TextFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.lock, color: Colors.amber),
          border: InputBorder.none),
    ));
  }
}
