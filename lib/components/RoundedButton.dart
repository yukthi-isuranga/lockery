import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double? userDifindWidth;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    this.userDifindWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: color,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
    return Container(
      padding: userDifindWidth == null
          ? EdgeInsets.symmetric(horizontal: 20, vertical: 5)
          : null,
      width: userDifindWidth == null ? width * 0.8 : userDifindWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            style: flatButtonStyle,
            // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            // color: color,
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }
}
