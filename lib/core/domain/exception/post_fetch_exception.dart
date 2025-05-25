class PostFetchException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  PostFetchException({required this.message, this.statusCode, this.details});

  @override
  String toString() =>
      'PostFetchException: $message (statusCode: $statusCode, details: $details)';
}
