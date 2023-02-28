import 'package:flutter/material.dart';

enum KeyType { number, operator, function }

class KeyConfig {
  final int id;
  final String title;
  final VoidCallback handler;
  final KeyType type;
  final int span;

  KeyConfig({
    required this.id,
    required this.title,
    required this.handler,
    this.span = 1,
    this.type = KeyType.number,
  });
}
