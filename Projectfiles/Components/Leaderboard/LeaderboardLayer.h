//
//  LeaderboardLayer.h
//  MGWU_RecapScreen
//
//  Created by Benjamin Encz on 8/10/13.
//
//

#import "CCLayer.h"

@interface LeaderboardLayer : CCScene
/**
 Initialize with a target and a selector that is be called when the 
 'Main Menu'-Button is pressed.
 */
- (id)initWithTarget:(id)target selector:(SEL)selector;

@end
