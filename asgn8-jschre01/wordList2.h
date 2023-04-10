/**
 * CSC 225, Assignment 8
 */

#define MAXLINE 101        /* The maximum length of a line, plus one. */

/**
 * Represents a node in a linked list of word occurrences.
 */

typedef struct wordNode {
	int num;
	struct wordNode *next;
} wordNode;


typedef struct Node {
    char line[MAXLINE];    /* The line in which the word occurs */
    int lineNum;           /* The number of that line within the file */
    struct wordNode *wordNum;           /* Pointer to the first occurance of word in line */
    struct Node *next;     /* The next node in the list, NULL if none */
} Node;


Node *addToTail(Node *, char *, int, int);
Node *rmFromHead(Node *, char *, int *, wordNode **);
void printList(Node *);
