// ignore_for_file: file_names

class IslamicDate {
  final String hijriDate;
  final String gregorianDate;

  IslamicDate({required this.hijriDate, required this.gregorianDate});

  factory IslamicDate.fromJson(Map<String, dynamic> json) {
    return IslamicDate(
      hijriDate: json['hijri']['date'],
      gregorianDate: json['gregorian']['date'],
    );
  }
}
