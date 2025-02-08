abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

class RemoteException extends AppException {
  RemoteException(super.message);
}

class LocalException extends AppException {
  LocalException(super.message);
}
