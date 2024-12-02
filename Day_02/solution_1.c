#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int check_report(char *report)
{
    int previous_number = -1, current_number = -1;
    int is_increasing = -1;

    while (report)
    {
        if (previous_number == -1)
        {
            previous_number = atoi(report);
        }
        else
        {
            current_number = atoi(report);

            if (is_increasing == -1)
            {
                is_increasing = (current_number > previous_number) ? 1 : 0;
            }
            else
            {
                if ((current_number > previous_number && is_increasing == 0) ||
                    (current_number < previous_number && is_increasing == 1))
                {
                    return 0;
                }
            }

            int level_difference = (current_number > previous_number)
                                       ? current_number - previous_number
                                       : previous_number - current_number;

            if (level_difference < 1 || level_difference > 3)
                return 0;
            previous_number = current_number;
        }

        report = strtok(NULL, " ");
    }
    return 1;
}

int main()
{
    int safe_reports = 0;

    char buffer[50];
    FILE *file_ptr = fopen("input.txt", "r");

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
