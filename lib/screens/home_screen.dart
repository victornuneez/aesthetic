import 'package:aesthetic/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen
    extends
        StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<
    HomeScreen
  >
  createState() => _HomeScreenState();
}

class _HomeScreenState
    extends
        State<
          HomeScreen
        > {
  // SERVICIOS
  final imagePickerService = ImagePickerService();

  // ESTADOS
  XFile? imageStatus;

  // Metodo intermediario que obtiene la imagen desde la camara del dispositivo.
  Future<
    void
  >
  _getImageFromCamera() async {
    final picture = await imagePickerService.loadImageFromCamera();

    if (picture ==
        null) {
      return;
    }

    setState(
      () {
        imageStatus = picture;
      },
    );
  }

  // Metodo intermediario que obtiene la imagen desde la galeria del dispositivo.
  Future<
    void
  >
  _getImageFromGallery() async {
    final picture = await imagePickerService.loadImageFromGallery();

    if (picture ==
        null) {
      return;
    }

    setState(
      () {
        imageStatus = picture;
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
          'Inicio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido a aesthetic!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              'Presiona el boton para editar tus fotos',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (
                  context,
                ) {
                  return AlertDialog(
                    actionsAlignment: MainAxisAlignment.spaceAround,
                    actions: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: _getImageFromCamera,
                            child: Text(
                              'Tomar foto',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _getImageFromGallery,
                            child: Text(
                              'Importar desde la galeria',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    insetPadding: EdgeInsets.all(
                      10,
                    ),
                  );
                },
          );
        },
      ),
    );
  }
}
