import 'package:flutter/material.dart';
import '../../../utils/image_assets.dart';

class CustomAppBarForLogin extends StatelessWidget {
  const CustomAppBarForLogin({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 260,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Flexible(
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Flexible(
                child: Image.asset(
                  ImageAssets.login,
                  height: 145,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
