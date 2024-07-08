
import 'package:flutter/material.dart';

class TemplateCards extends StatelessWidget {
  const TemplateCards({
    super.key,
    required this.cardName,
    required this.onTap, 
  });

  final String cardName;

  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),

            // image: DecorationImage(

            //   fit: BoxFit.contain,
            //   image: AssetImage(imagePath),

            // ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(4, 3),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Colors.amber.withOpacity(0.7),
                  Colors.red.withOpacity(0.7),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Center(
              child: Text(
                cardName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
