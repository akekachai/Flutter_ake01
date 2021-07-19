class Member {
  final String no;
  final String names;
  final String password;
  final String referance;

  Member({
    required this.no,
    required this.names,
    required this.password,
    required this.referance,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        no: json['#'],
        names: json['names'],
        password: json['password'],
        referance: json['referance']);
  }

  @override
  String toString() {
    return '{ ${this.no},${this.names}, ${this.password} , ${this.referance}}';
  }
}

class Transaction {
  final int limit;
  final int offset;
  final bool order;
  final int nitems;
  List itemsj = [];

  Transaction({
    required this.limit,
    required this.offset,
    required this.order,
    required this.nitems,
    required this.itemsj,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        limit: json['limit'],
        offset: json['offset'],
        order: json['order'],
        nitems: json['nitems'],
        itemsj: json['items']);
  }
}
