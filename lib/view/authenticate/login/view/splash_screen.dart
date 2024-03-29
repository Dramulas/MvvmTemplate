import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../../../esd_app/home/view/home_view.dart';
import 'package:flutter/material.dart';

import 'login_via_azure_view.dart';

class SplashView extends StatelessWidget {
  final String token;
  const SplashView({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Hero(
              tag: "templateLogo",
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return LoginViaAzureView();
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return Align(
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Image.asset(
                  'assets/image/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'TEMPLATE',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              // height: 0.4,
            ),
          ),
        ],
      ),
      animationDuration: Duration(milliseconds: 1800),
      curve: Curves.easeIn,
      // nextScreen: token.isEmpty ? LoginViaAzureView() : HomeView(),
      nextScreen: HomeView(),
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: MediaQuery.of(context).size.width,
      centered: true,
    );
  }
}
