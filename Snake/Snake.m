//
//  Snake.m
//  Snake
//
//  Created by zhang xiaodong on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Snake.h"
// hello zhung
@implementation Snake
@synthesize direction,head,length,isMove,hasEaten,bodyArray,delegate,theFood;

- (id)initSnake
{
    if (self = [super init]) {
        direction = goDown;
        isMove = YES;
        hasEaten = NO;
        head = CGPointMake(10, 50);
        length = 5;
        
        bodyArray = [[NSMutableArray arrayWithCapacity:50] retain];
        
        //init the bodies, and store into bodyArray.
        for (int i = 0; i < length; i++) {
            SnakeBody *body = [[SnakeBody alloc] initWithX:head.x andY:head.y-i*10]; //body width&height = 10
            [bodyArray addObject:body];
            [body release];
        }
    }
    return self;
}

- (void)dealloc
{
    [bodyArray release];
	[super dealloc];
}

- (void)initTheFood
{
    int x = (arc4random() % 48);
    int y = (arc4random() % 36);

    Food *afood = [[Food alloc] initWithX:10*x andY:10*y];
    self.theFood = afood;
    [afood release];
    
}

- (void)move
{
    //根据蛇的前进方向,添加一个新的蛇头,然后删掉一个蛇尾
    //by the move direction of the snake, add a new snake head, and delete the snake tail
    
    //get snake head X&Y
    SnakeBody *headBody = [self.bodyArray objectAtIndex:0];
    CGPoint headPoint = headBody.bodyRect.origin;
    CGPoint p;
    
    //delete the snake tail
    if (!hasEaten) {
        [bodyArray removeLastObject];
    }else{
        hasEaten = NO;
    }
    //add a new snake head
    switch (self.direction) {
        case goUp:
            p = CGPointMake(headPoint.x , headPoint.y - 10);
            break;
        case goDown:
            p = CGPointMake(headPoint.x , headPoint.y + 10);
            break;
        case goLeft:
            p = CGPointMake(headPoint.x - 10, headPoint.y);
            break;
        case goRight:
            p = CGPointMake(headPoint.x + 10, headPoint.y);
            break;
        default:
            break;
    }
    SnakeBody *body = [[SnakeBody alloc] initWithX:p.x andY:p.y];
    [bodyArray insertObject:body atIndex:0];
    [body release];
    
    [self detectSnakeState];
    
}

- (void)detectSnakeState
{
    SnakeBody *headBody = [self.bodyArray objectAtIndex:0];
    //touch itself,die   game over
    
    //touch wall,die     game over
    if (headBody.bodyRect.origin.x<0||headBody.bodyRect.origin.x>480||headBody.bodyRect.origin.y<0||headBody.bodyRect.origin.y>360) {
        [self.delegate SnakeDidDie];
    }

    
    //eat food        length+1....       (later,maybe add score and raise speed)
    if (CGRectEqualToRect(headBody.bodyRect,self.theFood.foodRect)) {
        hasEaten = YES;
        [self initTheFood];
    }
}

- (void)didMoveToDirection:(SnakeDirection)sdirection
{
    //change the move direction
    switch (sdirection) {
        case goUp:
            if (self.direction != goDown)       //when snake go down,ignore the key "W"
            self.direction = goUp;
            break;
        case goDown:
            if (self.direction != goUp) 
            self.direction = goDown;
            break;
        case goLeft:
            if (self.direction != goRight) 
            self.direction = goLeft;
            break;
        case goRight:
            if (self.direction != goLeft) 
            self.direction = goRight;
            break;
        default:
            break;
    }
}

@end


@implementation SnakeBody
@synthesize bodyRect;

- (id)initWithX:(int)x andY:(int)y
{
    if (self = [super init]) {
        bodyRect = CGRectMake(x, y, 10, 10);       //body width&height = 10
    }
    return self;
}

- (void)dealloc
{
	[super dealloc];
}
@end