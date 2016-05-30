//
//  main.c
//  queue
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
typedef int ElemType;

#define MAXSIZE 10

typedef struct quque{
    ElemType data[MAXSIZE];
    int front;
    int rear;
}Queue;

void initQueue (Queue *q) {
    q->front = 0;
    q->rear = 0;
}

void insertQueue(Queue *q ,ElemType e) {
    if (((q->rear + 1) % MAXSIZE) != q->front) {
        q->data[q->rear] = e;
        printf("%d ",e);
        q->rear = (q->rear + 1) % MAXSIZE;
        
    }
}

void printfQueue(Queue *q) {
    int number = q->front;
    printf("\n");
    while (number % MAXSIZE != q->rear) {
        printf("%d ",q->data[number % MAXSIZE]);
        number++;
    }
}

void deleteElementOfQueue(Queue *q ,int number){
    while (number != 0) {
        if (q->rear != q->front) {
            
            q->front = (q->front + 1) % MAXSIZE;
        }
        number--;
    }
}

int main(int argc, const char * argv[]) {

    Queue *q = (Queue *)malloc(sizeof(Queue));
    initQueue(q);
    for (int i = 0; i < 12; i++) {
        insertQueue(q, arc4random() % 100);
    }
    printfQueue(q);
    deleteElementOfQueue(q, 4);
    printfQueue(q);
    printf("\n");
    for (int i = 0; i < 4; i++) {
        insertQueue(q, arc4random() % 100);
    }
    printfQueue(q);
    return 0;
}
