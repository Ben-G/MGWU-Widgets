//
//  PopupProvider.h
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import <Foundation/Foundation.h>
#import "PopUp.h"

@interface PopupProvider : NSObject

/* analogous to UIAlertViewDelegate, this popup will call the selector on the target. The CCControllButton which is seleced, is passed to the selector as the "sender". The tag of that CCControlButton matches the index of the button title*/
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles;

/* Popup with input field. Value of inputField can be accessed over 'textFieldText' property of the popup */
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField;

/* Popup with input field and custom size */
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField;

/* Popup with input field, custom size and custom position */
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize atPosition:(CGPoint)position target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField;

/*
 PopUp with custom image and custom size
 */
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles;

/*
 PopUp with custom image and automatic size (PopUp is as big as background Sprite)
 */
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles;

/*
 PopUp with custom image and automatic size (PopUp is as big as background Sprite) and custom button images
 */
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles;

/*
 Fully custom popup.
 */
+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize atPosition:(CGPoint)position backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField;

@end
