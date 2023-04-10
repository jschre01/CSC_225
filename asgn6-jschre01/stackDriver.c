/**
 * CSC 225, Assignment 6
 */

#include <stdio.h>
#include "stack.h"
#include <string.h>

int main(void)
{
	char u = 'a';
	int size = 0;
	int val; 
	int stack[MAX_SIZE]; 
	int mode = DEC_MODE;
	printf("Welcome to the stack program.\n\n");
	while(u != 'q') 
	{	
		printf("Enter option: ");
		scanf(" %c", &u);
		if(u == '+')
		{
			int num;
			int res;
			printf("What number? ");
			scanf(" %d", &num);
			res = push(stack, &size, num);
			if(res == 1)
			{
				printf("Error: Stack overflow!\n");
			}
			printf("Stack: ");
			printStack(stack, size, mode);
			printf("\n");	

		}
		else if(u == '-')		{
			int res;
			res = pop(stack, &size, &val);
			if(res == 1)
			{
				printf("Error: Stack underflow!\n");
			}
			else
			{
				printf("Popped %d.\n", val);
			}
			printf("Stack: ");
			printStack(stack, size, mode);
			printf("\n");
		}
		else if(u == 'd')		{
			mode = DEC_MODE;
			printf("Stack: ");
			printStack(stack, size, mode);
			printf("\n");
		}
		else if(u == 'x')		{
			mode = HEX_MODE;
			printf("Stack: ");
			printStack(stack, size, mode);
			printf("\n");
		}
		else if(u == 'c')
		{
			mode = CHAR_MODE;
			printf("Stack: ");
			printStack(stack, size, mode);
			printf("\n");
		}
		else if(u == 'q')
		{
			printf("Goodbye!\n");
		}
		else
		{
			printf("Stack: ");
			printStack(stack, size, mode);
			printf("\n");
		}
	
	}
	return 0;
}

