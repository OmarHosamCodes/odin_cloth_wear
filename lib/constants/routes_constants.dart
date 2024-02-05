class Routes {
  // final env = Platform.environment;
  // late final adminRootPath = env[Private.adminEnvRef]!;

  static const String homeRoot = 'home';
  static const String home = '/';
  static const String itemRoot = 'item';
  // static const String item = '/item/:id';
  static const String item = '/item/:id';
  static const String adminRoot = 'admin';
  // late String admin = '/admin/$adminRootPath';
  static const String pageNotFound = '/404';
}
