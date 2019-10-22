import std.stdio;
import core.time;
import std.datetime;
//import std.datetime.stopwatch;
import std.random;
import std.algorithm.sorting;
import std.algorithm.mutation;

struct P { double a; double b; }
bool myComp (ref P x, ref P y) { return  x.a > y.a || x.a == y.a && x.b > y.b; }


long partition (P[] arr, long low, long high)
{
    P pivot = arr[high];    // pivot
    auto i = (low - 1);  // Index of smaller element

    for (auto j = low; j <= high- 1; j++)
    {
        // If current element is smaller than or
        // equal to pivot
        if (!myComp(arr[j], pivot))
        {
            i++;    // increment index of smaller element
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return (i + 1);
}

void quickSort(P[] arr, long low, long high) {
    if (low < high)
    {
        /* pi is partitioning index, arr[p] is now
           at right place */
        long pi = partition(arr, low, high);

        // Separately sort elements before
        // partition and after partition
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

void main() {
    for(int z=0; z<10; z++) {
    P[] arr;
    auto rnd = Random(1000);
    writeln("generating..."); stdout.flush();
    auto n = 50_000_000;
    for(int q=0; q<n; q++) {
        arr ~= P(uniform(0.0f, 1.0f, rnd), uniform(0.0f, 1.0f, rnd));
    }
   // auto sw = StopWatch(AutoStart.no);
    writeln("sorting..."); stdout.flush();
    //sw.start();
//    auto q = arr.sort!(myComp);
    auto stattime = Clock.currTime();
    quickSort(arr, 0, arr.length-1);
    auto endttime = Clock.currTime();
    auto duration = endttime - stattime;
    //sw.stop();
    writeln("==> ", duration);
   }

    //writeln(sw.peek.total!"msecs");
}
