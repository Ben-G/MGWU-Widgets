//
//  LeaderboardLayer.m
//  MGWU_RecapScreen
//
//  Created by Benjamin Encz on 8/10/13.
//
//

#import "LeaderboardLayer.h"
#import <mgwuSDK/MGWU.h>

#define FONT_NAME @"Avenir-Black" 
#define FONT_SIZE 12
#define FONT_COLOR ccc3(255, 0, 0)

@implementation LeaderboardLayer
{
    // label for player's personal best
    CCLabelTTF *userBestLabel;
    // stores labels for the top 10
    NSMutableArray *scoreBoardLabels;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        scoreBoardLabels = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    
    // load scores
    //[MGWU submitHighScore:5100 byPlayer:@"Test" forLeaderboard:@"DefaultLeaderboard"];
    [MGWU getHighScoresForLeaderboard:@"DefaultLeaderboard" withCallback:@selector(scoresLoaded:) onTarget:self];

    // add background color
    CCLayerColor* colorLayer = [CCLayerColor layerWithColor:ccc4(255, 255, 255,255)];
    colorLayer.size = self.contentSize;
    colorLayer.anchorPoint = ccp(0,0);
    [self addChild:colorLayer z:0];
    
    // player's best
    userBestLabel = [CCLabelTTF labelWithString:@"Your Personal Best: No Score submitted so far." fontName:FONT_NAME fontSize:FONT_SIZE];
    userBestLabel.dimensions = CGSizeMake(self.contentSize.width, userBestLabel.fontSize * 1.5);
    userBestLabel.color = FONT_COLOR;
    userBestLabel.position = ccp((self.contentSize.width / 2) , self.contentSize.height - 20);
    userBestLabel.horizontalAlignment = kCCTextAlignmentCenter;
    [self addChild:userBestLabel];
    
    int yPosition = userBestLabel.position.y - userBestLabel.dimensions.height - 20;
    
    // 10 global best
    for (int i = 0; i < 10; i++)
    {
        CCLabelTTF *entryLabel = [CCLabelTTF labelWithString:@"" fontName:FONT_NAME fontSize:FONT_SIZE];
        entryLabel.dimensions = CGSizeMake(self.contentSize.width, userBestLabel.fontSize * 1.5);
        entryLabel.position = ccp((self.contentSize.width / 2), yPosition);
        entryLabel.color = FONT_COLOR;
        entryLabel.horizontalAlignment = kCCTextAlignmentCenter;
        
        yPosition -= entryLabel.dimensions.height;
        [self addChild:entryLabel];
        
        [scoreBoardLabels addObject:entryLabel];
    }
    
}

- (void)scoresLoaded:(NSDictionary *)scores
{
    NSArray *globalScoreboard = [scores objectForKey:@"all"];
    NSDictionary *personalEntry = [scores objectForKey:@"user"];
    
    if (!personalEntry)
    {
        userBestLabel.string = @"Your Personal Best: No Score submitted so far.";
    } else
    {
        userBestLabel.string = [NSString stringWithFormat:@"Your Personal Best: %@", personalEntry[@"score"]];
    }
    
    unsigned int amountOfEntries = MIN((unsigned int) 10, [globalScoreboard count]);
    
    for (unsigned int i = 0; i < amountOfEntries; i++)
    {
        int rank = i+1;
        NSDictionary *scoreBoardEntry = globalScoreboard[i];
        CCLabelTTF *entryLabel = scoreBoardLabels[i];
       
        if (rank == [personalEntry[@"rank"] intValue])
        {
            entryLabel.string = [NSString stringWithFormat:@"%d. %@ (you) : %@", rank, scoreBoardEntry[@"name"], scoreBoardEntry[@"score"]];
        } else
        {
            entryLabel.string = [NSString stringWithFormat:@"%d. %@ : %@", rank, scoreBoardEntry[@"name"], scoreBoardEntry[@"score"]];
        }
    }
}

@end
