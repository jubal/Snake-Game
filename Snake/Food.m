//
//  Food.m
//  Snake
//
//  Created by zhang xiaodong on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Food.h"

@implementation Food
@synthesize foodRect;

- (id)initWithX:(int)x andY:(int)y
{
    if (self = [super init]) {
        foodRect = CGRectMake(x, y, 10, 10);       //body width&height = 10
    }
    return self;
}
@end
