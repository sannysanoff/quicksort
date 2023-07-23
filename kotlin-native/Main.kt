
import kotlin.random.Random
import kotlin.system.measureTimeMillis



data class P(var x: Double, var y: Double)

operator fun P.compareTo(other: P): Int {
    return when {
        x < other.x -> -1
        x > other.x -> 1
        y < other.y -> -1
        y > other.y -> 1
        else -> 0
    }
}

fun swap(arr: Array<P>, i: Int, j: Int) {
    val temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
}

fun partition(arr: Array<P>, low: Int, high: Int): Int {
    val pivot = arr[high]
    var i = low

    for (j in low until high) {
        if (arr[j] < pivot) {
            swap(arr, i, j)
            i++
        }
    }
    swap(arr, i, high)
    return i
}

fun quickSort(arr: Array<P>, low: Int, high: Int) {
    if (low < high) {
        val pi = partition(arr, low, high)

        quickSort(arr, low, pi - 1)
        quickSort(arr, pi + 1, high)
    }
}

fun test(N: Int) {
    println("Started..")
    val a = Array(N) { P(Random.nextDouble(), Random.nextDouble()) }

    println("Sorting..")
    val elapsedTime = measureTimeMillis {
        quickSort(a, 0, a.lastIndex)
    }

    println("Elapsed: $elapsedTime ms")
}



fun main() {
    test(50000000)
}
