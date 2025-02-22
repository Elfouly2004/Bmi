class FirstPageState {
  final bool male;
  final double height;
  final int weight;
  final int age;

  FirstPageState({
    required this.male,
    required this.height,
    required this.weight,
    required this.age,
  });

  factory FirstPageState.initial() {
    return FirstPageState(male: true, height: 0, weight: 78, age: 19);
  }

  FirstPageState copyWith({
    bool? male,
    double? height,
    int? weight,
    int? age,
  }) {
    return FirstPageState(
      male: male ?? this.male,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}
