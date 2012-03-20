//
//  Snake.m
//  Snake
//
//  Created by zhang xiaodong on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Snake.h"

@implementation Snake
@synthesize direction,head,length,isMove,hasEaten;

- (id)initSnake
{
    if (self = [super init]) {
        direction = goDown;
        isMove = YES;
        hasEaten = NO;
        head = CGPointMake(10, 10);
        length = 1;
    }
    return self;
}

- (void)didMoveToDirection:(SnakeDirection)direction
{
    switch (direction) {
        case goUp:
            self.head = CGPointMake(self.head.x, self.head.y -10);
            break;
        case goDown:
            self.head = CGPointMake(self.head.x, self.head.y +10);
            break;
        case goLeft:
            self.head = CGPointMake(self.head.x -10, self.head.y);
            break;
        case goRight:
            self.head = CGPointMake(self.head.x +10, self.head.y);
            break;
        default:
            break;
    }
}
@end
