//
//  CCLabelTTF+adjustToFitRequiredSize.h
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 6/16/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//

#import "CCLabelTTF.h"

/**
 This category adds automatic font-size selection to a CCLabelTTF.
 You simply choose the desired contentSize (currently only the width is respected).
 **/

@interface CCLabelTTF (adjustToFitRequiredSize)

- (void)adjustToFitRequiredSize:(CGSize)size;

@end
