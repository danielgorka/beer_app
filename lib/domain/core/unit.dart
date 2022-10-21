enum Unit {
  litres('l'),
  millilitres('ml'),
  kilograms('kg'),
  grams('g'),
  celsius('°C'),
  total('');

  const Unit(this.name);

  final String name;
}
