import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cheni/screens/CreateDocument.screen.dart';
import 'package:cheni/screens/DocumentCategory.screen.dart';
import 'package:cheni/screens/Home.screen.dart';
import 'package:cheni/screens/ImageViewer.screen.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';

enum ScreenEnum {
  home,
  imageViewer,
  documentCategory,
  createDocument,
}

class Routing extends StatefulWidget {
  const Routing({super.key});

  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  bool backButtonInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    navigationService.popNavigation(context);
    return true;
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(backButtonInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(backButtonInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    navigationService.showDialog ??= (Widget dialogWidget) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Center(child: dialogWidget);
        },
      );
    };

    navigationService.showMenu ??= ({
      required List<PopupMenuEntry<void>> items,
    }) {
      showMenu<void>(
        context: context,
        items: items,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        position: RelativeRect.fromDirectional(
          textDirection: TextDirection.ltr,
          start: 0,
          top: double.maxFinite,
          end: -double.maxFinite,
          bottom: 100,
        ),
      );
    };

    navigationService.showBottomSheet ??= (Widget widget) {
      showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: CheniColors().background.one,
              borderRadius: BorderRadius.circular(16),
            ),
            child: widget,
          );
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
        case ScreenEnum.documentCategory:
          navigateTo(const DocumentCategoryScreen());
        case ScreenEnum.createDocument:
          navigateTo(const CreateDocumentScreen());
        default:
          throw Error();
      }
    };

    return const Scaffold(body: HomeScreen());
  }
}
