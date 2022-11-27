class ServerConfig {
  final String host;
  final int port;
  String get authority => '$host:$port';
  ServerConfig({required this.host, required this.port});
}
