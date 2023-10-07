#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ctype.h>

#define STRING_LENGTH 10
#define MIN_DIGITS 5
#define MAX_DIGITS 7

// Function to shuffle an array of characters
void shuffle(char *array, int length) {
    for (int i = length - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        char temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

int main() {
    srand(time(NULL));
    int firstExercise = 1; // Flag to indicate the first exercise

    while (1) {
        char randomString[STRING_LENGTH + 1]; // +1 for null terminator
        char inputString[STRING_LENGTH + 1];  // +1 for null terminator

        // Generate a random string with 5 to 7 digits
        char characters[STRING_LENGTH];
        int digitCount = 0;
        int letterCount = 0;
        for (int i = 0; i < STRING_LENGTH; i++) {
            if ((digitCount < MAX_DIGITS && rand() % 2 == 0) || (digitCount - letterCount < MIN_DIGITS - letterCount)) {
                // Generate a random digit
                characters[i] = '0' + rand() % 10;
                digitCount++;
            } else {
                // Generate a random lowercase letter
                characters[i] = 'a' + rand() % 26;
                letterCount++;
            }
        }
        characters[STRING_LENGTH] = '\0';

        // Shuffle the characters to randomize the order
        shuffle(characters, STRING_LENGTH);
        strncpy(randomString, characters, STRING_LENGTH);

        // Print a line of "==========" to separate exercises, except for the first exercise
        if (!firstExercise) {
            printf("==========\n");
        }
        firstExercise = 0;

        // Print the random string
        printf("%s\n", randomString);

        // Read user input
        fgets(inputString, sizeof(inputString), stdin);

        // Remove newline character from input
        inputString[strlen(inputString) - 1] = '\0';

        // Check if the user wants to stop
        if (strcmp(inputString, "stop") == 0) {
            break;
        }

        // Clear input buffer
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
    }

    return 0;
}
