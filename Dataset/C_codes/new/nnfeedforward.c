#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define INPUT_NODES 2
#define HIDDEN_NODES 4
#define OUTPUT_NODES 1
#define TRAINING_SETS 4
#define EPOCHS 5000
#define LEARNING_RATE 0.1

// Activation function
double sigmoid(double x) {
    return 1.0 / (1.0 + exp(-x));
}

double sigmoidDerivative(double x) {
    return x * (1.0 - x);
}

// Training data for XOR
double training_inputs[TRAINING_SETS][INPUT_NODES] = {
    {0.0, 0.0},
    {0.0, 1.0},
    {1.0, 0.0},
    {1.0, 1.0}
};

double training_outputs[TRAINING_SETS][OUTPUT_NODES] = {
    {0.0},
    {1.0},
    {1.0},
    {0.0}
};

// Weights and biases
double hidden_weights[INPUT_NODES][HIDDEN_NODES];
double hidden_bias[HIDDEN_NODES];
double output_weights[HIDDEN_NODES][OUTPUT_NODES];
double output_bias[OUTPUT_NODES];

// Forward pass storage
double hidden_layer[HIDDEN_NODES];
double output_layer[OUTPUT_NODES];

// Initialize weights randomly
void initWeights() {
    srand(time(NULL));
    for (int i = 0; i < INPUT_NODES; i++) {
        for (int j = 0; j < HIDDEN_NODES; j++) {
            hidden_weights[i][j] = ((double)rand() / RAND_MAX) * 2 - 1;
        }
    }
    for (int j = 0; j < HIDDEN_NODES; j++) {
        hidden_bias[j] = ((double)rand() / RAND_MAX) * 2 - 1;
    }
    for (int i = 0; i < HIDDEN_NODES; i++) {
        for (int j = 0; j < OUTPUT_NODES; j++) {
            output_weights[i][j] = ((double)rand() / RAND_MAX) * 2 - 1;
        }
    }
    for (int j = 0; j < OUTPUT_NODES; j++) {
        output_bias[j] = ((double)rand() / RAND_MAX) * 2 - 1;
    }
}

// Forward pass
void forward(double input[]) {
    for (int j = 0; j < HIDDEN_NODES; j++) {
        hidden_layer[j] = hidden_bias[j];
        for (int i = 0; i < INPUT_NODES; i++) {
            hidden_layer[j] += input[i] * hidden_weights[i][j];
        }
        hidden_layer[j] = sigmoid(hidden_layer[j]);
    }

    for (int j = 0; j < OUTPUT_NODES; j++) {
        output_layer[j] = output_bias[j];
        for (int i = 0; i < HIDDEN_NODES; i++) {
            output_layer[j] += hidden_layer[i] * output_weights[i][j];
        }
        output_layer[j] = sigmoid(output_layer[j]);
    }
}

// Backpropagation
void backprop(double input[], double target[]) {
    double output_errors[OUTPUT_NODES];
    double hidden_errors[HIDDEN_NODES];

    // Output error
    for (int j = 0; j < OUTPUT_NODES; j++) {
        output_errors[j] = (target[j] - output_layer[j]) * sigmoidDerivative(output_layer[j]);
    }

    // Hidden error
    for (int i = 0; i < HIDDEN_NODES; i++) {
        hidden_errors[i] = 0.0;
        for (int j = 0; j < OUTPUT_NODES; j++) {
            hidden_errors[i] += output_errors[j] * output_weights[i][j];
        }
        hidden_errors[i] *= sigmoidDerivative(hidden_layer[i]);
    }

    // Update output weights
    for (int i = 0; i < HIDDEN_NODES; i++) {
        for (int j = 0; j < OUTPUT_NODES; j++) {
            output_weights[i][j] += LEARNING_RATE * output_errors[j] * hidden_layer[i];
        }
    }

    // Update output bias
    for (int j = 0; j < OUTPUT_NODES; j++) {
        output_bias[j] += LEARNING_RATE * output_errors[j];
    }

    // Update hidden weights
    for (int i = 0; i < INPUT_NODES; i++) {
        for (int j = 0; j < HIDDEN_NODES; j++) {
            hidden_weights[i][j] += LEARNING_RATE * hidden_errors[j] * input[i];
        }
    }

    // Update hidden bias
    for (int j = 0; j < HIDDEN_NODES; j++) {
        hidden_bias[j] += LEARNING_RATE * hidden_errors[j];
    }
}

// Training loop
void train() {
    for (int epoch = 0; epoch < EPOCHS; epoch++) {
        double totalError = 0.0;
        for (int set = 0; set < TRAINING_SETS; set++) {
            forward(training_inputs[set]);
            backprop(training_inputs[set], training_outputs[set]);
            for (int j = 0; j < OUTPUT_NODES; j++) {
                double err = training_outputs[set][j] - output_layer[j];
                totalError += err * err;
            }
        }
        if (epoch % 500 == 0) {
            printf("Epoch %d, Error = %f\n", epoch, totalError);
        }
    }
}

// Testing
void test() {
    printf("\nTesting Neural Network on XOR:\n");
    for (int set = 0; set < TRAINING_SETS; set++) {
        forward(training_inputs[set]);
        printf("Input: %.1f %.1f => Output: %.3f (Expected: %.1f)\n",
               training_inputs[set][0], training_inputs[set][1],
               output_layer[0], training_outputs[set][0]);
    }
}

int main() {
    initWeights();
    train();
    test();
    return 0;
}