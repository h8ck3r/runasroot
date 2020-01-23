#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdarg.h>
#include <string.h>

int i;
char command[100];

int main(int argc, char* argv[])
{
	setuid(0);
	setgid(0);

	if (argc == 1) {
		system("/bin/bash");
	} else {
		for (i = 1; i < argc; i++) {
			strcat(command, " ");
			strcat(command, argv[i]);
		}
		system(command);
	}

	return 0;
}
