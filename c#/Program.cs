using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace ConsoleApp1 {
    public struct MyPoint {
        public double x;
        public double y;

        public MyPoint(double x, double y) {
            this.x = x;
            this.y = y;
        }
    }


    class Program {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        static bool Comp(MyPoint o1, MyPoint o2) {
            return o1.x < o2.x || o1.x == o2.x && o1.y < o2.y;
        }

        static long Partition(MyPoint[] arr, long low, long high) {
            var pivot = arr[high]; // pivot
            var i = low; // Index of smaller element

            MyPoint q;
            for (var j = low; j < high; j++) {
                // If current element is smaller than or
                // equal to pivot
                if (Comp(arr[j], pivot)) {
                    q = arr[j];
                    arr[i] = arr[j];
                    arr[j] = q;
                    i++; // increment index of smaller element
                }
            }

            q = arr[i];
            arr[i] = arr[high];
            arr[high] = q;
            return i;
        }

        static unsafe long PartitionN(MyPoint* arr, long low, long high) {
            var pivot = arr[high]; // pivot
            var i = low; // Index of smaller element

            MyPoint q;
            for (var j = low; j < high; j++) {
                // If current element is smaller than or
                // equal to pivot
                if (Comp(arr[j], pivot)) {
                    q = arr[j];
                    arr[i] = arr[j];
                    arr[j] = q;
                    i++; // increment index of smaller element
                }
            }

            q = arr[i];
            arr[i] = arr[high];
            arr[high] = q;
            return i;
        }

        static void QuickSort(MyPoint[] arr, long low, long high) {
            if (low >= high) return;
            var pi = Partition(arr, low, high);

            // Separately sort elements before
            // partition and after partition
            QuickSort(arr, low, pi - 1);
            QuickSort(arr, pi + 1, high);
        }

        unsafe static void QuickSortN(MyPoint* arr, long low, long high) {
            if (low >= high) return;
            var pi = PartitionN(arr, low, high);

            // Separately sort elements before
            // partition and after partition
            QuickSortN(arr, low, pi - 1);
            QuickSortN(arr, pi + 1, high);
        }

        static void Test(int e, int N) {
            Random random = new Random();
            Console.WriteLine("Started!");
            MyPoint[] arr = new MyPoint[N];
            for (int i = 0; i < N; i++) {
                arr[i] = new MyPoint(random.NextDouble(), random.NextDouble());
            }

            if (e%2 == 1) {
		Console.WriteLine("sort unsafe..");
	    } else {
		Console.WriteLine("sort safe..");
	    }
            Stopwatch sw = new Stopwatch();
            sw.Start();
            if (e%2 == 1) {
                unsafe {
                    fixed (MyPoint* arrP = arr) {
                        QuickSortN(arrP, 0, arr.Length - 1);
                    }
                }
            }
            else {
                QuickSort(arr, 0, arr.Length - 1);
            }

            sw.Stop();
            Console.WriteLine("Elapsed={0}", sw.Elapsed);
        }

        static void Main(string[] args) {
//            for(int i=0; i<20; i++) Test(500000);
//            for(int i=0; i<20; i++) Test(5000000);
            for (int i = 0; i < 20; i++) Test(i, 50000000);
        }
    }
}
