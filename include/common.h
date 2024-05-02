#include <stdio.h>
#include <stdlib.h>

#define PRINT(fmt, ...) printf("<%s:%d> " fmt "\n", __FUNCTION__, __LINE__, ##__VA_ARGS__)

/* Hello function */
int print_hello();
