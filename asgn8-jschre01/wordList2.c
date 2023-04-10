/**
 * CSC 225, Assignment 8
 */

/* TODO: Included any required libraries. */
#include "wordList2.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

/**
 * Adds a new occurrence to the end of a list.
 * tail - A pointer to the current tail of a list, NULL if it's empty.
 * line - The line in which the word occurs
 * lineNum - The number of that line within the file
 * wordNum - The position of that word within that line
 *
 * Returns a pointer to the new tail of the list.
 */
Node *addToTail(Node *tail, char *line, int lineNum, int wordNum) {
	wordNode *occ;
	Node *new;
	occ = (wordNode *)malloc(sizeof(wordNode));
	occ->num = wordNum;
	occ->next = NULL;
	if(tail != NULL)
	{
		if(tail->lineNum == lineNum)
		{
			occ->next = NULL; 
			tail->wordNum->next = occ;
			return tail;
		}
	}
	new = (Node *)malloc(sizeof(Node));
	new->lineNum = lineNum;
	new->wordNum = occ;
	new->next = NULL;
	strcpy(new->line, line);
	if(tail == NULL)
	{
		return new;
	}
	else
	{
		tail->next = new;
		return new;
	}

    /* TODO: Implement this function. */
}

/**
 * Removes an occurrence from the beginning of a list.
 * head - A pointer to the current head of a list, NULL if it's empty
 * line - A pointer at which to store the removed line
 * lineNum - A pointer at which to store the removed line number
 * wordNum - A pointer at which to store the removed word number
 *
 * Returns a pointer to the new head of the list, NULL if it's (now) empty.
 */
Node *rmFromHead(Node *head, char *line, int *lineNum, wordNode **wordNum) {
	if(head != NULL)
	{
		Node *temp = head;
		*lineNum = head->lineNum;
		*wordNum = head->wordNum;
		strcpy(line, head->line);
		if(head->next == NULL)
		{
			free(head);
			return NULL;
		}
		head = head->next;
		free(temp);
		return head;
	}
	return NULL;
	
    /* TODO: Implement this function. */
}

/**
 * Prints out every node in a list.
 * head - A pointer to the head of a list, NULL if it's empty
 */
	
void printList(Node *head) {
	int linenum;
	char line[101];
	wordNode *wordNum;
	wordNode *temp;
	while(head != NULL)
	{
		head = rmFromHead(head, line, &linenum, &wordNum);
		printf("Line %d, word(s) ", linenum);
		while(wordNum != NULL)
		{
			if(wordNum->next == NULL)
			{
				printf("%d: ", wordNum->num);
			}
			else
			{
				printf("%d, ", wordNum->num);
			}
			temp = wordNum;
			wordNum = wordNum->next;
			free(temp);
		}
		printf("%s", line);
	}

    /* TODO: Implement this function. */
}



