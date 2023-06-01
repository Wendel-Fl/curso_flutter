void main(List<String> args) {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  List<int> oddNumbers = numbers.where((element) => element.isOdd).toList();
  print(oddNumbers);
}
