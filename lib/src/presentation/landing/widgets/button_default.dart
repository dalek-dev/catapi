import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final void Function() onPressed;
  const ButtonDefault({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith<double>(
              (state) => 0,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
                const Color(0xff44d2ff).withOpacity(0)),
            shadowColor: MaterialStateProperty.all<Color>(
                const Color(0xff44d2ff).withOpacity(0.7)),
            surfaceTintColor: MaterialStateProperty.all<Color>(
                const Color(0xff44d2ff).withOpacity(0.7)),
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color(0xff44d2ff).withOpacity(0.7)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((state) {
              if (state.contains(MaterialState.disabled)) {
                return const Color(0xff44d2ff).withOpacity(0.7);
              }
              return const Color(0xff44d2ff).withOpacity(0);
            }),
          ),
          onPressed: onPressed,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Más...',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'The Cat FREE',
                  fontSize: 24),
            ),
          )),
    );
  }
}
