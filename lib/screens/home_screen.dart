import 'package:aesthetic/services/image_picker_service.dart';
import 'package:aesthetic/services/permission_handler_service.dart';
import 'package:aesthetic/widgets/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
  final permissionService = PermissionHandlerService();

  // ESTADOS
  XFile? imageStatus;

  @override
  void initState() {
    super.initState();

    // Pedimos el acceso a la camara al construir la interfaz de la app por primera vez.
    _checkCameraPermission();
  }

  // Metodo que intermediario que solicita al servicio el permiso de la camara del dispositivo
  Future<
    void
  >
  _checkCameraPermission() async {
    final status = await permissionService.requestCameraPermission();
    debugPrint(
      'Estado de permisos actual: $status',
    );

    if (status.isPermanentlyDenied) {
      await _showPermissionDialog();
    }
  }

  // Metodo auxiliar que crea el alertDialog para abrir las configuraciones de la app.
  Future<
    void
  >
  _showPermissionDialog() async {
    await showDialog(
      context: context,
      builder:
          (
            context,
          ) {
            return PermissionDialog(
              permissionService: permissionService,
            );
          },
    );
  }

  // Metodo intermediario que obtiene la imagen desde la camara del dispositivo.
  Future<
    void
  >
  _getImageFromCamera() async {
    final status = await permissionService.checkCameraPermission();
    debugPrint(
      'Estado actual: $status',
    );

    // Verficamos si la interfaz HomeScreen sique montado.
    if (!mounted) return;

    // ESTADO CONCEDIDO
    if (status.isGranted) {
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

      // ESTADO DENEGADO
    } else if (status.isDenied) {
      final newStatus = await permissionService.requestCameraPermission();

      if (newStatus.isGranted) {
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

      // ESTADO PERMANENTEMENTE DENEGADO.
    } else if (status.isPermanentlyDenied) {
      _showPermissionDialog();
    }
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
              'Agrega tus fotos con el boton de abajo',
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
