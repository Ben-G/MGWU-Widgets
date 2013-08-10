//
//  MGWU.h
//  mgwuSDK
//
//  Created by Ashu Desai on 4/7/12.
//  Copyright (c) 2012 makegameswithus inc. All rights reserved.
//
//
//  Complete documentation for the mgwuSDK is available at https://github.com/adesai/mgwuSDK
//
//  Contains open source code and SDKs from Crashlytics, Inc. (SecureUDID, CrashlyticsSDK), Matej Bukovinski (MBProgressHUD), Stig Brautaset (SBJson), Ray Wenderlich (iAPHelper), Facebook (FacebookConnect iOS), Tapjoy (TapjoyConnect), Arash Payan (Appirater), Benjamin Borowski and Stephane Peter (GKAchievementNotification) thank you to all!
//
//  MGWU_BUILD_NUMBER 376
//

#import <UIKit/UIKit.h>

@interface MGWU : UIViewController


/////////////////////////////////////////////////////////////////////////////////
//
//General Setup:
//
+ (void)loadMGWU:(NSString*)dev;
+ (void)dark;
+ (void)debug; //Depricated, has no use

/////////////////////////////////////////////////////////////////////////////////
//
//Other Initializations
//
+ (void)useCrashlytics; //Depricated do not use
+ (void)useCrashlyticsWithApiKey:(NSString*)apiKey;
+ (void)setTapjoyAppId:(NSString*)tapappid andSecretKey:(NSString*)tapseckey;
+ (void)setAppiraterAppId:(NSString*)appappid andAppName:(NSString*)appappname;
+ (void)launchAppStorePage;

/////////////////////////////////////////////////////////////////////////////////
//
//Hipmob
//
+ (void)setHipmobAppId:(NSString*)hipmobappid andAwayMessage:(NSString*)awaymessage;
+ (void)displayHipmob; //*


/////////////////////////////////////////////////////////////////////////////////
//
//Push Notifications
//
+ (void)setReminderMessage:(NSString*)message;
+ (UILocalNotification*)sendPushMessage:(NSString*)message afterMinutes:(int)minutes withData:(NSDictionary*)data;
+ (void)gotLocalPush:(UILocalNotification*)localNotif;

+ (void)registerForPush:(NSData *)tokenId;
+ (void)gotPush:(NSDictionary *)userInfo;
+ (void)failedPush:(NSError *)error;


/////////////////////////////////////////////////////////////////////////////////
//
//Alert Player
//
+ (void)showMessage:(NSString*)message withImage:(NSString*)imageName;
+ (void)showError;

/////////////////////////////////////////////////////////////////////////////////
//
//More Games:
//
+ (void)displayCrossPromo;
+ (void)display; //Depricated DO NOT USE!!!!


/////////////////////////////////////////////////////////////////////////////////
//
//About:
//
+ (void)displayAboutPage; //*
//For Android use only:
+ (void)displayAboutMessage:(NSString*)message andTitle:(NSString*)title;

/////////////////////////////////////////////////////////////////////////////////
//
//Analytics:
//
+ (void)logEvent:(NSString*)eventName;
+ (void)logEvent:(NSString*)eventName withParams:(NSDictionary*)params;


/////////////////////////////////////////////////////////////////////////////////
//
//Global High Scores:
//
+ (void)submitHighScore:(int)score byPlayer:(NSString*)player forLeaderboard:(NSString*)leaderboard;
+ (NSDictionary*)getMyHighScoreForLeaderboard:(NSString*)l;
+ (void)getHighScoresForLeaderboard:(NSString*)l withCallback:(SEL)m onTarget:(id)t;
+ (void)submitHighScore:(int)score byPlayer:(NSString*)player forLeaderboard:(NSString *)leaderboard withCallback:(SEL)m onTarget:(id)t;
//Depricated
//+ (void)getHighScoresForMultipleLeaderboards:(NSArray*)l withCallback:(SEL)m onTarget:(id)t;


/////////////////////////////////////////////////////////////////////////////////
//
//Achievements:
///
+ (void)submitAchievements:(NSArray*)achievements;
+ (void)getAchievementsWithCallback:(SEL)m onTarget:(id)t;


/////////////////////////////////////////////////////////////////////////////////
//
//Encrypted NSUserDefaults
//
+ (void)setObject:(id)object forKey:(NSString*)keyword;
+ (id)objectForKey:(NSString*)keyword;
+ (void)removeObjectForKey:(NSString*)keyword;


/////////////////////////////////////////////////////////////////////////////////
//
//Facebook
//
//General
+ (void)preFacebook;
+ (void)noFacebookPrompt;
+ (BOOL)isFacebookActive;
+ (NSString*)getUsername;
+ (void)likeAppWithPageId:(NSString*)pageid;
+ (void)likeMGWU;
+ (void)shareWithTitle:(NSString*)title caption:(NSString*)caption andDescription:(NSString*)description;
+ (BOOL)handleURL:(NSURL*)url;

//Open Graph (discuss with Ashu before using)
+ (BOOL)isOpenGraphActive;
+ (void)toggleOpenGraph;
+ (void)publishOpenGraphAction:(NSString*)action withParams:(NSDictionary *)ogparams;
+ (NSString*)fbidFromUsername:(NSString*)friendname;

//Single Player Games
+ (void)loginToFacebook;
+ (void)loginToFacebookWithCallback:(SEL)m onTarget:(id)t;
+ (NSMutableArray *)playingFriends;
+ (BOOL)canInviteFriends;
+ (void)inviteFriendsWithMessage:(NSString*)message; //*

//Multiplayer Games
+ (void)forceFacebook;
+ (NSMutableArray *)friendsToInvite;
+ (void)inviteFriend:(NSString*)friendname withMessage:(NSString*)message; //*
+ (BOOL)isFriend:(NSString*)friendname;
+ (void)postToFriendsWall:(NSString*)friendname withTitle:(NSString*)title caption:(NSString*)caption andDescription:(NSString*)description; //*

/////////////////////////////////////////////////////////////////////////////////
//
//Twitter
+ (BOOL)isTwitterActive;
+ (void)postToTwitter:(NSString*)message; //*
+ (void)postToTwitter:(NSString*)message withImage:(UIImage*)image;

/////////////////////////////////////////////////////////////////////////////////
//
//Facebook Native
+ (BOOL)isFacebookNativeActive;
+ (void)postToFacebook:(NSString*)message withImage:(UIImage*)image;

/////////////////////////////////////////////////////////////////////////////////
//
//Async multiplayer
//
+ (void)getMyInfoWithCallback:(SEL)m onTarget:(id)t;
+ (void)move:(NSDictionary*)move withMoveNumber:(int)moveNumber forGame:(int)gameId withGameState:(NSString*)gameState withGameData:(NSDictionary*)gameData againstPlayer:(NSString*)friendId withPushNotificationMessage:(NSString*)message withCallback:(SEL)m onTarget:(id)t;
+ (void)getRandomGameWithCallback:(SEL)m onTarget:(id)t;
+ (void)getGame:(int)gameId withCallback:(SEL)m onTarget:(id)t;
+ (void)deleteGame:(int)gameId withCallback:(SEL)m onTarget:(id)t;
+ (void)getPlayerWithUsername:(NSString*)user withCallback:(SEL)m onTarget:(id)t;
+ (void)getAchievementsForPlayer:(NSString*)playername withCallback:(SEL)m onTarget:(id)t;
+ (void)getRandomPlayerWithCallback:(SEL)m onTarget:(id)t;

/////////////////////////////////////////////////////////////////////////////////
//
//Multiplayer Messaging
//
+ (void)getMessagesWithFriend:(NSString*)friendId andCallback:(SEL)m onTarget:(id)t;
+ (void)sendMessage:(NSString*)message toFriend:(NSString*)friendId andCallback:(SEL)m onTarget:(id)t;

/////////////////////////////////////////////////////////////////////////////////
//
//Multiplayer File Sending
//
+ (void)useS3WithAccessKey:(NSString*)accessKey andSecretKey:(NSString*)secretKey;
+ (void)getFileWithExtension:(NSString*)ext forGame:(int)gameId andMove:(int)moveNumber withCallback:(SEL)m onTarget:(id)t;

/////////////////////////////////////////////////////////////////////////////////
//
//In App Purchases
//
+ (void)useIAPs;

+ (void)testBuyProduct:(NSString*)productId withCallback:(SEL)m onTarget:(id)t;
+ (void)testRestoreProducts:(NSArray*)products withCallback:(SEL)m onTarget:(id)t;

+ (void)buyProduct:(NSString*)productId withCallback:(SEL)m onTarget:(id)t; //*
+ (void)restoreProductsWithCallback:(SEL)m onTarget:(id)t;


/////////////////////////////////////////////////////////////////////////////////
//
//For Testing
//
+ (void)test;
+ (void)local;
+ (void)invisiblePause;

@end
