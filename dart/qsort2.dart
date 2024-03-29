import 'dart:math';
import 'dart:core';
import 'dart:typed_data';

class MyPoint {
  double x;
  double y;

  MyPoint(this.x, this.y) {}
}

class Worker {
  static bool compare(double o1x, double o1y, double o2x, double o2y) {
    if (o1x == o2x) {
      return o1y > o2y;
    } else {
      return o1x > o2x;
    }
  }

  static int partition(Float64List xs, Float64List ys, int low, int high) {
    final px = xs[high]; // pivot
    final py = ys[high]; // pivot
    var i = low; // Index of smaller element

    for (int j = low; j < high; j++) {
      // If current element is smaller than or
      // equal to pivot
      if (compare(xs[j], ys[j], px, py)) {
        final q = xs[i];
        final p = ys[i];
        xs[i] = xs[j];
        ys[i] = ys[j];
        xs[j] = q;
        ys[j] = p;
        i++; // increment index of smaller element
      }
    }
    final q = xs[i];
    xs[i] = xs[high];
    xs[high] = q;
    final p = ys[i];
    ys[i] = ys[high];
    ys[high] = p;
    return i;
  }

  void quickSort(Float64List xs, Float64List ys, int low, int high) {
    if (low < high) {
      int pi = partition(xs, ys, low, high);

      // Separately sort elements before
      // partition and after partition
      quickSort(xs, ys, low, pi - 1);
      quickSort(xs, ys, pi + 1, high);
    }
  }
}

void main() {
  var w = Worker();
  for (int q = 49; q < 1000; q++) {
    var rng = new Random();
    //int limit = (q + 1) * 1000000;
    int limit = 50000000; // (q + 1) * 1000000;
    print("Generate $limit points...");
    Float64List xs = Float64List(limit);
    Float64List ys = Float64List(limit);
    for(int z=0; z<limit; z++) {
      xs[z] = rng.nextDouble();
      ys[z] = rng.nextDouble();
    }
    print("Sort $limit points...");
    Stopwatch stopwatch = new Stopwatch()..start();
    w.quickSort(xs, ys, 0, xs.length - 1);
    print("Time: ${stopwatch.elapsedMilliseconds} millis");
  }
}
