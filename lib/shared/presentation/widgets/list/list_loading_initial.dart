import 'package:flutter/material.dart';

class ListLoadingInitial extends StatelessWidget {
  const ListLoadingInitial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 35),
      child: CircularProgressIndicator(),
    );
  }
}
