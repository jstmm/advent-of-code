#include <iostream>

int main()
{
    FILE *file_ptr = fopen("input_test.txt", "r");

    char buffer[11];
    char array[10][10];

    int i = 0;
    while (fgets(buffer, sizeof(buffer), file_ptr))
    {
        for (int j = 0; j < 10; j++)
        {
            array[i][j] = buffer[j];
        }
        i++;
    }

    return 0;
}
