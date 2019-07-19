#include <iostream>
#include <chrono>
#include <cstdlib>
#include <vector>
#include <algorithm>

using namespace std;

    struct P  {
        double x, y;
    };

    bool operator <(const P&x, const P&y) {
        return x.x < y.x || (x.x == y.x && x.y < y.y);
    }
    long long partition (P arr[], long long low, long long high)
    {
        P pivot = arr[high];    // pivot
        long long i = low;  // Index of smaller element

        for (long long j = low; j <= high- 1; j++)
        {
            // If current element is smaller than or
            // equal to pivot
            if (arr[j] < pivot)
            {
                std::swap(arr[i], arr[j]);
                i++;    // increment index of smaller element
            }
        }
        std::swap(arr[i], arr[high]);
        return (i);
    }

/* The main function that implements QuickSort
 arr[] --> Array to be sorted,
  low  --> Starting index,
  high  --> Ending index */
    void quickSort(P *arr, long long low, long long high)
    {
        if (low < high)
        {
            /* pi is partitioning index, arr[p] is now
               at right place */
            long long pi = partition(arr, low, high);

            // Separately sort elements before
            // partition and after partition
            quickSort(arr, low, pi - 1);
            quickSort(arr, pi + 1, high);
        }
    }

    void test() {
        const int N = 50000000;
        vector<P> a(N);

        for (int i = 0; i < N; i++) {
            a[i] = P { (double)rand()/RAND_MAX, (double)rand()/RAND_MAX };
        }
        chrono::steady_clock::time_point begin = chrono::steady_clock::now();
        quickSort(a.data(), 0, a.size()-1);

        chrono::steady_clock::time_point end = chrono::steady_clock::now();
        cout << "Elapsed: " << chrono::duration_cast<chrono::milliseconds>(end - begin).count() << endl;


    }


int main()
{
	test();
//    return 0;
}
