import 'dart:ui' as ui;

import 'package:aesthetic/services/flutter_image_filter_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FiltersScreen
    extends
        StatefulWidget {
  // Propiedad que recibe la imagen obtenida en el Home.
  final XFile image;

  const FiltersScreen({
    super.key,
    required this.image,
  });

  @override
  State<
    FiltersScreen
  >
  createState() => _FiltersScreenState();
}

class _FiltersScreenState
    extends
        State<
          FiltersScreen
        > {
  // SERVICIOS
  final filterServices = FiltersService();

  // ESTADOS
  TextureSource? textureSource;
  ui.Image? filteredImage;

  @override
  void initState() {
    super.initState();

    _loadTexture();
  }

  // Metodo que convierte la imagen recibida en un objeto TextureSource listo para utilizar
  Future<
    void
  >
  _loadTexture() async {
    final file = File(
      widget.image.path,
    );
    final texture = await filterServices.loadImage(
      file,
    );

    setState(
      () {
        textureSource = texture;
      },
    );
  }

  Future<
    void
  >
  applyBrightnessFilter() async {
    if (textureSource ==
        null) {
      return;
    }

    final filtered = await filterServices.applyBrightness(
      textureSource!,
    );

    setState(
      () {
        filteredImage = filtered;
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Filtros',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child:
            filteredImage ==
                null
            ? Image.file(
                File(
                  widget.image.path,
                ),
              )
            : RawImage(
                image: filteredImage,
              ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        color: const ui.Color.fromARGB(
          71,
          133,
          133,
          133,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  fixedSize: Size(
                    60,
                    72,
                  ),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(
                      20,
                    ),
                  ),
                ),
                child: Text(
                  'FILTER',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  fixedSize: Size(
                    60,
                    72,
                  ),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(
                      20,
                    ),
                  ),
                ),
                child: Text(
                  'FILTER',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  fixedSize: Size(
                    60,
                    72,
                  ),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(
                      20,
                    ),
                  ),
                ),
                child: Text(
                  'FILTER',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  fixedSize: Size(
                    60,
                    72,
                  ),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(
                      20,
                    ),
                  ),
                ),
                child: Text(
                  'FILTER',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  fixedSize: Size(
                    60,
                    72,
                  ),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(
                      20,
                    ),
                  ),
                ),
                child: Text(
                  'FILTER',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
