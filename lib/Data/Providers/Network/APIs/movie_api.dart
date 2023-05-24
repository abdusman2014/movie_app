class MovieApi {
  Future<Map<dynamic, dynamic>> fetchGenre() async {
    await Future.delayed(const Duration(seconds: 1));
    return {"fetch": "fetched"};
  }
}
