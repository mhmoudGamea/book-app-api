// ignore_for_file: public_member_api_docs

class Failure implements Exception {
  Failure(this.failMessage);

  final String failMessage;
}

class ServerError extends Failure {
  ServerError(super.failMessage);
}
