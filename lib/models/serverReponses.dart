class AuthResponse{
  bool status;
  String apiToken;
  String msg;

  AuthResponse(this.status,this.apiToken);
  AuthResponse.failed(this.status,this.msg);
}