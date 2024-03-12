import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_catapi/services/models/cat.dart';
import 'package:p_catapi/src/presentation/landing/logic/landing_provider.dart';
import 'package:p_catapi/src/presentation/landing/logic/search_provider.dart';
import 'package:p_catapi/src/presentation/landing/widgets/button_default.dart';
import 'package:p_catapi/src/presentation/landing/widgets/cat_search.dart';
import 'package:provider/provider.dart';

import '../../details/screens/details_screen.dart';
import '../logic/cat_image_provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late LandingProvider _landingProvider;
  late CatImageProvider _catImageProvider;
  late SearchProvider _searchProvider;
  Timer? _timer;
  int _completedRequests = 0;

  @override
  void initState() {
    super.initState();
    _landingProvider = context.read<LandingProvider>();
    _catImageProvider = context.read<CatImageProvider>();
    _searchProvider = context.read<SearchProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _landingProvider.getCatBreeds();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer(String refenceImage) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      _completedRequests = 0;
      for (var cat in _landingProvider.cats) {
        if (cat.refenceImage != null) {
          _catImageProvider.getCatImage(cat.refenceImage!).then((_) {
            _completedRequests++;
            if (_completedRequests == _landingProvider.cats.length) {
              _timer?.cancel();
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Consumer<LandingProvider>(
                  builder: (context, provider, child) {
                    final filteredCats =
                        _searchProvider.searchResults.isNotEmpty
                            ? provider.cats.where((cat) {
                                final searchTerm =
                                    cat.name?.toLowerCase() ?? '';
                                return _searchProvider.searchResults.any(
                                    (result) => searchTerm.contains(
                                        result.name?.toLowerCase() ?? ''));
                              }).toList()
                            : provider.cats;
                    return filteredCats.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xff44d2ff),
                            ),
                          )
                        : Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: filteredCats.map((cat) {
                                String catImageTemp = '';
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: double.infinity,
                                  child: Card(
                                    color: const Color(0xff44d2ff)
                                        .withOpacity(0.7),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Breed: ${cat.name}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'The Cat FREE',
                                                    fontSize: 24),
                                              ),
                                              ButtonDefault(onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => DetailsScreen(
                                                        details: CatDetails(
                                                            cat.name,
                                                            cat.description,
                                                            cat.countryOrigin,
                                                            cat.intelligence,
                                                            cat.adaptability,
                                                            cat.lifeSpan,
                                                            catImageTemp)), // Pasa el nombre del gato aquí
                                                  ),
                                                );
                                              })
                                            ],
                                          ),
                                          Consumer<CatImageProvider>(builder:
                                              (context, providerImage, child) {
                                            if (cat.refenceImage != null) {
                                              _startTimer(cat.refenceImage!);

                                              final catImage = _catImageProvider
                                                  .getImageById(
                                                      cat.refenceImage!);
                                              catImageTemp =
                                                  catImage?.url ?? '';
                                              if (catImage != null) {
                                                return FadeInImage(
                                                  width: size.width - 50,
                                                  height: 250,
                                                  image: NetworkImage(
                                                      catImage.url ?? ''),
                                                  imageErrorBuilder:
                                                      (context, image, _) {
                                                    return Image.asset(
                                                      'assets/images/default_cat.png',
                                                      fit: BoxFit.cover,
                                                      scale: 4,
                                                    );
                                                  },
                                                  fit: BoxFit.cover,
                                                  placeholder: const AssetImage(
                                                    'assets/images/default_cat.png',
                                                  ),
                                                );
                                              }
                                            }

                                            return Image.asset(
                                              'assets/images/default_cat.png',
                                              fit: BoxFit.cover,
                                              scale: 4,
                                            );
                                          }),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Country origin: ${cat.countryOrigin}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'The Cat FREE',
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                'Intelligence: ${cat.intelligence}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'The Cat FREE',
                                                    fontSize: 24),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                  },
                )
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Catbreeds',
                    style: TextStyle(fontFamily: 'The Cat FREE', fontSize: 35),
                  ),
                  Consumer<SearchProvider>(
                    builder: (context, searchProvider, _) =>
                        CatSearch(context.read<LandingProvider>().cats),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
