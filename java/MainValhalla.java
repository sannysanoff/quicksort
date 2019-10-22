import java.awt.geom.Point2D;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

inline class MyPoint {
    double x;
    double y;

    public MyPoint(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public boolean lessThan(MyPoint o) {
        if (this.x == o.x) {
            return this.y < o.y;
        } else {
            return this.x < o.x;
        }
    };
}

public class MainValhalla {

    static int partition (MyPoint arr[], int low,  int high)
    {
        MyPoint pivot = arr[high];    // pivot
        int i = low;  // Index of smaller element

        for (int j = low; j < high; j++)
        {
            // If current element is smaller than or
            // equal to pivot
            if (arr[j].lessThan(pivot))
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
            MyPoint[] nax = new MyPoint[50000000];
            for (int i = 0; i < 50000000; i++) {
		nax[i] = new MyPoint(Math.random(),Math.random());
            }
            System.out.println("Sort...");
            long l1 = System.currentTimeMillis();
//            doubles.sort(Main::comp);
            quickSort(nax, 0, nax.length-1);
            long l2 = System.currentTimeMillis();
            System.out.println("Time:"+(l2-l1)+" millis");

        }
    }
}
