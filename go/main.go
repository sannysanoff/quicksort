package main

import (
	"log"
	"math/rand"
	"time"
)

type P struct {
	x float64
	y float64
}

func comp(a *P, b *P) bool {
	return a.x < b.x || a.x == b.x && a.y < b.y
}

func partition(arr []P) int {
	high := len(arr)-1
	pivot := &arr[high]
	i := 0
	for j := 0; j< high;j++ {
		if comp(&arr[j], pivot) {
			arr[i], arr[j] = arr[j], arr[i]
			i++
		}
	}
	arr[i], *pivot = *pivot, arr[i]
	return i
}

func quickSort(arr []P)  {
	if len(arr) > 1 {
		pi := partition(arr)
		//log.Printf("pi=%d", pi)
		quickSort(arr[:pi])
		quickSort(arr[pi+1:])
	}

}


func main() {
	for z := 0; z<10; z++ {
	arr := []P{}
	N := 50000000
	println("gen...")
	for i := 0; i<N ;i++ {
		arr = append(arr, P{x : rand.Float64(), y : rand.Float64()})
	}
	println("sort...")
	start := time.Now()
	quickSort(arr)
	elapsed := time.Since(start)
	log.Printf("Quicksort took %s", elapsed)
	}

}

