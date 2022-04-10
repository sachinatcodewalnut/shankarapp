abstract class Config {
  static final _Config _config = _Config();
  static String get baseUrl => _config.baseUrl;
}

class _Config {
  String get baseUrl => 'https://shankaradev-api.codewalnut.com';
}
