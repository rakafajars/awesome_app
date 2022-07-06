import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConncted;
}

class NetworkInfoImpl extends NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConncted => connectionChecker.hasConnection;
}