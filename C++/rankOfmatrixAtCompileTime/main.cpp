/*
 *  Here, static is used to make the elements inside the struct accessible at class level and not at
 *  an instance level. This helps in accessing the elements inside the struct without creating its object
 *  or an instance.
 *  The constexpr is used to make sure that the value is constant during compile time.
 */

// Necessary header for static assertions
#include <cassert>
#include <cstddef> // header for size_t 

// Primary template for Rank: default value is 0, for non-array types
template <typename T>
struct Rank {
    static constexpr size_t value = 0;
};

// Partial specialization for unbounded arrays (e.g., float[])
// Increases rank by 1 for each array dimension
template <typename T>
struct Rank<T[]> {
     static constexpr size_t value = 1 + Rank<T>::value;   
};

// Partial specialization for bounded arrays (e.g., int[3])
// Increases rank by 1 for each array dimension
template <typename T, size_t N>
struct Rank<T[N]> {
     static constexpr size_t value = 1 + Rank<T>::value;   
};

int main() {
    // Rank of a non-array type is 0
    static_assert(Rank<int>::value == 0);

    // Rank of a single dimension array type is 1
    static_assert(Rank<float[]>::value == 1);

    // Rank of a two-dimensional array of pointer to char is 2
    static_assert(Rank<char*[2][3]>::value == 2);
    
    // For a scalar variable, rank is also 0
    constexpr int x{};
    static_assert(Rank<decltype(x)>::value == 0);
    
    // Define a 2x2 array of int
    constexpr int a[2][2] = {
        {2, 3},
        {4, 5}
    };

    // Rank of a 2D array is 2
    static_assert(Rank<decltype(a)>::value == 2);

    // Rank of a 3D matrix is 3 
    constexpr int b[3][3][3] = {
        {{1, 1, 1}, {1, 1, 1}, {1, 1, 1}},
        {{1, 1, 1}, {1, 1, 1}, {1, 1, 1}},
        {{1, 1, 1}, {1, 1, 1}, {1, 1, 1}} 
    };
    static_assert(Rank<decltype(b)>::value == 3);

    static_assert(Rank<int[2][2][2][2]>::value == 4);

    return 0;
}
