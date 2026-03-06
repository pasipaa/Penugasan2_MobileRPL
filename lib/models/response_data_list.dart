class ResponseDataList<T> {
  final bool status;
  final String message;
  final List<T> data;

  ResponseDataList({
    required this.status,
    required this.message,
    required this.data,
  });
}
