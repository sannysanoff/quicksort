
struct P
    x::Float64
    y::Float64
end

@inline function isless(a, b)
    return a.x < b.x || a.x == b.x && a.y < b.y
end


function partition(arr, low, high)
    pivot = arr[high]
    i = low
    for j = low:high-1
        @inbounds if isless(arr[j], pivot)
            arr[i],arr[j] = arr[j],arr[i]
            i = i+1
        end
    end
    arr[i],arr[high] = arr[high], arr[i]
    return i
end

function quicksort(v, low, high)
    if (low < high)
        pi = partition(v, low, high)
        quicksort(v, low, pi-1)
        quicksort(v, pi+1, high)
    end
end;

function test()

    #v = Vector{P}(undef, 0)
    v = Array{P,1}(undef, 50000000)
    for q = 1:50000000
        z = rand(Int, 2)
        v[q] = P(z[1], z[2])
     #   push!(v,P(z[1], z[2]))
    end
#    println(@elapsed sort!(v, lt = isless, rev = true))
    println(size(v, 1))
    println(@elapsed quicksort(v, 1, size(v, 1)))
end

for zz = 1:10 test() end
