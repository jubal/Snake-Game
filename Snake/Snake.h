//
//  Snake.h
//  Snake
//
//  Created by zhang xiaodong on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    goLeft = 0,
    goRight = 1,
    goDown = 2,
    goUp = 3
};
typedef NSUInteger SnakeDirection;

@interface Snake : NSObject
{
    SnakeDirection direction;
    BOOL isMove;
    BOOL hasEaten;
    CGPoint head;
    int  length;
}

@property (assign) CGPoint head;
@property (assign) int  length;
@property (assign) BOOL hasEaten;
@property (assign) BOOL isMove;
@property (assign) SnakeDirection direction;

- (id)initSnake;
- (void)didMoveToDirection:(SnakeDirection)direction;

@end
