/// Immutable data model for a Category with centralized colors and icons.
class Category {
  final String id;
  final String name;
  final int color;
  final String icon;
  final String emoji;

  const Category({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
    required this.emoji,
  });

  Category copyWith({
    String? id,
    String? name,
    int? color,
    String? icon,
    String? emoji,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      emoji: emoji ?? this.emoji,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'icon': icon,
      'emoji': emoji,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as int,
      icon: json['icon'] as String,
      emoji: json['emoji'] as String,
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, color: $color, icon: $icon, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.color == color &&
        other.icon == icon &&
        other.emoji == emoji;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        color.hashCode ^
        icon.hashCode ^
        emoji.hashCode;
  }
}

/// Predefined category constants for the app.
class Categories {
  static const Category food = Category(
    id: 'food',
    name: 'Food',
    color: 0xFF4361EE,
    icon: 'restaurant',
    emoji: '🍔',
  );

  static const Category transport = Category(
    id: 'transport',
    name: 'Transport',
    color: 0xFFF4A261,
    icon: 'directions_car',
    emoji: '🚗',
  );

  static const Category bills = Category(
    id: 'bills',
    name: 'Bills',
    color: 0xFF9C27B0,
    icon: 'receipt_long',
    emoji: '📄',
  );

  static const Category shopping = Category(
    id: 'shopping',
    name: 'Shopping',
    color: 0xFFE91E63,
    icon: 'shopping_bag',
    emoji: '🛍️',
  );

  static const Category health = Category(
    id: 'health',
    name: 'Health',
    color: 0xFF00BCD4,
    icon: 'local_hospital',
    emoji: '🏥',
  );

  static const Category entertainment = Category(
    id: 'entertainment',
    name: 'Entertainment',
    color: 0xFFE040FB,
    icon: 'casino',
    emoji: '🎮',
  );

  static const Category others = Category(
    id: 'others',
    name: 'Others',
    color: 0xFF009688,
    icon: 'work',
    emoji: '📦',
  );

  static List<Category> getAll() {
    return [
      food,
      transport,
      bills,
      shopping,
      health,
      entertainment,
      others,
    ];
  }

  static Category? getById(String id) {
    return getAll().firstWhere(
      (category) => category.id == id,
      orElse: () => others,
    );
  }
}
