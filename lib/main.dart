import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gufytea/core/route/router.dart';
import 'package:gufytea/core/services/injection_container.dart';
import 'package:gufytea/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.white,
          ),
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
