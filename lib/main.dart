import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsec_app/models/event_model/event_model.dart';
import 'package:tsec_app/new_ui/router.dart';
import 'package:tsec_app/new_ui/screens/home_screen/home_screen.dart';
import 'package:tsec_app/new_ui/screens/notes_screen/notes_screen.dart';
import 'package:tsec_app/new_ui/screens/railway_screen/railway_screen.dart';
import 'package:tsec_app/new_ui/screens/splash_screen/splash_screen.dart';
import 'package:tsec_app/new_ui/screens/main_screen/main_screen.dart';
import 'package:tsec_app/new_ui/screens/login_screen/login_screen.dart';
import "package:tsec_app/new_ui/screens/event_details_screen/event_details.dart";
// import 'package:tsec_app/screens/login_screen/login_screen.dart';
import 'package:tsec_app/new_ui/screens/profile_screen/profile_screen.dart';
import 'package:tsec_app/screens/department_screen/department_screen.dart';
import 'package:tsec_app/screens/departmentlist_screen/department_list.dart';
import 'package:tsec_app/utils/department_enum.dart';
// import 'package:tsec_app/screens/railwayConcession/railwayConcession.dart';
// import 'package:tsec_app/screens/splash_screen.dart';
//import 'firebase_options.dart';
import 'provider/app_state_provider.dart';
import 'provider/shared_prefs_provider.dart';
import 'provider/theme_provider.dart';
// import 'screens/old_committees_screen.dart';
// import 'screens/departmentlist_screen/department_list.dart';
// import 'screens/department_screen/department_screen.dart';
// import 'screens/main_screen/main_screen.dart';
// import 'screens/notification_screen/notification_screen.dart';
// import 'screens/theme_screen/theme_screen.dart';
// import 'screens/tpc_screen.dart';
import 'utils/init_get_it.dart';
import 'utils/themes.dart';
import 'firebase_options.example.dart';

// To handle all the background messages
// Currently not used but wont work if not present
Future<void> _handleBackgroundMessage(RemoteMessage message) async {}

Future<void> main() async {
  // bool debugMode = true;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (debugMode) {
  //   try {
  //     FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  //     FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
  //     await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //   }
  // }
  FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

  initGetIt();

  final _sharedPrefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      ProviderScope(
        overrides: [
          sharedPrefsProvider
              .overrideWithValue(SharedPrefsProvider(_sharedPrefs))
        ],
        child: const TSECApp(),
      ),
    );
  });
}

class TSECApp extends ConsumerStatefulWidget {
  const TSECApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TSECAppState();
}

class _TSECAppState extends ConsumerState<TSECApp> {
  late final GoRouter _routes;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _routes = routes;
  }

  @override
  Widget build(BuildContext context) {
    // if (ref.watch(firebaseAuthProvider).currentUser?.uid != null) {
    // getuserData();
    // }

    final _themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          MediaQuery(data: getTextScale(context), child: child!),
      routeInformationProvider: _routes.routeInformationProvider,
      routeInformationParser: _routes.routeInformationParser,
      routerDelegate: _routes.routerDelegate,
      title: 'TSEC App',
      // themeMode: _themeMode,
      themeMode: ThemeMode.dark,
      // theme: theme,
      darkTheme: darkTheme,
    );
  }
}