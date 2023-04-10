/**
 * CSC 225, Assignment 6
 */

#include <stdio.h>
#include "stack.h"

/**
 * Pushes a value onto a stack of integers.
 * stack - The array containing the stack
 * size - A pointer to the number of elements in the stack
 * val - The value to push
 *
 * Returns 0 on success, 1 on overflow.
 */
int push(int stack[], int *size, int val) {
    if(*size == MAX_SIZE)
    {
    	return 1;
    }
    else
    {
	stack[*size] = val;
	(*size)++;
	return 0;
    }
}


    	
	/* TODO: Complete this function. */

/**
 * Pops a value off of a stack of integers.
 * stack - The array containing the stack
 * size - A pointer to the number of elements in the stack
 * val - A pointer to the variable in which to place the popped value
 *
 * Returns 0 on success, 1 on underflow.
 */
int pop(int stack[], int *size, int *val) {
    /* TODO: Complete this function. */
	if(*size == 0)
	{
	    return 1;
	}
	else
	{
	    (*size)--;
	    *val = stack[*size];
	    return 0;
	}
}

/**
 * Prints a stack of integers.
 * stack - The array containing the stack
 * size - The number of elements in the stack
 * mode - How to print elements, one of: DEC_MODE, HEX_MODE, or CHAR_MODE
 */
void printStack(int stack[], int size, int mode) 
{
    /* TODO: Complete this function. */
    int i;

    printf("[");
    if(mode == DEC_MODE)
    {
    	for(i = 0; i < size; i++)
	{
	    	if(i + 1 == size)
		{
			printf("%d", stack[i]);
		}
		else
		{
			printf("%d, ", stack[i]);
		}	
    	}
    }
    else if(mode == HEX_MODE)
    {	for(i = 0; i < size; i++)
	{
	    	if(i + 1 == size)
		{
			printf("0x%0X", stack[i]);
		}
		else
		{
			printf("0x%0X, ", stack[i]);
		}	
    	}

    }
    else if(mode == CHAR_MODE)
    {	for(i = 0; i < size; i++)
	{
	    	if(i + 1 == size)
		{
			printf("'%c'", stack[i]);
		}
		else
		{
			printf("'%c', ", stack[i]);
		}	
    	}
    
    }
    printf("]\n");

}
