import 'package:flutter/material.dart';

class CustomIconButton {
  static IconButton buildIconButton(var context, String tooltip, Color color,
      IconData icon, double size, VoidCallback onPressed) {
    return IconButton(
      color: color,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      icon: Icon(icon, size: size),
      tooltip: tooltip,
    );
  }
}
