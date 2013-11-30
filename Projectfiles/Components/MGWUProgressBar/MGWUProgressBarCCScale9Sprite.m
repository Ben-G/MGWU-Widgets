//
//  MGWUProgressBarCCScale9Sprite.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 29/11/13.
//
//

#import "MGWUProgressBarCCScale9Sprite.h"
#import "MGWUCCScale9Sprite.h"
#import "MGWUProgressBar_Protected.h"

@implementation MGWUProgressBarCCScale9Sprite

- (id)initProtectedWithFile:(NSString *)file capInsets:(CGRect)capInsets {
    self = [super init];
    
    if (self) {
        self.contentNode = [MGWUCCScale9Sprite spriteWithFile:@"notification-box.png" capInsets:CGRectZero];
        [self addChild:self.contentNode];
        self.contentNode.anchorPoint = ccp(0, 0);
        self.contentNode.position = ccp(0, 0);
        self.contentNode.contentSize = CGSizeZero;
    }
    
    return self;
}

#pragma mark - overriden methods

//- (void)redraw:(BOOL)animated {
//    [super redraw:animated];
//    
//    if (self.currentDisplayValue == 0) {
//        self.visible = FALSE;
//    } else {
//        self.visible = TRUE;
//    }
//}

@end
