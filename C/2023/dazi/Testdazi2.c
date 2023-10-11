#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define STRING_LENGTH 10

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

    char specialCharacters[] = "!@#$%^&*()-_=+[]{}|;:,.<>?/"; // Common special characters

    while (1) {
        char randomString[STRING_LENGTH + 1]; // +1 for null terminator

        // Generate a random string with 5 to 7 special characters
        char characters[STRING_LENGTH];
        int specialCount = 0;
        for (int i = 0; i < STRING_LENGTH; i++) {
            if (specialCount < 5 || (specialCount >= 5 && specialCount < 7 && rand() % 2 == 0)) {
                // Generate a random special character
                characters[i] = specialCharacters[rand() % strlen(specialCharacters)];
                specialCount++;
            }
        }
        characters[STRING_LENGTH] = '\0';

        // Shuffle the characters to randomize the order
        shuffle(characters, STRING_LENGTH);
        strncpy(randomString, characters, STRING_LENGTH);

        // Print the random string
        printf("%s\n", randomString);

        // Read user input
        char inputString[STRING_LENGTH + 1]; // +1 for null terminator
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

        // Print a line of "==========" to separate exercises, except for the first exercise
        if (!firstExercise) {
            printf("==========\n");
        }
        firstExercise = 0;
    }

    return 0;
}
