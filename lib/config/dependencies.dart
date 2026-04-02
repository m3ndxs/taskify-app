import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:taskify_app/config/theme_manager.dart';

List<SingleChildWidget> get providersLocal {
  return [
    ChangeNotifierProvider<ThemeManager>(
      create: (context) => ThemeManager(),
    ),
  ];
}