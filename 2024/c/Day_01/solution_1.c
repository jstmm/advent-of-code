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
    int sum = 0;

    while (fgets(buffer, sizeof(buffer), file_ptr))
    {
        int left, right;
        sscanf(buffer, "%d %d", &left, &right);
        left_column[nb_entries] = left;
        right_column[nb_entries] = right;
        nb_entries++;
    }

    fclose(file_ptr);

    qsort(left_column, nb_entries, sizeof(int), compare);
    qsort(right_column, nb_entries, sizeof(int), compare);

    for (int i = 0; i < nb_entries; i++)
    {
        int val_a = left_column[i], val_b = right_column[i];
        sum += ((val_a >= val_b) ? val_a - val_b : val_b - val_a);
    }

    printf("Sum: %d\n", sum);

    return 0;
}
