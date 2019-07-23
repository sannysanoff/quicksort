import java.util.ArrayList;
import java.util.Comparator;

public class MainNonCanonical {

    static final int partition(double arr[], int low, int high) {
        double p1 = arr[2*(int)high];    // pivot
        double p2 = arr[2*(int)high+1];    // pivot
        int i = low;  // Index of smaller element

        for (int j = low; j < high; j++) {
            int ix = 2*j;
            if (arr[ix] < p1 || arr[ix] == p1 && arr[ix + 1] < p2) {
                double t = arr[2*i];
                arr[2*i] = arr[2*j];
                arr[2*j] = t;
                double tt = arr[2*i+1];
                arr[2*i+1] = arr[2*j+1];
                arr[2*j+1] = tt;
                i++;    // increment index of smaller element
            }
        }
        double t = arr[2*i];
        arr[2*i] = arr[2*high];
        arr[2*high] = t;
        double tt = arr[2*i+1];
        arr[2*i+1] = arr[2*high+1];
        arr[2*high+1] = tt;
        return i;
    }

    static final void quickSort(double[] arr, int low, int high) {
        if (low < high) {
            int pi = partition(arr, low, high);

            // Separately sort elements before
            // partition and after partition
            quickSort(arr, low, pi - 1);
            quickSort(arr, pi + 1, high);
        }
    }


    public static void main(String[] args) {
        for (int q = 0; q < 1000; q++) {
            System.out.println("Gen...");
            int n = 50000000;
            double[] arr = new double[2*n];
            for (int i = 0; i < 2*n; i++) {
                arr[i] = Math.random();
            }
            System.out.println("Sort...");
            long l1 = System.currentTimeMillis();
//            doubles.sort(Main::comp);
            quickSort(arr, 0, (arr.length/2) - 1);
            long l2 = System.currentTimeMillis();
            System.out.println("Time:" + (l2 - l1) + " millis");

        }
    }
}
