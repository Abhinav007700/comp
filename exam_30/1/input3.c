#include<stdio.h>
int main(){
    int a=10, b=2;
    printf("%d\n",a+b);
    printf("%d\n",a-b);
    printf("%d\n",a/b);
    printf("%d\n",a*b);
    printf("%d\n",a%b);
    if (a==b){
        printf("A\n");
    }
    if (a!=b){
        printf("not A\n");
    }
    if (a>=b){
        printf("B\n");
    }
    if (a<=b){
        printf("C\n");
    }
    if (a>b){
        printf("D\n");
    }
    if (a<b){
        printf("E\n");
    }
    if (a==10 && b!=2){
        printf("F\n");
    }
    if (a==10 || b!=2){
        printf("G\n");
    }
    a++;
    b--;
    return 0;
}