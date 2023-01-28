import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_shop/screens/product_detail/product_detail_screen.dart';
import 'package:small_shop/screens/product_overview/product_overview_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Lato",
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.deepOrangeAccent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      title: 'Cupertino App',
      initialRoute: ProductOverViewScreen.routeName,
      routes: {
        ProductOverViewScreen.routeName: (context) => ProductOverViewScreen(),
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
      },
    );
  }
}
