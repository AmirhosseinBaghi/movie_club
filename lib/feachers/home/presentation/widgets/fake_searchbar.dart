import 'package:flutter/material.dart';

class FakeSearchbar extends StatelessWidget {
  final VoidCallback onpress;
  const FakeSearchbar({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.search_rounded),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Search movies...',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
