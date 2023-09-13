// ignore_for_file: unused_local_variable

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickeye/controller/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value
              ? Stack(
                  children: [
                    CameraPreview(controller.cameraController),
                    LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        final double x = controller.x ?? 0;
                        final double y = controller.y ?? 0;
                        final double w = controller.w ?? 0;
                        final double h = controller.h ?? 0;

                        final double top = y * constraints.maxHeight;
                        final double right = x * constraints.maxWidth;
                        final double width = w * constraints.maxWidth;
                        final double height = h * constraints.maxHeight;

                        return Padding(
                          padding: const EdgeInsets.only(top:28.0),
                          child: Positioned(
                            top: 300,
                            right: right,
                            child: Container(padding: EdgeInsets.only(top: 12),
                              width: 400,
                              height: 600,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.green,
                                  width: 4.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Text(controller.label),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : const Center(
                  child: Text(
                    'Loading Preview...',
                  ),
                );
        },
      ),
    );
  }
}
