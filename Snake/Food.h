//
//  Food.h
//  Snake
//
//  Created by zhang xiaodong on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject
{
    CGRect foodRect;         //the CGRect of Food
}

@property (assign) CGRect foodRect;

- (id)initWithX:(int)x andY:(int)y;

@end
