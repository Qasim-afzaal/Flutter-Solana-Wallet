import 'package:flutter_solana_login/core/pages/genrated_phrases.dart';
import 'package:flutter_solana_login/core/pages/home.dart';
import 'package:flutter_solana_login/core/pages/input_phares.dart';
import 'package:flutter_solana_login/core/pages/login_page.dart';
import 'package:flutter_solana_login/core/pages/setup_account.dart';
import 'package:flutter_solana_login/core/pages/setup_password.dart';
import 'package:go_router/go_router.dart';
final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginPage();
      }),
  GoRoute(
      path: '/setup',
      builder: (context, state) {
        return const SetupAccount();
      }),
  GoRoute(
      path: '/inputPhrase',
      builder: (context, state) {
        return const InputPhares();
      }),
  GoRoute(
      path: '/generatePhrase',
      builder: (context, state) {
        return const GenratedPhrases();
      }),
  GoRoute(
      path: '/passwordSetup/:mnemonic',
      builder: (context, state) {
        return SetupPassword(mnemonic: state.pathParameters["mnemonic"]);
      }),
  GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomePage();
      }),
]);
