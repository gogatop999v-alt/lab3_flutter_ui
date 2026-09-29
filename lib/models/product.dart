class Product {
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String price;
  final String imageUrl;

  const Product({
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.price,
    required this.imageUrl,
  });
}

const List<Product> kProducts = [
  Product(
    name: 'Смартфон',
    shortDescription: 'Современный смартфон с отличной камерой.',
    fullDescription:
        'Смартфон с OLED-дисплеем 6,5", тройной камерой 50 Мп, 8 ГБ оперативной '
        'памяти и аккумулятором на 5000 мА·ч. Поддерживает быструю зарядку и 5G.',
    price: '59 990 ₽',
    imageUrl: 'https://picsum.photos/seed/smartphone/800/450',
  ),
  Product(
    name: 'Ноутбук',
    shortDescription: 'Лёгкий ноутбук для учёбы и работы.',
    fullDescription:
        'Ноутбук с 15,6" IPS-экраном, процессором на 8 ядер, 16 ГБ памяти и '
        'SSD на 512 ГБ. Вес - всего 1,6 кг, автономность до 12 часов.',
    price: '84 990 ₽',
    imageUrl: 'https://picsum.photos/seed/laptop/800/450',
  ),
  Product(
    name: 'Наушники',
    shortDescription: 'Беспроводные наушники с шумоподавлением.',
    fullDescription:
        'Полноразмерные Bluetooth-наушники с активным шумоподавлением, '
        'до 30 часов работы без подзарядки и встроенным микрофоном.',
    price: '12 490 ₽',
    imageUrl: 'https://picsum.photos/seed/headphones/800/450',
  ),
  Product(
    name: 'Умные часы',
    shortDescription: 'Часы с пульсометром и GPS.',
    fullDescription:
        'Умные часы с AMOLED-экраном, GPS, пульсометром, датчиком кислорода '
        'в крови и защитой от воды 5 ATM. Работают до 7 дней.',
    price: '15 990 ₽',
    imageUrl: 'https://picsum.photos/seed/smartwatch/800/450',
  ),
];
