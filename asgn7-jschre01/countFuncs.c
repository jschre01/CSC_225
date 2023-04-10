/**
 * CSC 225, Assignment 7
 */

#include <stdio.h>

/**
 * Prints out positive integers, counting backwards from n to 1.
 * n - A positive integer at which to start
 */
void countBackwardsFrom(int n) {
    /* TODO: Complete this function. */
	int i; 
	for(i = n; i > 0; i--)
	{
		if(i == 1)
		{
			printf("%d", i);
		}
		else
		{
			printf("%d, ", i);
		}
	}
}

/**
 * Prints out positive integers, counting forwards from 1 to n.
 * n - A positive integer at which to stop
 */
void countForwardsTo(int n) {
	int i;
	for(i = 1; i <= n; i++)
	{
		if(i == n)
		{
			printf("%d", i);
		}
		else
		{
			printf("%d, ", i);
		}
	}
    /* TODO: Complete this function. */
}
