/**
 * CSC 225, Assignment 8
 */

#include <stdio.h>
#include <string.h>
#include "wordList.h"

int main(int argc, char *argv[])
{
	int i;
	int wordnum = 0;
	char *key = argv[1];
	char line[101];
	char tokline[101];
	int longline = 0;
	int linenum = 0;
	char longestline[101];
	char *delim = ". !?,\n\"-;";
	char *ptr;
	int first = 0;
	int occ = 0;
	Node *tail;
	Node *head;
	if (argc != 3)
	{
		printf("myGrep: Improper number of arguments\nUsage: %s <word> <filename>\n", argv[0]);
		return 1;
	}
	else
	{
		FILE *file;
		file = fopen(argv[2], "r");
		if(file == NULL)
		{
			printf("myGrep: Unable to open file: %s\n", argv[2]);
			return 1;
		}
		else
		{
			for(i = 0; i < argc; i++)
			{
				printf("%s ", argv[i]);
			}
			printf("\n");
			while(fgets(line, 101, file) != NULL)
			{
				if(strlen(line) > longline)
				{
					longline = strlen(line);
					strcpy(longestline, line); 
				}
				strcpy(tokline, line);
				ptr = strtok(tokline, delim);
				while(ptr)
				{
					i = strcmp(ptr, key);
					if(i == 0)
					{
						if(first == 0)
						{
							tail = addToTail(NULL, line, linenum, wordnum);
							head = tail;
							first = 1;
							occ++;
						}
						else
						{
							tail = addToTail(tail, line, linenum, wordnum);
							occ++;
						}
					}
					ptr = strtok(NULL, delim);
					wordnum++;
				}
				wordnum = 0;
				linenum++;

			}
			printf("Longest line (%d characters): %s", longline, longestline);
			printf("Number of lines: %d\n", linenum);
			printf("Total occurrences of \"%s\": %d\n", key, occ);
			while(head != NULL)
			{
				head = rmFromHead(head, line, &linenum, &wordnum);
				printf("Line %d, word %d: %s", linenum, wordnum, line);
			}
			fclose(file);
			return 0;
		}
	}
}

		
	
