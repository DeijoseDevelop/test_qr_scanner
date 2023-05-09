import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_qr_scanner/src/controllers/controllers.dart';
import 'package:test_qr_scanner/src/data/repositories/repositories.dart';
import 'package:test_qr_scanner/src/data/use_cases/use_cases.dart';

class Injector {
  static List<SingleChildWidget> dependencies = [
    ChangeNotifierProvider(
      create: (_) => HomeController(
        createQrUseCase: CreateQrUseCase(
          repository: ApiRepository(),
        ),
      ),
    ),
    ChangeNotifierProvider(
      create: (_) => ScannerController(),
    ),
  ];
}
