import 'package:animebox/core/servers/domain/entities/server.dart';

extension ServerUrls on Server {
  String infoUrl() => "$url$infoEndpoint";
  String apiUrl() => "$url$api";
}
