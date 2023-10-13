enum Config { baseUrl, baseScheme, baseAPIpath, url }

const bool isDev = false;

const String myUrl = '0.0.0.0';
const String realUrl = 'api.binance.com';

extension ConfigExtension on Config {
  String get value {
    switch (this) {
      case Config.baseUrl:
        return !isDev ? realUrl : myUrl;
      case Config.baseAPIpath:
        return 'api/v3';
      case Config.url:
        return url;
      default:
        return isDev ? 'http' : 'https';
    }
  }

  String get url {
    return Config.baseScheme.value +
        "://" +
        Config.baseUrl.value +
        '/' +
        Config.baseAPIpath.value;
  }
}
