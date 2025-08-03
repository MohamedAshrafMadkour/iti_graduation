import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iti_graduation/core/constant/end_point.dart';
import 'package:iti_graduation/core/service/get_it_setup.dart';
import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/presentation/view/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<BookMarkEntity>(BookMarkEntityAdapter());
  await Hive.openBox<BookMarkEntity>(EndPoint.hiveEndPoint);
  getItSetup();
  runApp(const ItiGraduation());
}

class ItiGraduation extends StatelessWidget {
  const ItiGraduation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainView());
  }
}
