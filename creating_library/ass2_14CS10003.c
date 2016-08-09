#include "myl.h"

int main()
{
    int a,status;
    float b;
    char A[20];
    prints("Enter a valid positive integer\n");
    a=readi(&status);
    if(status==OK){
        prints("Integer: ");
        printi(a);
        prints("\nRead status: OK\n");
    }
    else prints("Read status: ERR\n");
    prints("Enter a valid negative integer\n");
    a=readi(&status);
    if(status==OK){
        prints("Integer: ");
        printi(a);
        prints("\nRead status: OK\n");
    }
    else prints("Read status: ERR\n");
    prints("Enter an invalid integer\n");
    a=readi(&status);
    if(status==OK){
        prints("Integer: ");
        printi(a);
        prints("\nRead status: OK\n");
    }
    else prints("Read status: ERR\n");
    prints("Enter a valid positive float\n");
    status=readf(&b);
    if(status==OK){
        prints("Float: ");
        printd(b);
        prints("\nRead status: OK\n");
    }
    else prints("Read status: ERR\n");
    prints("Enter a valid negative float\n");
    status=readf(&b);
    if(status==OK){
        prints("Float: ");
        printd(b);
        prints("\nRead status: OK\n");
    }
    else prints("Read status: ERR\n");
    prints("Enter an invalid float\n");
    status=readf(&b);
        if(status==OK){
        prints("Float: ");
        printd(b);
        prints("\nRead status: OK\n");
    }
    else prints("Read status: ERR\n");
    return 0;
}
