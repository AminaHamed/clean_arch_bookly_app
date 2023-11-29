import 'package:dartz/dartz.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class DetailsRemoteDataSource {
  Future<Unit> launchBookUrl(String url);
}

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  @override
  Future<Unit> launchBookUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
    return unit;
  }
}
