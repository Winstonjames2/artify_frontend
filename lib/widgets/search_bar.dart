import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final bool isSearching;
  final VoidCallback onCancelSearch;
  final ValueChanged<String> onSearch;

  const CustomSearchBar({
    super.key,
    required this.isSearching,
    required this.onCancelSearch,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return isSearching
        ? Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onCancelSearch,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for anything on Artify',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: onSearch,
                  style: TextStyle(color: Colors.white),
                  autofocus: true,
                ),
              ),
            ],
          )
        : Text(
            'Artify',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 25),
          );
  }
}
