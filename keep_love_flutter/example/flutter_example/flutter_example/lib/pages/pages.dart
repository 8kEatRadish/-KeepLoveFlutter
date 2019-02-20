import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xff678fb4),
      'assets/hotels.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/key.png'
  ),
  new PageViewModel(
      const Color(0xff65b0b4),
      'assets/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/wallet.png',
  ),
  new PageViewModel(
      const Color(0xff9b90bc),
      'assets/stores.png',
      'Store',
      'All local stores are categorized for your convenience',
      'assets/shopping_cart.png'
  )
];

class Page extends StatelessWidget {

  final PageViewModel viewModel;
  final double percentVisible;

  const Page({Key key, this.viewModel, this.percentVisible = 1.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      color: viewModel.color,
      child: new Opacity(
        opacity: percentVisible,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Transform(
              transform: new Matrix4.translationValues(0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: new Image.asset(
                    viewModel.heroAssetPath,
                    width: 200.0,
                    height: 200.0
                ),
              ),
            ),
            new Transform(
              transform: new Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: new Text(
                  viewModel.title,
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'FlamanteRoma',
                    fontSize: 34.0,
                  ),
                ),
              ),
            ),
            new Transform(
              transform: new Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: new Text(
                    viewModel.body,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewModel{
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body, this.iconAssetPath);
}