import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService {
  // Metodo que solicita al usuario el permiso de utilizar la camara y devuelve el estado del permiso.
  Future<
    PermissionStatus
  >
  requestCameraPermission() async {
    final status = await Permission.camera.request();

    return status;
  }

  // Metodo que consulta el estado del permiso de la camara
  Future<
    PermissionStatus
  >
  checkCameraPermission() async {
    final status = await Permission.camera.status;

    return status;
  }

  // Metodo que abre la pantalla de configuracion de la app en el dispositivo.
  Future<
    void
  >
  openSettings() async {
    await openAppSettings();
  }
}
