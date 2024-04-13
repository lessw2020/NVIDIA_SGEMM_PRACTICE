// basic matmul

#include <random>

__global__ void matmul (float* a, float* b, float* c, int N) {

}

void init_matrix(float* m, int N) {
    // Create a random number generator with a fixed seed
    std::mt19937 rng(2020); // Mersenne Twister

    // Create a distribution for generating random floats between 0 and 100
    std::uniform_real_distribution<float> dist(0.0f, 100.0f);
    int total_size = N*N;

    for (int i=0; i< total_size; ++i) {
        m[i] = dist(rng);

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

// set block and grid dims
int threads = 16;
int blocks = (N + threads -1) / threads;

dim3 Threads (threads, threads);
dim3 Blocks (blocks, blocks);

matmul<<<Blocks, Threads>>>(a, b, c, N);
cudaDeviceSynchronize();






}
