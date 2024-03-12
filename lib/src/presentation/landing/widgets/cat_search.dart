import 'package:flutter/material.dart';
import 'package:p_catapi/services/models/cat.dart';
import 'package:provider/provider.dart';
import 'package:p_catapi/src/presentation/landing/logic/search_provider.dart';

class CatSearch extends StatefulWidget {
  final List<Cat>? cats;
  const CatSearch(this.cats, {super.key});

  @override
  State<CatSearch> createState() => _CatSearchState();
}

class _CatSearchState extends State<CatSearch> {
  late SearchProvider _searchProvider;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchProvider = Provider.of<SearchProvider>(context, listen: false);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    _searchProvider.searchByBreed(_searchController.text, widget.cats);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          labelText: 'Search',
          labelStyle: TextStyle(fontFamily: 'The Cat FREE'),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
