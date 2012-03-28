//
//  Snake.h
//  Snake
//
//  Created by zhang xiaodong on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SnakeState.h"
#import "Food.h"

enum {
    goLeft = 0,
    goRight = 1,
    goDown = 2,
    goUp = 3
};
typedef NSUInteger SnakeDirection;

@interface Snake : NSObject
{
    id<SnakeState>  delegate;

    SnakeDirection direction;     //snake move direction
    BOOL isMove;                  //move or die
    BOOL hasEaten;                //has the snake eat food
    CGPoint head;                 //the head of snake's frame X and Y   (Deprecate maybe)
    int  length;                  //snake length, body number
    NSMutableArray *bodyArray;    //store the snake's bodies
    Food *theFood;
}

@property (assign) id<SnakeState>  delegate;
@property (assign) CGPoint head;
@property (assign) int  length;
@property (assign) BOOL hasEaten;
@property (assign) BOOL isMove;
@property (assign) SnakeDirection direction;
@property (nonatomic,retain) NSMutableArray *bodyArray;
@property (nonatomic,retain) Food *theFood;

- (id)initSnake;
- (void)initTheFood;
- (void)move;
- (void)detectSnakeState;
- (void)didMoveToDirection:(SnakeDirection)sdirection;
@end


// the class only to store body's frame
@interface SnakeBody : NSObject
{
    CGRect bodyRect;         //the CGRect of body
}
@property (assign) CGRect bodyRect;

- (id)initWithX:(int)x andY:(int)y;

@end
