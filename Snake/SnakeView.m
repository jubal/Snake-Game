//
//  SnakeView.m
//  Snake
//
//  Created by zhang xiaodong on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SnakeView.h"
#import "Snake.h"

@implementation SnakeView
@synthesize snake;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self gameInit];
    }
    
    return self;
}

- (void)gameInit
{
    Snake *aSnake = [[Snake alloc] initSnake];
    self.snake = aSnake;
    [aSnake release];
    
    [self performSelectorOnMainThread:@selector(gamePlay) withObject:nil waitUntilDone:YES];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(gamePlay) userInfo:nil repeats:YES];
}

- (void)gamePlay
{
    [self.snake didMoveToDirection:goDown];
    
    [self setNeedsDisplay:YES];

}

- (void)drawRect:(NSRect)dirtyRect
{
    CGPoint p = self.snake.head;
    NSRect frame = CGRectMake(p.x, p.y, 10, 10);
    [[NSColor darkGrayColor] set];
    NSRectFill(frame);
}

- (BOOL)isFlipped
{
    return YES;
}

- (BOOL)acceptsFirstResponder 
{ 
    return YES; 
}

- (void)keyDown: (NSEvent *) event 
{ 
    NSString *chars = [event characters]; 
    NSLog(@"%@",chars);
    
    if ([chars isEqualToString:@"s"]) {
        [self.snake didMoveToDirection:goDown];
    }
    if ([chars isEqualToString:@"w"]) {
        [self.snake didMoveToDirection:goUp];
    }
    if ([chars isEqualToString:@"a"]) {
        [self.snake didMoveToDirection:goLeft];
    }
    if ([chars isEqualToString:@"d"]) {
        [self.snake didMoveToDirection:goRight];
    }
    
} 
@end
