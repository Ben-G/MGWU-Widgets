//
//  CCLabelTTF+adjustToFitRequiredSize.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 6/16/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//

#import "CCLabelTTF+adjustToFitRequiredSize.h"

@implementation CCLabelTTF (adjustToFitRequiredSize)


- (void)adjustToFitRequiredSize:(CGSize)size
{
    CGSize maximumSize = CGSizeMake(9999, 9999);
    CGSize myStringSize = maximumSize;
    int currentFontSize = self.fontSize+1;

    while (myStringSize.width > size.width)
    {
        UIFont *myFont = [UIFont fontWithName:self.fontName size:currentFontSize];
        myStringSize = [self.string sizeWithFont:myFont
                        constrainedToSize:maximumSize
                            lineBreakMode:UILineBreakModeWordWrap];
        
        currentFontSize--;
    }

    self.fontSize = currentFontSize;
}

@end
