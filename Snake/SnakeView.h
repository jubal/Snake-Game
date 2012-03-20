//
//  SnakeView.h
//  Snake
//
//  Created by zhang xiaodong on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Snake;
@interface SnakeView : NSView
{
    Snake *snake;
    NSTimer *timer;
}

@property (nonatomic,retain) Snake *snake;

- (void)gameInit;
@end
