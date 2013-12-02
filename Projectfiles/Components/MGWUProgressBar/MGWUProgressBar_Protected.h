//
//  MGWUProgressBar_Protected.h
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 29/11/13.
//
//

#import "MGWUProgressBar.h"

@interface MGWUProgressBar ()

- (void)redraw:(BOOL)animated;
- (void)redrawWithTargetValue:(CGFloat)targetValue;
- (CGSize)calculateFutureSizeWithValue:(CGFloat)value;

@property (nonatomic, assign) CGFloat currentDisplayValue;
@property (nonatomic, strong) CCNode *contentNode;

@end
