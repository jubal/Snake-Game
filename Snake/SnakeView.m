//
//  SnakeView.m
//  Snake
//
//  Created by zhang xiaodong on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SnakeView.h"
#import "Snake.h"

// test git
@implementation SnakeView
@synthesize snake;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self gameInit];     //start the game
    }
    
    return self;
}

- (void)dealloc
{
    [snake release];
	[super dealloc];
}

- (void)gameInit
{
    //initialize the snake
    Snake *aSnake = [[Snake alloc] initSnake];
    aSnake.delegate = self;
    self.snake = aSnake;
    //init food............
    [aSnake initTheFood];
    [aSnake release];
    
    
    //start the game timer
    [self performSelectorOnMainThread:@selector(gamePlay) withObject:nil waitUntilDone:YES];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(gamePlay) userInfo:nil repeats:YES];
}

- (void)gamePlay
{
    //move the snake 
    [self.snake move];
    
    //update the game's view
    [self setNeedsDisplay:YES];
}

- (void)gameOver
{
    NSLog(@"gameOver");
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}

- (void)drawRect:(NSRect)dirtyRect
{
    // set body color of the snake to darkGrayColor
    [[NSColor darkGrayColor] set];

    //get every body of the snake, and draw using NSRectFill
    for (int i = 0; i < [self.snake.bodyArray count]; i++) {
        SnakeBody *body = [self.snake.bodyArray objectAtIndex:i];
        NSRectFill(body.bodyRect);
    }
    
    [[NSColor blackColor] set];
    NSRectFill(self.snake.theFood.foodRect);

}

- (BOOL)isFlipped
{
    //let coordinnates start in the upper-left
    return YES;
}

#pragma mark keyboard 

- (BOOL)acceptsFirstResponder 
{ 
    return YES; 
}

- (void)keyDown: (NSEvent *) event 
{ 
    // the key ADWS for change the direction of the snake
    NSString *chars = [event characters]; 
    
    
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

#pragma mark SnakeState delegate

- (void)SnakeDidDie
{
    [self gameOver];
}
@end
