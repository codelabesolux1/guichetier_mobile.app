import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guichetier/pages/onborading_page/onboarding.dart';
import 'package:guichetier/providers/nav_bar_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFDD3705), // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
        systemNavigationBarColor: Color(0xFFDD3705),
        systemNavigationBarIconBrightness: Brightness.light,
        // systemNavigationBarDividerColor: Color(0xFF03BE0C),
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavBarProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Guichetier',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 2,
            foregroundColor: Color(0xFFE0E0E0),
            color: Color(0xFFDD3705),
          ),
          bottomAppBarColor: const Color(0xFFDD3705),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          useMaterial3: true,
          primarySwatch: Colors.deepOrange,
        ),
        home: const Onbording(),
      ),
    );
  }
}
