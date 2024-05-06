#include<stdio.h>
int main(){
    int a;
    char b;
    printf("Enter a char:");
    scanf("%c",&b);
    float c=1.234;
    a=10;
    if(a>10){
        printf("more than 10");
    }
    else if( a>5){
        printf("More than 5");
    }
    else{
        printf("Small number");
    }

    for(int i=0; i<10; i++){
        printf("%d %c",i,b);
    }
    
}