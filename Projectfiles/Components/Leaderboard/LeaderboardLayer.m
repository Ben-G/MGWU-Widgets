//
//  LeaderboardLayer.m
//  MGWU_RecapScreen
//
//  Created by Benjamin Encz on 8/10/13.
//
//

#import "LeaderboardLayer.h"
#import <mgwuSDK/MGWU.h>

@implementation LeaderboardLayer

- (void)onEnterTransitionDidFinish {
    [MGWU getHighScoresForLeaderboard:@"" withCallback:@selector(scoresLoaded:) onTarget:self];
}

- (void)scoresLoaded:(NSDictionary *)scores {
    CCLOG(@"Test");
}

@end
