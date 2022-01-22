import 'package:flutter/material.dart';

class CustomScrollScaffold extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color backgroundColor;
  const CustomScrollScaffold({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
