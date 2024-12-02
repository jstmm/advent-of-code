#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Solution is not working currently :(

int check_report(char *report)
{
    int previous_number = -1, current_number = -1;
    int is_increasing = -1;
    int error_allowance = 1;

    while (report)
    {
        if (previous_number == -1)
        {
            previous_number = atoi(report);
            report = strtok(NULL, " ");
            continue;
        }

        current_number = atoi(report);

        // Equality check (no difference)
        if (current_number == previous_number)
        {
            error_allowance -= 1;
            if (error_allowance < 0) return 0;
            report = strtok(NULL, " ");
            continue;
        }

        if (is_increasing == -1)
        {
            is_increasing = (current_number > previous_number) ? 1 : 0;
            previous_number = current_number;
            report = strtok(NULL, " ");
            continue;
        }

        // Direction check
        if (((current_number > previous_number) && is_increasing == 0) ||
            ((current_number < previous_number) && is_increasing == 1))
        {
            error_allowance -= 1;
            if (error_allowance < 0) return 0;
            report = strtok(NULL, " ");
            continue;
        }

        // Difference check
        int level_difference = (current_number > previous_number)
                                   ? current_number - previous_number
                                   : previous_number - current_number;

        if (level_difference < 1 || level_difference > 3)
        {
            error_allowance -= 1;
            if (error_allowance < 0) return 0;
            report = strtok(NULL, " ");
            continue;
        }

        previous_number = current_number;
        report = strtok(NULL, " ");
    }
    printf("Yes\n");
    return 1;
}

int main()
{
    int safe_reports = 0;

    char buffer[50];
    FILE *file_ptr = fopen("input_test.txt", "r");

    while (fgets(buffer, sizeof(buffer), file_ptr))
    {
        char *token = strtok(buffer, " ");

        if (check_report(token) == 1)
        {
            safe_reports += 1;
        }
    }

    printf("Nb of safe reports: %d\n", safe_reports);
}
