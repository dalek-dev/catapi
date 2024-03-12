import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../services/models/cat.dart';

class DetailsScreen extends StatefulWidget {
  final CatDetails details;
  const DetailsScreen({required this.details, super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text(
            widget.details.name ?? '',
            style: const TextStyle(fontFamily: 'The Cat FREE', fontSize: 40),
          ),
        ),
        body: SafeArea(
            child: Stack(children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 280),
                Text(
                  widget.details.description ?? '',
                  style:
                      const TextStyle(fontFamily: 'The Cat FREE', fontSize: 35),
                ),
                SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Breed: ${widget.details.name}',
                        style: const TextStyle(
                            fontFamily: 'The Cat FREE', fontSize: 35),
                      ),
                      Text(
                        'Country origin: ${widget.details.countryOrigin}',
                        style: const TextStyle(
                            fontFamily: 'The Cat FREE', fontSize: 35),
                      ),
                      Text(
                        'Intelligence: ${widget.details.intelligence}',
                        style: const TextStyle(
                            fontFamily: 'The Cat FREE', fontSize: 35),
                      ),
                      Text(
                        'Adaptibility: ${widget.details.adaptability}',
                        style: const TextStyle(
                            fontFamily: 'The Cat FREE', fontSize: 35),
                      ),
                      Text(
                        'Life Span: ${widget.details.lifeSpan}',
                        style: const TextStyle(
                            fontFamily: 'The Cat FREE', fontSize: 35),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FadeInImage(
                  width: size.width - 50,
                  height: 250,
                  image: NetworkImage(widget.details.image ?? ''),
                  imageErrorBuilder: (context, image, _) {
                    return Image.asset(
                      'assets/images/default_cat.png',
                      fit: BoxFit.cover,
                      scale: 4,
                    );
                  },
                  fit: BoxFit.cover,
                  placeholder: const AssetImage(
                    'assets/images/default_cat.png',
                  )),
            ),
          )
        ])));
  }
}
