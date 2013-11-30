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

+ (MGWUProgressBar*)progressBarWithStyle:(MGWUProgressBarStyle)style fillingImage:(MGWUCCScale9Sprite*)fillingImage;

+ (MGWUProgressBar*)progressBarWithStyle:(MGWUProgressBarStyle)style fillingColor:(MGWUCCScale9Sprite*)fillingColor;

@property (nonatomic, assign) CGSize maximumSize;
@property (nonatomic, assign) CGFloat maximumValue;
@property (nonatomic, assign) CGFloat currentValue;
@property (nonatomic, assign) BOOL changeValueAnimated;
@property (nonatomic, assign) MGWUProgressBarStyle barStyle;

@end
