
class Account{

  int id;
  String username, email, imageUrl,
      about, registerDate, passwordChangeDate;

  Account({
    required this.id, required this.username, required this.email,
    required this.imageUrl, required this.about,
    required this.registerDate, required this.passwordChangeDate,
  });
}