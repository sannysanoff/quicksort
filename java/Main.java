import java.awt.geom.Point2D;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

class MyPoint {
    double x;
    double y;

    public MyPoint(double x, double y) {
        this.x = x;
        this.y = y;
    }
}

public class Main {

    static Comparator<MyPoint> myPointComparator = (MyPoint o1, MyPoint o2) -> {
        if (o1.x == o2.x) {
            return Double.compare(o1.y, o2.y);
        } else {
            return o1.x > o2.x ? 1 : -1;
        }
    };

    final static boolean comp(MyPoint o1, MyPoint o2) {
        return o1.x < o2.x || o1.x == o2.x && o1.y < o2.y;
    };

    static int partition (MyPoint arr[], int low,  int high)
    {
        MyPoint pivot = arr[high];    // pivot
        int i = low;  // Index of smaller element

        for (int j = low; j < high; j++)
        {
            // If current element is smaller than or
            // equal to pivot
            if (comp(arr[j], pivot))
            {
                MyPoint q = arr[i];
                arr[i] = arr[j];
                arr[j] = q;
                i++;    // increment index of smaller element
            }
        }
        MyPoint q = arr[i];
        arr[i] = arr[high];
        arr[high] = q;
        return i;
    }

    static void quickSort(MyPoint[] arr, int low, int high) {
        if (low < high) {
            int pi = partition(arr, low, high);

            // Separately sort elements before
            // partition and after partition
            quickSort(arr, low, pi - 1);
            quickSort(arr, pi + 1, high);
        }
    }


    public static void main(String[] args) {
        for(int q=0; q<1000; q++) {
            System.out.println("Gen...");
            ArrayList<MyPoint> doubles = new ArrayList<>();
            ArrayList<MyPoint> nax = new ArrayList<>();
            for (int i = 0; i < 50000000; i++) {
                doubles.add(new MyPoint((double)Math.random(), (double)Math.random()));
            }
            System.out.println("Sort...");
            MyPoint[] arr = doubles.toArray(new MyPoint[doubles.size()]);
            long l1 = System.currentTimeMillis();
//            doubles.sort(Main::comp);
            quickSort(arr, 0, arr.length-1);
            long l2 = System.currentTimeMillis();
            System.out.println("Time:"+(l2-l1)+" millis");

        }
    }
}
