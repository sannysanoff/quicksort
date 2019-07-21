using System;
using System.Diagnostics;

using System.Globalization;
using System.Runtime;
using System.Text;

namespace ConsoleApp1
{
    
    public struct MyPoint
    {
        public double x;
        public double y; 

        public MyPoint(double x, double y)
        {
            this.x = x;
            this.y = y;
        }
    }


    class Program
    {
        static bool Comp(MyPoint o1, MyPoint o2) {
            return o1.x < o2.x || o1.x == o2.x && o1.y < o2.y;
        }
        
        static int Partition (MyPoint[] arr, int low,  int high)
        {
            var pivot = arr[high];    // pivot
            var i = low;  // Index of smaller element

            MyPoint q;
            for (var j = low; j < high; j++)
            {
                // If current element is smaller than or
                // equal to pivot
                q = arr[j];
                if (Comp(q, pivot))
                {
                    arr[i] = arr[j];
                    arr[j] = q;
                    i++;    // increment index of smaller element
                }
            }
            q = arr[i];
            arr[i] = arr[high];
            arr[high] = q;
            return i;
        }

        static void QuickSort(MyPoint[] arr, int low, int high) {
            if (low >= high) return;
            var pi = Partition(arr, low, high);

            // Separately sort elements before
            // partition and after partition
            QuickSort(arr, low, pi - 1);
            QuickSort(arr, pi + 1, high);
        }


        static void Test(int N)
        {
            Random random = new Random();  
            Console.WriteLine("Started with N=!"+N);
            MyPoint[] arr = new MyPoint[N];
            for (int i = 0; i < N; i++)
            {
                arr[i] = new MyPoint(random.NextDouble(), random.NextDouble());
            }
            Stopwatch sw = new Stopwatch();
            sw.Start();
            QuickSort(arr, 0, arr.Length - 1);
            sw.Stop();
            Console.WriteLine("Elapsed={0}",sw.Elapsed);
        }
        
        static void Main(string[] args)
        {
            for(int i=0; i<20; i++) Test(500000);
            for(int i=0; i<20; i++) Test(5000000);
            for(int i=0; i<20; i++) Test(50000000);
        }
    }
}
