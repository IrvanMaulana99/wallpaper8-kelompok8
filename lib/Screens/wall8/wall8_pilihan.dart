import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

enum AturWallpaper { Home, Lockscreen, Keduanya }

const _aturSebagai = {
  AturWallpaper.Home: WallpaperManager.HOME_SCREEN,
  AturWallpaper.Lockscreen: WallpaperManager.LOCK_SCREEN,
  AturWallpaper.Keduanya: WallpaperManager.BOTH_SCREENS,
};

Future<void> wall8atur({BuildContext context, String url}) async {
  var actionSheet = CupertinoActionSheet(
    title: Text('Atur Sebagai'),
    actions: [
      CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop(AturWallpaper.Home);
        },
        child: Text('Layar Utama'),
      ),
      CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop(AturWallpaper.Lockscreen);
        },
        child: Text('Lockscreen'),
      ),
      CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop(AturWallpaper.Keduanya);
        },
        child: Text('Keduanya'),
      ),
    ],
  );

  AturWallpaper option = await showCupertinoModalPopup(
      context: context, builder: (context) => actionSheet);

  if (option != null) {
    var cachedImage = await DefaultCacheManager().getSingleFile(url);

    if (cachedImage != null) {
      var croppedImage = await ImageCropper.cropImage(
        sourcePath: cachedImage.path,
        aspectRatio: CropAspectRatio(
          ratioX: MediaQuery.of(context).size.width,
          ratioY: MediaQuery.of(context).size.height,
        ),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Gambar',
          toolbarColor: Colors.purple,
          hideBottomControls: true,
        ),
      );

      if (croppedImage != null) {
        var result = await WallpaperManager.setWallpaperFromFile(
            croppedImage.path, _aturSebagai[option]);

        if (result != null) {
          debugPrint(result);
        }
      }
    }
  }
}
