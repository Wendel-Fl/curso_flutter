import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/auth_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';

import '../models/auth.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return auth.isAuth ? const ProductOverviewScreen() : const AuthScreen();
  }
}
