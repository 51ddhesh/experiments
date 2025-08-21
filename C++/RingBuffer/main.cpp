// NOTE: This file was made with C++ 20 standards and uses C++ 20 features like std::jthread and std::stop_token

#include <atomic>      // For atomic operations on head/tail indices
#include <vector>      // For buffer storage
#include <iostream>    // For console output
#include <thread>      // For threading support
#include <chrono>      // For time utilities
#include <stop_token>  // For cooperative thread cancellation

using namespace std::chrono_literals;


// Thread-safe ring buffer (circular queue) implementation
// Uses atomic head/tail indices for lock-free synchronization between producer and consumer
template <typename T>
class RingBuffer {
private:
    const size_t size_;           // Total buffer size (+1 for full/empty distinction)
    std::vector<T> buffer_;       // Underlying storage for elements
    std::atomic<size_t> head_;    // Index for next push (producer)
    std::atomic<size_t> tail_;    // Index for next pop (consumer)

public:
    // Constructor: initializes buffer and indices
    explicit RingBuffer(size_t size)
        : size_(size + 1), // +1 to differentiate full vs empty
          buffer_(size_),
          head_(0),
          tail_(0) {}

    // Attempts to push an item into the buffer
    // Returns true if successful, false if buffer is full
    bool push(const T& item) noexcept {
        const size_t head = head_.load(std::memory_order_relaxed);
        const size_t next_head = (head + 1) % size_;

        // Buffer is full if advancing head meets tail
        if (next_head == tail_.load(std::memory_order_acquire)) {
            return false; // buffer full
        }

        buffer_[head] = item; // Store item at current head
        head_.store(next_head, std::memory_order_release); // Advance head
        return true;
    }

    // Attempts to pop an item from the buffer
    // Returns true if successful, false if buffer is empty
    bool pop(T& item) noexcept {
        const size_t tail = tail_.load(std::memory_order_relaxed);

        // Buffer is empty if tail meets head
        if (tail == head_.load(std::memory_order_acquire)) {
            return false; // buffer empty
        }

        item = buffer_[tail]; // Retrieve item at current tail
        tail_.store((tail + 1) % size_, std::memory_order_release); // Advance tail
        return true;
    }
};


int main() {
    constexpr size_t buffer_size = 8;
    RingBuffer<int> ring(buffer_size); // Create ring buffer for integers

    // Producer thread: pushes incrementing integers into the buffer
    // Uses std::jthread for automatic stop and join
    std::jthread producer([&](std::stop_token st) {
        int value = 1;
        while (!st.stop_requested()) {
            if (ring.push(value)) {
                std::cout << "[Producer] Pushed: " << value << "\n";
                ++value; // Increment value for next push
            } else {
                // Buffer is full, wait briefly before retrying
                std::this_thread::sleep_for(10us);
            }
        }
    });

    // Consumer thread: pops integers from the buffer and prints them
    std::jthread consumer([&](std::stop_token st) {
        int value;
        while (!st.stop_requested()) {
            if (ring.pop(value)) {
                std::cout << "  [Consumer] Popped: " << value << "\n";
            } else {
                // Buffer is empty, wait briefly before retrying
                std::this_thread::sleep_for(10us);
            }
        }
    });

    // Main thread sleeps for 2 seconds to let producer/consumer run
    std::this_thread::sleep_for(2s);

    // std::jthread requests stop and joins automatically on destruction
    std::cout << "Test Completed.\n";
    return 0;
}
