import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'paginas/catalogo_page.dart';
import 'paginas/detalle_page.dart';
import 'paginas/lista_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CatalogoPage(),
    ),
    GoRoute(
      path: '/detalle',
      builder: (context, state) => const DetallePage(),
    ),
    GoRoute(
      path: '/lista',
      builder: (context, state) => const ListaPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
