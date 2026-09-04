import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'dart:io';
import 'dart:ui' as ui;

class FiltersService {
  // Metodo que crea y devuelve on objeto textureSource que representa la imagen en una estrucutura de pixeles.
  Future<
    TextureSource
  >
  loadImage(
    File file,
  ) async {
    return await TextureSource.fromFile(
      file,
    );
  }

  Future<
    ui.Image
  >
  applyBrightness(
    TextureSource source,
  ) async {
    final configuration = BrightnessShaderConfiguration();

    configuration.brightness = 0.5;

    return await configuration.export(
      source,
      source.size,
    );
  }
}
