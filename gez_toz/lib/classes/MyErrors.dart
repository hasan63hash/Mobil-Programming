
class MyErrors{
  static final int ERROR = 1;
  static final int MISSING_VAR = 2;
  static final int INVALID_VAR = 3;
  static final int EMAIL_USED = 4;
  static final int COULDNT_CREATE_USER = 5;
  static final int DATABASE_ERROR = 6;
  static final int TIMED_OUT = 7;
  static final int NO_SUCH_USER = 8;
  static final int WRONG_LOGIN = 9;

  static Map<int, String> errors = {
    ERROR: "Hata oluştuş",
    MISSING_VAR: "Eksik bilgi girdiniz.",
    INVALID_VAR: "Geçersiz bilgi girdiniz.",
    EMAIL_USED: "Bu email kullanılıyor.",
    COULDNT_CREATE_USER: "Kullanıcı oluşturulamadı.",
    DATABASE_ERROR: "Veritabanı hatası oluştu.",
    TIMED_OUT: "Zaman aşımına uğradı.",
    NO_SUCH_USER: "Böyle bir kullanıcı yok.",
    WRONG_LOGIN: "Hatalı email veya şifre.",
  };
}