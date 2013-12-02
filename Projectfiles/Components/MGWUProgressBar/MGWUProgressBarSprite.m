//
//  MGWUProgressBarSprite.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 02/12/13.
//
//

#import "MGWUProgressBarSprite.h"
#import "MGWUProgressBar_Protected.h"

@implementation MGWUProgressBarSprite

- (id)initWithFile:(NSString*)file {
    self = [super init];
    
    if (self) {
        self.contentNode = [CCSprite spriteWithFile:file];
        [self addChild:self.contentNode];
        
        self.contentNode.anchorPoint = ccp(0, 0);
        self.contentNode.position = ccp(0, 0);
        self.contentNode.contentSize = CGSizeZero;
        [(CCSprite *)self.contentNode setTextureRect:CGRectMake(0, 0, 0, 0)];
        
        self.maximumSize = [[((CCSprite *) self.contentNode) texture] contentSize];
    }
    
    return self;
}

- (void)redraw:(BOOL)animated {
    [super redraw:animated];
    
    [(CCSprite *)self.contentNode setTextureRect:CGRectMake(0, self.maximumSize.height - self.contentNode.contentSize.height, self.contentNode.contentSize.width,  self.contentNode.contentSize.height)];
}

- (void)redrawWithTargetValue:(CGFloat)targetValue {
    [super redrawWithTargetValue:targetValue];
    
    [(CCSprite *)self.contentNode setTextureRect:CGRectMake(0, self.maximumSize.height - self.contentNode.contentSize.height, self.contentNode.contentSize.width,  self.contentNode.contentSize.height)];
}


@end
