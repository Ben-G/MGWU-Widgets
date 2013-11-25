# MakeGamesWithUs Widgets

This project contains multiple cocos2D components which can easily be used in many different games. Currently following components are contained:

- *ScoreboardEntry:* A BitmapFont based score display. Can change scores animated
- *LeaderboardLayer:* A simple Highscore-Board. It uses the MGWU Framework to download highscores and displays the personal highscore and the global top ten.
- *CCMenuBlocking:* A CCMenu subclass that swallows all touches
- *PopUp:* A modal Popup (swallows touches). Can be initialized with a display text, a background image and multiple buttons.
- *InputPopUp:* A modal Popup, that allows the user to enter a text.
- *NotificationBox:* A box that displays a notification at the top of the screen.

The project provides demo scenes for each component that demonstrate how to use them.

##Popup
Provides a customizable cocos2d Popup:
![image](https://static.makegameswith.us/gamernews_images/cMgi7u9PIl/customAlert.png)

Basic usage:

	#import "Popup.h"
	
	[...]
	
	- (void)showPopup 
	{
	    NSString *popUpMessage = @"Submit score to \n global Leaderboard";
	    popup = [PopUp showWithMessage:popUpMessage okButtonTitle:@"Ok" otherButtonTitles:@[@"Cancel"] target:self selector:@selector(popUpButtonClicked:) showsInputField:TRUE];
	}
	
	- (void)popUpButtonClicked:(int)buttonIndex
	{
	    if (buttonIndex == OK_BUTTON_INDEX)
	    {
	        // OK button selected
	        contentLabel.string = [popup textFieldText];
	    }
	   
	    [popup dismiss];
	}
	
More details [here.](https://www.makegameswith.us/gamernews/282/mgwu-popup-customizable-alertview-for-cocos2d)

##Notification Box
Presents a notification at the top of the screen for multiple seconds, animates appearance and disappearance:

![image](https://s3.amazonaws.com/mgwu-misc/Widgets/NotificationBox.png)

Basic usage:

	- (void)showNotification
	{
	    NSString *notificationMessage = @"This is a long test notification";
	    [NotificationBox presentNotificationBoxOnNode:self withText:notificationMessage duration:2.f];
	}