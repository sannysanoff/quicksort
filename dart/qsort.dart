import 'dart:math';

class MyPoint {
  double x;
  double y;

  MyPoint(this.x, this.y) {}

}

class Worker {

  static bool compare (MyPoint o1, MyPoint o2) {
    if (o1.x == o2.x) {
      return o1.y > o2.y;
    } else {
      return o1.x > o2.x;
    }
  }


  static int partition(List<MyPoint> arr, int low, int high) {
    MyPoint pivot = arr[high]; // pivot
    int i = low; // Index of smaller element

    for (int j = low; j < high; j++) {
      // If current element is smaller than or
      // equal to pivot
      if (compare(arr[j], pivot)) {
        MyPoint q = arr[i];
        arr[i] = arr[j];
        arr[j] = q;
        i++; // increment index of smaller element
      }
    }
    MyPoint q = arr[i];
    arr[i] = arr[high];
    arr[high] = q;
    return i;
  }

  void quickSort(List<MyPoint> arr, int low, int high) {
    if (low < high) {
      int pi = partition(arr, low, high);

      // Separately sort elements before
      // partition and after partition
      quickSort(arr, low, pi - 1);
      quickSort(arr, pi + 1, high);
    }
  }

}

void main() {
  var w = Worker();
  for (int q = 0; q < 1000; q++) {
    var rng = new Random();
    List<MyPoint> doubles = List<MyPoint>();
    int limit = (q+1) * 1000000;
    print("Generate $limit points...");
    for (int i = 0; i < limit; i++) {
      doubles.add(new MyPoint(rng.nextDouble(), rng.nextDouble()));
    }
    print("Sort $limit points...");
    Stopwatch stopwatch = new Stopwatch()
      ..start();
    w.quickSort(doubles, 0, doubles.length - 1);
    print("Time: ${stopwatch.elapsedMilliseconds} millis");
  }
}
