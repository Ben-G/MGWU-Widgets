//
//  MGWUProgressBar.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 29/11/13.
//
//

#import "MGWUProgressBar.h"
#import "MGWUProgressBarCCScale9Sprite.h"
#import "MGWUProgressBar_Protected.h"

#define MAXIMUMSIZE_DEFAULT CGSizeZero
#define MAXIMUMVALUE_DEFAULT 0

@implementation MGWUProgressBar

+ (MGWUProgressBar*)progressBarWithStyle:(MGWUProgressBarStyle)style fillingColor:(MGWUCCScale9Sprite*)fillingColor {
    return nil;
}

+ (MGWUProgressBar*)progressBarWithStyle:(MGWUProgressBarStyle)style fillingImage:(MGWUCCScale9Sprite*)fillingImage {
    
    MGWUProgressBar *actualProgressBar = [[MGWUProgressBarCCScale9Sprite alloc] initProtectedWithFile:nil capInsets:CGRectZero];
    actualProgressBar.barStyle = style;
    
    return actualProgressBar;
}

#pragma mark - Initialization

- (id)init {
    self = [super init];
    
    if (self) {
        self.maximumSize = MAXIMUMSIZE_DEFAULT;
        self.maximumValue = MAXIMUMVALUE_DEFAULT;
    }
    
    return self;
}

#pragma mark - Setter Overriding

- (void)setMaximumSize:(CGSize)maximumSize {
    _maximumSize = maximumSize;
    self.contentSize = maximumSize;
}

- (void)setCurrentValue:(NSInteger)currentValue {
    if (_currentValue != currentValue) {
        _currentValue = currentValue;
        
        if ((CGSizeEqualToSize(self.maximumSize, MAXIMUMSIZE_DEFAULT)) || (self.maximumValue == MAXIMUMVALUE_DEFAULT)) {
            // bar cannot be drawn if maximumSize or maximumValue are not set, raise exception:
            @throw @"maximumSize and maximumValue for MGWUProgressBar need to be set, before currentValue can be set!";
        }
        
        [self redraw:self.changeValueAnimated];
    }
}

#pragma mark - Private Methods

- (void)redraw:(BOOL)animated {
    // calculate new size
    CGFloat progressFraction = (self.currentValue*1.f) / (self.maximumValue*1.f);
    CGSize futureSize = CGSizeZero;
    
    if (self.barStyle == MGWUProgressBarStyleHorizontal) {
        futureSize = CGSizeMake(self.maximumSize.width * progressFraction, self.maximumSize.height);
    } else if (self.barStyle == MGWUProgressBarStyleVertical) {
        futureSize = CGSizeMake(self.maximumSize.width, self.maximumSize.height * progressFraction);
    }
    
    if (animated) {
        
    } else {
        self.contentSize = self.maximumSize;
        self.contentNode.contentSize = futureSize;
    }
}

@end
