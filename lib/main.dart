import 'package:beer_app/bootstrap.dart';

void main() {
  Config.init(
    apiUrl: 'https://api.punkapi.com/v2/',
  );
  bootstrap();
}
