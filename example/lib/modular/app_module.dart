import 'package:flutter_modular/flutter_modular.dart';
import 'package:rae_curvedbottombutton_package/rae_curvedbottombutton_package.dart';
import 'scaffold_widget.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    //
    Bind.lazySingleton((i) => RAECurvedButtonCubit()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ScaffoldWidget(title: 'rae_curvedbottombutton_package')),
  ];
}
