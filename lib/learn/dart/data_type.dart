import 'dart:ffi';

void main() {
  _map_type();
}

_num_type() {
  num num1 = -1.0;

  print("num#1: $num1");
  print(num1.abs());
  print(num1.runtimeType);
}

_str_type() {
  String s = "Hello, World";
  print(s.substring(0, 5));

  List<String> ss = s.split(",");

  print(ss[0]);
  print(ss[1].trim());

  ss.add("!");
  print(ss.length);

  List<int> sss = List.generate(3, (i) => i * 2);
  print(sss);

}


_list_type() {
  List<String> list = ["a", "b"];
  list.add("c");
  list.remove("d");
  list.removeAt(1);
  print('list#1: $list');

  for (var i = 0; i < list.length; i++) {
    print('list_item#:${i} ${list[i]}');
  }

  List<int> iList = List.generate(10, (i) => i * 2);
  iList.forEach((i) => print('iList_item#: $i'));
}

_map_type() {
  Map<String, String> map = {
    "name": "John",
    "age": "20"
  };

  map["gender"] = "male";

  for (var e in map.entries) {
    print('Map_entry#: ${e.key} ${e.value}');
  }
}