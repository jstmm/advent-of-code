#include <stdio.h>
#include <stdlib.h>

int compare(const void *a, const void *b)
{
    return (*(int *)a - *(int *)b);
}

int main()
{
    char buffer[50];
    FILE *file_ptr = fopen("input.txt", "r");
    int left_column[1000];
    int right_column[1000];
    int nb_entries = 0;

    while (fgets(buffer, sizeof(buffer), file_ptr))
    {
        int left, right;
        sscanf(buffer, "%d %d", &left, &right);
        left_column[nb_entries] = left;
        right_column[nb_entries] = right;
        nb_entries++;
    }

    fclose(file_ptr);

    int sum = 0;

    for (int i = 0; i < nb_entries; i++)
        for (int j = 0; j < nb_entries; j++)
            if (left_column[i] == right_column[j])
                sum += left_column[i];

    printf("Sum: %d\n", sum);

    return 0;
}
