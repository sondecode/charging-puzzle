class Customer {
  final int id;
  final String avatar;

  final String name;

  const Customer({
    this.name = "VF1",
    required this.id,
    required this.avatar,
  });
}

const customerList = [
  Customer(id: 1, name: "Vu Cong Vinh", avatar: "vinh.png"),
  Customer(id: 2, name: "Nguyen Son", avatar: "son.png"),
  Customer(id: 3, name: "Minh Duc", avatar: "duc.png"),
];
