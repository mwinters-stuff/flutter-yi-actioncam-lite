
class YICameraSDKError
{
  int _code;
  YICameraSDKError _subError;
  String _detail;

  int get code => _code;
  YICameraSDKError get subError => _subError;
  String get detail => _detail;

  YICameraSDKError(int code, {YICameraSDKError subError, String detail}){
    _code = code;
    _subError = subError;
    _detail = detail;
  }

}
