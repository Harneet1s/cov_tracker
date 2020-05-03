import 'package:http/http.dart';
import 'network/network_calls.dart';

final client = Client();

final netWorkCalls = NetworkCalls();

final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
final Function mathFunc = (Match match) => '${match[1]},';

abstract class UrlConstants {
  static const String baseUrl = 'https://coronavirus-19-api.herokuapp.com';
  static const String globalInfo = '$baseUrl/all';
  static const String allCountries = 'https://coronavirus-19-api.herokuapp.com/countries';
  static const String allstates = 'https://harneet1s.github.io/data/1.json';


}

abstract class SharedPreferencesKeys {
  static const String isDarkTheme = 'isDarkTheme';
}