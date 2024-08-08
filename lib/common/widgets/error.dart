import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errors;
  const ErrorScreen({Key? key, required this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
     child:  Text(errors)
    );
  }
}