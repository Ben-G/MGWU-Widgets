//
//  MGWUProgressBarCCNodeRGBA.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 29/11/13.
//
//

#import "MGWUProgressBarColor.h"
#import "MGWUProgressBar_Protected.h"
#import "MGWUColorNode.h"

@implementation MGWUProgressBarColor

- (id)initWithColor:(ccColor4F)color {
    self = [super init];
    
    if (self) {
        self.contentNode = [[MGWUColorNode alloc] init];;
        [((MGWUColorNode*) self.contentNode) setColor:color];
        [self addChild:self.contentNode];
        
        self.contentNode.anchorPoint = ccp(0, 0);
        self.contentNode.position = ccp(0, 0);
        self.contentNode.contentSize = CGSizeZero;
    }
    
    return self;
}

@end
