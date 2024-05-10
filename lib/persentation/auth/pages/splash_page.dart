import 'package:flutter/material.dart';
import 'package:presence_flutter_app/core/core.dart';
import 'package:presence_flutter_app/data/datasources/auth_local_datasource.dart';
import 'package:presence_flutter_app/persentation/auth/pages/login_page.dart';
import 'package:presence_flutter_app/persentation/home/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () => context.pushReplacement(const LoginPage()),
    // );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: FutureBuilder(
        future: AuthLocalDatasource().isAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Assets.images.logoWhite.image(),
                ),
                const Spacer(),
                Assets.images.logoCodeWithBahri.image(height: 70),
                const SpaceHeight(20.0)
              ],
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data! == true) {
              Future(
                () => context.pushReplacement(const MainPage()),
              );
            } else {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const LoginPage()),
              );
            }
          }
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Assets.images.logoWhite.image(),
              ),
              const Spacer(),
              Assets.images.logoCodeWithBahri.image(height: 70),
              const SpaceHeight(20.0)
            ],
          );
        },
      ),
    );
  }
}
