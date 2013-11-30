//
//  MGWUColorNode.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 29/11/13.
//
//

#import "MGWUColorNode.h"

@implementation MGWUColorNode

- (id)init {
    self = [super init];
    
    if (self) {
        self.color = (ccColor4F) {100,0,255,255};
    }
    
    return self;
}

- (void)draw {
    [super draw];
    
    CGPoint origin = ccp(0,0);
    CGPoint destination = ccp(self.contentSize.width, self.contentSize.height);
    
    ccDrawSolidRect(origin, destination, self.color);
}

@end
