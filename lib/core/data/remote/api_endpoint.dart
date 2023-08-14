class ApiEndpoints {
  static String baseUrl = "https://matchmaker-83ag.onrender.com/api/";
  static _AuthEndpoints authEndpoints = _AuthEndpoints();
}

class _AuthEndpoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
}
