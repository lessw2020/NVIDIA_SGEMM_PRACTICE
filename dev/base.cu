// basic matmul

#include <random>

__global__ void matmul () {

}

void init_matrix(float* m, int N) {
    // Create a random number generator with a fixed seed
    std::mt19937 rng(2020); // Mersenne Twister

    // Create a distribution for generating random floats between 0 and 100
    std::uniform_real_distribution<float> dist(0.0f, 100.0f);

    for (i=0; i<N; ++i) {
        m[i] = dist(rng)

    }
}

int main() {
// square matrix assumed (2 ^ 10 * 2 ^ 10 default)
int N = 1 << 10;

size_t bytes = N * N * sizeof(float);
float *a, *b, *c;
cudaMallocManaged(&a, bytes);
cudaMallocManaged(&b, bytes);
cudaMallocManaged(&c, bytes);

//init matrices
init_matrix(a,N);
init_matrix(b,N);







}
