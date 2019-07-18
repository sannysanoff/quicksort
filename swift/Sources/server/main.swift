import CoreFoundation
import XCTest

struct Point : Comparable {
    let x: Double;
    let y: Double;
    static func <(x: Point,  y: Point) -> Bool {
        return x.x > y.x || (x.x == y.x && x.y > y.y);
    }
}

func partition<T : Comparable>(p: inout [T], low: Int, high: Int) -> Int {
    let pivot = p[high];
    // pivot
    var i = (low - 1);
    // Index of smaller element

    for j in low ... high - 1    {
        // If current element is smaller than or
        // equal to pivot
        if (!(p[j] > pivot)) {
            i+=1;
            // increment index of smaller element
            p.swapAt(i, j);
        }
    }
    p.swapAt(i + 1, high);
    return (i + 1);
}


func quickSort<T : Comparable>(p: inout [T], low: Int, high: Int) -> Void {
    if (low < high)
    {
        /* pi is partitioning index, arr[p] is now
           at right place */
        let pi = partition(p:&p, low:low, high:high);

        // Separately sort elements before
        // partition and after partition
        quickSort(p:&p, low:low, high:pi - 1);
        quickSort(p:&p, low:pi + 1, high:high);
    }
}

func x() -> Void {

    let N = 50000000;
    var points: [Point] = [];
    points.reserveCapacity(N);
    //print("\(DEPLOYMENT_RUNTIME_SWIFT)");
    do {
        let t1 = CFAbsoluteTimeGetCurrent();
        //let q = CFDataCreate;
        for _ in 0...N-1 {
            points.append(Point(x: Double.random(in: 0...1), y: Double.random(in: 0...1)));
        }
        let t2 = CFAbsoluteTimeGetCurrent();
        print("Generated array, sec :\(t2 - t1)");
    }
    do {
        let t1 = CFAbsoluteTimeGetCurrent();
        quickSort(p: &points, low: 0, high: points.count - 1);
        let t2 = CFAbsoluteTimeGetCurrent();
        print("Sorted array, sec :\(t2 - t1)");

    }

}

x();

