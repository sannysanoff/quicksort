extern crate rand;
use std::time::Instant;
use rand::prelude::*;

#[derive(Copy, Clone)]
struct Point {
    x: f64,
    y: f64,
}

const N : usize = 50000000;


fn quick_sort<T,F>(v: &mut [T], f: &F)
    where F: Fn(&T,&T) -> bool
{
    let len = v.len();
    if len >= 2 {
        let pivot_index = partition(v, f);
        quick_sort(&mut v[0..pivot_index], f);
        quick_sort(&mut v[pivot_index + 1..len], f);
    }
}

fn compare(a: &Point, b: &Point) -> bool
{
    return a.x > b.x || a.x == b.x && a.y > b.y;
}
fn partition<T,F>(v: &mut [T], f: &F) -> usize
    where F: Fn(&T,&T) -> bool
{
    let len = v.len();
    let pivot_index = len - 1;
    let last_index = len - 1;

    // v.swap(pivot_index, last_index);

    let mut store_index = 0;
    for i in 0..last_index {
        if f(&v[i], &v[last_index]) {
            v.swap(i, store_index);
            store_index += 1;
        }
    }

    v.swap(store_index, pivot_index);
    store_index
}
// TEST
fn main() {
    println!("begin!");
    for q in 0..10 {
    let values = vec![Point{x:0.0,y:0.0}; N];
    let mut arr = values.into_boxed_slice();
    //let mut arr : [Point; N] = [Point{x:0.0,y:0.0};N];
    let mut rng = rand::thread_rng();
    for n in 0..N {
        arr[n] = Point{x:rng.gen(), y:rng.gen()};
    }
    println!("sort {}!",N);
    let now = Instant::now();
    quick_sort(&mut arr[0..N], &compare);
    println!("sorted! time={}", now.elapsed().as_millis());
    }

}
