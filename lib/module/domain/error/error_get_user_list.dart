abstract class FailureGetUserList implements Exception {
  final String? message;
  final int? statusCode;
  final String? statusMessage;

  const FailureGetUserList({
    this.message,
    this.statusCode,
    this.statusMessage,
  });
}

class InvalidGetUserListDataError implements FailureGetUserList {
  @override
  final String? message;
  @override
  final int? statusCode;
  @override
  final String? statusMessage;

  const InvalidGetUserListDataError({
    this.message,
    this.statusCode,
    this.statusMessage,
  });
}

class GetUserListRemoteError implements FailureGetUserList {
  @override
  final String? message;
  @override
  final int? statusCode;
  @override
  final String? statusMessage;

  const GetUserListRemoteError({
    this.message,
    this.statusCode,
    this.statusMessage,
  });
}
