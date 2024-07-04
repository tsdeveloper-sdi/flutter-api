import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:get/get.dart';
import 'package:transformable_list_view/transformable_list_view.dart';
import '../../controller/side_menu_controller.dart';
import '../../controller/auth_manager.dart';

class ADTPage extends StatefulWidget {
  const ADTPage({super.key});

  @override
  State<ADTPage> createState() => _ADTPageState();
}

class _ADTPageState extends State<ADTPage> {
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final SideMenuController _sideMenuController = Get.put(SideMenuController());
  final AuthManager _authManager = Get.find<AuthManager>();

  @override
  Widget build(BuildContext context) {
    if (!_authManager.authenticated) {
      Get.toNamed('/');
    }

    return SideMenu(
      background: Color.fromRGBO(34, 37, 51, 1),
      key: _sideMenuKey,
      menu: _sideMenuController.sideMenu(),
      type: SideMenuType.slide,
      onChange: (value) {
        setState(() => isOpened = value);
      },
      child: IgnorePointer(
        ignoring: isOpened,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(34, 37, 51, 1),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                final _state = _sideMenuKey.currentState!;
                if (_state.isOpened) {
                  _state.closeSideMenu();
                } else {
                  _state.openSideMenu();
                }
              },
            ),
            title: Text(
              "Form ADT",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Color.fromRGBO(34, 37, 51, 0.9),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                  child: SizedBox(
                    height: MediaQuery.of(context)
                        .size
                        .height, // Ensure the TransformableListView has proper constraints
                    child: TransformableListView.builder(
                      getTransformMatrix: TransformMatrices.scaleDown,
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.white : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text("Document " + index.toString()),
                              Text("Description " + index.toString()),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.large(
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {
              Get.toNamed("/adt_form_page");
            },
          ),
        ),
      ),
    );
  }
}

class TransformMatrices {
  static Matrix4 scaleDown(TransformableListItem item) {
    const endScaleBound = 0.3;
    final animationProgress = item.visibleExtent / item.size.height;
    final paintTransform = Matrix4.identity();

    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }

  static Matrix4 rotate(TransformableListItem item) {
    const maxRotationTurnsInRadians = pi / 2.0;
    final animationProgress = 1 - item.visibleExtent / item.size.height;
    final paintTransform = Matrix4.identity();

    if (item.position != TransformableListItemPosition.middle) {
      final isEven = item.index?.isEven ?? false;
      final FractionalOffset fractionalOffset;
      final int rotateDirection;

      switch (item.position) {
        case TransformableListItemPosition.topEdge:
          fractionalOffset = isEven
              ? FractionalOffset.bottomLeft
              : FractionalOffset.bottomRight;
          rotateDirection = isEven ? -1 : 1;
          break;
        case TransformableListItemPosition.middle:
          return paintTransform;
        case TransformableListItemPosition.bottomEdge:
          fractionalOffset =
              isEven ? FractionalOffset.topLeft : FractionalOffset.topRight;
          rotateDirection = isEven ? 1 : -1;
          break;
      }

      final rotateAngle = animationProgress * maxRotationTurnsInRadians;
      final translation = fractionalOffset.alongSize(item.size);

      paintTransform
        ..translate(translation.dx, translation.dy)
        ..rotateZ(rotateDirection * rotateAngle)
        ..translate(-translation.dx, -translation.dy);
    }

    return paintTransform;
  }

  static Matrix4 wheel(TransformableListItem item) {
    const maxRotationTurnsInRadians = pi / 5.0;
    const minScale = 0.6;
    const maxScale = 1.0;
    const depthFactor = 0.01;
    final medianOffset = item.constraints.viewportMainAxisExtent / 2;
    final animationProgress =
        1 - item.offset.dy.clamp(0, double.infinity) / medianOffset;
    final scale = minScale + (maxScale - minScale) * animationProgress.abs();
    final translationOffset = FractionalOffset.center.alongSize(item.size);
    final rotationMatrix = Matrix4.identity()
      ..setEntry(3, 2, depthFactor)
      ..rotateX(maxRotationTurnsInRadians * animationProgress)
      ..scale(scale);

    final result = Matrix4.identity()
      ..translate(translationOffset.dx, translationOffset.dy)
      ..multiply(rotationMatrix)
      ..translate(-translationOffset.dx, -translationOffset.dy);

    return result;
  }
}
