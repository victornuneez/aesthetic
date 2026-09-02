import 'package:aesthetic/services/permission_handler_service.dart';
import 'package:flutter/material.dart';

class PermissionDialog
    extends
        StatelessWidget {
  // Debe de recibir como propiedad el servicio de permisos para que este widget pueda funcionar..
  final PermissionHandlerService permissionService;

  const PermissionDialog({
    super.key,
    required this.permissionService,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        'Permiso necesario',
      ),
      content: Text(
        'La app necesita permisos del dispositivo para acceder a la camara',
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(
              context,
            );
            await permissionService.openSettings();
          },
          child: Text(
            'Ir a configuraciones',
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: Text(
            'Cancelar',
          ),
        ),
      ],
    );
  }
}
