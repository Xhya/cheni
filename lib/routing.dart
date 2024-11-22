import 'package:cheni/screens/Home.screen.dart';
import 'package:cheni/screens/ImageViewer.screen.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:flutter/material.dart';

enum ScreenEnum {
  home,
  imageViewer,
}

class Routing extends StatefulWidget {
  const Routing({super.key});

  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  var navigationService = NavigationService();

  @override
  Widget build(BuildContext context) {
    navigationService.showDialog ??= (Widget dialogWidget) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return dialogWidget;
        },
      );
    };

    navigationService.pushNavigation ??= () {
      navigateTo(Widget screen) {
        if (screen is HomeScreen) {
          // Pop navigation stack to prevent overstacked screens
          Navigator.of(context).popUntil((route) {
            return route.settings.name == screen.toString() ||
                route.settings.name == "/";
          });
        }

        Navigator.push(
            context,
            PageRouteBuilder(
              settings: RouteSettings(
                  name: navigationService.currentScreen.toString()),
              pageBuilder: (BuildContext context, Animation<double> animation1,
                  Animation<double> animation2) {
                return screen;
              },
              // TODO: shoud we have animation ?
              // transitionDuration: const Duration(milliseconds: 400),
              // reverseTransitionDuration: const Duration(milliseconds: 400),
              // transitionsBuilder:
              //     (context, animation, secondaryAnimation, child) {
              //   return FadeTransition(
              //     opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              //     child: child,
              //   );
              // },
            ));
      }

      switch (navigationService.currentScreen) {
        case ScreenEnum.home:
          navigateTo(const HomeScreen());
        case ScreenEnum.imageViewer:
          navigateTo(const ImageViewerScreen());
        default:
          throw Error();
      }
    };

    return const HomeScreen();
  }
}
