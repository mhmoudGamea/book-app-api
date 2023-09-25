// ignore_for_file: public_member_api_docs

abstract class Success {
  Success(this.successMessage);

  final String successMessage;
}

class ServerSuccess extends Success {
  ServerSuccess(super.successMessage);
}
