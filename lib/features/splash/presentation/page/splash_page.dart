import 'package:auto_route/auto_route.dart';
import 'package:crybse/routers/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      await AutoRouter.of(context).pushAndPopUntil(
        const HomePageRoute(),
        predicate: (_) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/lottie/bitcoin.json'));
  }
}
