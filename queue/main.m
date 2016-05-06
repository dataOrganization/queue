//
//  main.m
//  queue
//
//  Created by mac on 16/5/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  int    QElemType;
#define MAXSIZE 11

typedef struct {
    QElemType data[MAXSIZE];
    int front;
    int rear;
}Queue;

void initQueue (Queue *q) {
    
    q->front = 0;
    q->rear = 0;
}

int queueLength(Queue q) {
    return (q.rear - q.front + MAXSIZE) % MAXSIZE;
}

BOOL insertQueue(Queue *q , QElemType e){
    if ((q->rear + 1) %MAXSIZE == q->front) {
        return NO;
    }
    q->data[q->rear] = e;
    q->rear = (q->rear + 1) % MAXSIZE;
    return YES;
}

BOOL deleteHeadQueue (Queue *q,QElemType e){
    if (q->front == q->rear) {
        return NO;
    }
    e = q->data[q->front];
    q->front = (q->front + 1) % MAXSIZE;
    return YES;
}

void printfQueue (Queue *q) {
    int i = q->front;
    while (i % MAXSIZE != q->rear) {
        printf("%d  ",q->data[i]);
        i++;
    }
}



int main(int argc, const char * argv[]) {
    
    Queue *q = (Queue *)malloc(sizeof(Queue));
    initQueue(q);
    printf("%d\n",queueLength(*q));
    for (int i = 0; i < 10; i++) {
        insertQueue(q, i);
    }

    insertQueue(q, 10);
    printfQueue(q);
    deleteHeadQueue(q, 0);
    printf("\n");
    printfQueue(q);
    deleteHeadQueue(q, 0);
    printf("\n");
    printfQueue(q);
    insertQueue(q, 10);
    printf("\n");
    printfQueue(q);
    return 0;
}
