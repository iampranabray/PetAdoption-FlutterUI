import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatefulWidget {
  const PhotoViewer(
      {Key? key, required this.url, this.isParentRotation = false})
      : super(key: key);
  final String url;
  final bool isParentRotation;

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 16;
        if (details.delta.dy > sensitivity) {
          // Down Swipe
          Navigator.pop(context);
        } else if (details.delta.dy < -sensitivity) {
          // Up Swipe
        }
      },
      child: Stack(
        children: [
          PhotoView(
            imageProvider: AssetImage(widget.url),
            backgroundDecoration: BoxDecoration(
              color: themeData.colorScheme.onBackground.withOpacity(0.8),
            ),
            enableRotation: widget.isParentRotation,
            errorBuilder: (BuildContext context, Object obj, StackTrace? stck) {
              return Center(
                child: Icon(
                  MdiIcons.imageBroken,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            },
            minScale: PhotoViewComputedScale.contained * 0.8,
            // maxScale: PhotoViewComputedScale.covered * 1.8,
            initialScale: PhotoViewComputedScale.contained * 1.1,
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                MdiIcons.closeCircle,
                color: Colors.white,
              ),
              onPressed: () {
                if (widget.isParentRotation == false) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                  ]);
                }

                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context);
                });
              },
            ),
            top: 4,
            left: MediaQuery.of(context).size.width - 80,
          )
        ],
      ),
    );
  }
}
