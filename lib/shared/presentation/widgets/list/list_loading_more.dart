import 'package:flutter/material.dart';

class ListLoadingMore extends StatelessWidget {
  const ListLoadingMore({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
