//
//  MGWUProgressBar.h
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 29/11/13.
//
//

#import "CCNode.h"
#import "MGWUCCScale9Sprite.h"

typedef NS_ENUM(NSInteger, MGWUProgressBarStyle) {
    MGWUProgressBarStyleHorizontal,
    MGWUProgressBarStyleVertical
};

@interface MGWUProgressBar : CCNode

+ (MGWUProgressBar*)progressBarWithStyle:(MGWUProgressBarStyle)style fillingImage:(NSString*)fillingImage capInsets:(CGRect)capInsets;

+ (MGWUProgressBar*)progressBarWithStyle:(MGWUProgressBarStyle)style fillingColor:(ccColor4F)fillingColor;

+ (MGWUProgressBar*)progressBarWithStyle:(MGWUProgressBarStyle)style revealingSprite:(NSString*)spriteFileName;

@property (nonatomic, assign) CGSize maximumSize;
@property (nonatomic, assign) CGFloat maximumValue;
@property (nonatomic, assign) CGFloat currentValue;
@property (nonatomic, assign) BOOL changeValueAnimated;
@property (nonatomic, assign) MGWUProgressBarStyle barStyle;

@end
