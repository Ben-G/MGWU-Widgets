//
//  PopUp.h
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "CCNode.h"
#import "CCNinePatchBackgroundNode.h"

@interface PopUp : CCNinePatchBackgroundNode <CCTouchOneByOneDelegate>

- (void)presentOnNode:(CCNode *)parentNode;
- (void)dismiss;
- (NSString *)textFieldText;

@end
