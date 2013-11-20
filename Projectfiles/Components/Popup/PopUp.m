//
//  PopUp.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "PopUp.h"
#import "PopUpProtected.h"
#import "CCControlButton.h"

#define KEYBOARD_HEIGHT_LANDSCAPE 162
#define KEYBOARD_HEIGHT_PORTRAIT  216

@interface PopUp()

@property (nonatomic, assign) CGPoint presentationPosition;

@end

@implementation PopUp

- (void)presentOnNode:(CCNode *)parentNode position:(CGPoint)pos
{
    // add to the most front layer
    [parentNode addChild:self z:MAX_INT];
    self.anchorPoint = ccp(0.5, 0.5);
    self.position = pos;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    if (self.textField) {
        [self.textField becomeFirstResponder];
    }
}

- (NSString *)textFieldText
{
    return self.textField.text;
}

- (void)dismiss
{
    [self.textField removeFromSuperview];
    [self removeFromParent];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

#pragma mark - Touch Swallowing

- (void)onEnter {
    [super onEnter];
    
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:(-1)*MAX_INT swallowsTouches:TRUE];
}

- (void)onExit {
    [super onExit];
    
    [[CCDirector sharedDirector].touchDispatcher removeDelegate:self];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{    
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchBegan:withEvent:)]) {
            [child ccTouchBegan:touch withEvent:event];
        }
    }
    
	return TRUE;
}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchCancelled:withEvent:)]) {
            [child ccTouchCancelled:touch withEvent:event];
        }
    }
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchMoved:withEvent:)]) {
            [child ccTouchMoved:touch withEvent:event];
        }
    }
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchEnded:withEvent:)]) {
            [child ccTouchEnded:touch withEvent:event];
        }
    }
}


#define DEFAULT_FONT_COLOR ccc3(0, 0, 0)
#define WHITE_FONT_COLOR ccc3(255, 255, 255)
#define DEFAULT_FONT @"Avenir-Black"

#define DEFAULT_BUTTON_IMAGE @"button.png"
#define DEFAULT_OK_BUTTON_IMAGE @"okbutton.png"
#define DEFAULT_BACKGROUND_IMAGE @"background.png"

#define VERTICAL_MARGIN 10
#define BUTTON_HEIGHT 30

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles target:(id)target selector:(SEL)selector
{
    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles showsInputField:FALSE size:AUTOSIZING_CONTENT_SIZE atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:nil target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles target:(id)target selector:(SEL)selector showsInputField:(BOOL)showsInputField
{
    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles showsInputField:showsInputField size:AUTOSIZING_CONTENT_SIZE atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:nil target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size target:(id)target selector:(SEL)selector
{
    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles showsInputField:showsInputField size:size atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:nil target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size atPosition:(CGPoint)position target:(id)target selector:(SEL)selector {
    
    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles showsInputField:showsInputField size:size atPosition:position backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:nil target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles size:(CGSize)size backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector {
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles size:backgroundImageSprite.contentSize backgroundImage:backgroundImage target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector {
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles showsInputField:FALSE size:backgroundImageSprite.contentSize atPosition:CGPointZero backgroundImage:backgroundImage buttonImage:nil target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector {
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles size:backgroundImageSprite.contentSize backgroundImage:backgroundImage target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector showsInputField:(BOOL)showsInputField {

    return [PopUp showWithMessage:message okButtonTitle:okButtonTitle otherButtonTitles:otherButtonTitles showsInputField:showsInputField size:AUTOSIZING_CONTENT_SIZE atPosition:CGPointZero backgroundImage:backgroundImage buttonImage:buttonImage target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles showsInputField:(BOOL)showsInputField
 size:(CGSize)size atPosition:(CGPoint)position backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector {
    
    // create a popup with a content size
    PopUp *popUp = [PopUp node];
    popUp.contentSize = size;
    
    NSMutableArray *buttonTitles = [[NSMutableArray alloc] init];
    [buttonTitles addObjectsFromArray:otherButtonTitles];
    [buttonTitles addObject:okButtonTitle];
    
    // defines if this popup shall autosize
    BOOL autosizing = FALSE;
    
    // if this popup is setup with default size, we want autosizing to be activated
    if (CGSizeEqualToSize(size, AUTOSIZING_CONTENT_SIZE)) {
        autosizing = TRUE;
    }
    
    popUp.backgroundScaleSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    CCNode *parentNode = [[CCDirector sharedDirector] runningScene];
    CGPoint presentationPosition;
    if (!CGPointEqualToPoint(CGPointZero, position))
    {
        presentationPosition = position;
    } else
    {
        presentationPosition = ccp((parentNode.contentSize.width / 2), (parentNode.contentSize.height / 2));
    }
    
    popUp.presentationPosition = presentationPosition;

    float requiredHeight = 0;
    
    CCLabelTTF *popUpContentLabel = nil;
    
    if (message)
    {
        // add a centered content label
        popUpContentLabel = [CCLabelTTF labelWithString:message
                                                           fontName:DEFAULT_FONT
                                                           fontSize:16];
        popUpContentLabel.color = DEFAULT_FONT_COLOR;
        popUpContentLabel.anchorPoint = ccp(0.5, 0);
        requiredHeight += popUpContentLabel.contentSize.height + 2 * VERTICAL_MARGIN;
        [popUp addChild:popUpContentLabel];
    }
    
    UITextField *textField = nil;
    
    if (showsInputField)
    {
        // add input field
        UIView *view = [[CCDirector sharedDirector] view];
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 0, 25)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.borderStyle     = UITextBorderStyleRoundedRect;
        textField.returnKeyType   = UIReturnKeyDone;
        textField.delegate        = popUp;
        
        requiredHeight += textField.bounds.size.height + VERTICAL_MARGIN;
        
        [view addSubview:textField];
        popUp.textField = textField;
    }
    
    // add the different buttons, automatically determine the size of the button by dividing the available space through the amount of buttons
    // left and right margins for the button(s)
    float buttonMargins = 10.f;
    // calculate the button size using the selected margin
    float buttonSize = (popUp.contentSize.width - 2 * buttonMargins - ([buttonTitles count] - 1) * buttonMargins) / [buttonTitles count];
    // set the initial xPosition to the defined margin
    float xPos = buttonMargins;
    
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    
    // add one button for each button title
    for (unsigned int i = 0; i < [buttonTitles count]; i++)
    {
        NSString *currentButtonTitle = buttonTitles[i];
        
        CCScale9Sprite *buttonBackgroundSprite = nil;
        ccColor3B buttonFontColor = DEFAULT_FONT_COLOR;
        
        if ([currentButtonTitle isEqualToString:okButtonTitle]) {
            if (buttonImage == nil) {
                buttonBackgroundSprite = [[CCScale9Sprite alloc] initWithFile:DEFAULT_OK_BUTTON_IMAGE];
                buttonFontColor = ccc3(255, 255, 255);
            } else {
                buttonBackgroundSprite = [[CCScale9Sprite alloc] initWithFile:buttonImage];
            }
        } else {
            if (buttonImage == nil) {
                buttonBackgroundSprite = [[CCScale9Sprite alloc] initWithFile:DEFAULT_BUTTON_IMAGE];
            } else {
                buttonBackgroundSprite = [[CCScale9Sprite alloc] initWithFile:buttonImage];
            }
        }
        
        CCControlButton *popUpButton = [[CCControlButton alloc] initWithBackgroundSprite:buttonBackgroundSprite];
        [popUpButton setTitleTTF:DEFAULT_FONT forState:CCControlStateNormal];
        [popUpButton setTitleTTFSize:16 forState:CCControlStateNormal];
        [popUpButton setTitleColor:buttonFontColor forState:CCControlStateNormal];
        [popUpButton setTitle:currentButtonTitle forState:CCControlStateNormal];
        popUpButton.anchorPoint = ccp(0, 0);
        popUpButton.preferredSize = CGSizeMake(buttonSize, BUTTON_HEIGHT);
        popUpButton.position = ccp(xPos, VERTICAL_MARGIN);
        [popUpButton addTarget:target action:selector forControlEvents:CCControlEventTouchUpInside];
        // set the tag to the index of the button
     
        if ([currentButtonTitle isEqualToString:okButtonTitle]) {
            popUpButton.tag = OK_BUTTON_INDEX;
        } else {
            popUpButton.tag = i;
        }
        
        [popUp addChild:popUpButton];
        [buttons addObject:popUpButton];
        
        // increase xPos variable to current x Position
        xPos += buttonSize + buttonMargins;
    }
    
    if ([buttonTitles count] > 0) {
        // height of buttons + button margin
        requiredHeight += BUTTON_HEIGHT + VERTICAL_MARGIN;
    }
    
    if (autosizing) {
        popUp.contentSize = CGSizeMake(popUp.contentSize.width, requiredHeight);
    }
    
    int textFieldWidth = (int) (0.8 * popUp.contentSize.width);
    int posX = presentationPosition.x - (textFieldWidth / 2);
    CGPoint textFieldPosition = ccp(posX, presentationPosition.y - (popUp.contentSize.height/2) + textField.frame.size.height + BUTTON_HEIGHT + VERTICAL_MARGIN + VERTICAL_MARGIN);
    CGPoint textFieldPositionUI = [[CCDirector sharedDirector] convertToUI:textFieldPosition];
    
    textField.frame = CGRectMake(textFieldPositionUI.x, textFieldPositionUI.y, 0.8 * popUp.contentSize.width, 25);
    
    popUpContentLabel.position = ccp(popUp.contentSize.width / 2, popUp.contentSize.height - popUpContentLabel.contentSize.height - VERTICAL_MARGIN);
    
    
    BOOL landscape = FALSE;
    
    if ([[CCDirector sharedDirector] view].frame.size.width > [[CCDirector sharedDirector] view].frame.size.height) {
        landscape = TRUE;
    }
    
    int keyboardHeight = 0;
    
    if (landscape) {
        keyboardHeight = KEYBOARD_HEIGHT_LANDSCAPE;
    } else {
        keyboardHeight = KEYBOARD_HEIGHT_PORTRAIT;
    }
    
    CGSize sceneSize = [[[CCDirector sharedDirector] runningScene] contentSize];
    
    if (textField) {
        presentationPosition = ccp(presentationPosition.x, keyboardHeight + 0.5 * popUp.contentSize.height + 0.5 * (sceneSize.height - keyboardHeight - popUp.contentSize.height));
        
        CGPoint textFieldPositionUI = [popUp calculateTextFieldPosition:presentationPosition.y];
        textField.frame = CGRectMake(textFieldPositionUI.x, textFieldPositionUI.y, textField.frame.size.width, textField.frame.size.height);
    }
    
    popUp.presentationPosition = presentationPosition;
    
    // present the popup on the running scene
    [popUp presentOnNode:[[CCDirector sharedDirector] runningScene] position:presentationPosition];
    
    return popUp;
}

#pragma mark - Helpers

+ (CCScale9Sprite *)scaleSpriteWhiteBackgroundSolidBlackBorder
{
    return  [[CCScale9Sprite alloc] initWithFile:@"background.png" capInsets:CGRectMake(10, 10, 40, 40)];
}

- (CGPoint)calculateTextFieldPosition:(int)yPosition {
    int textFieldWidth = (int) (0.8 * self.contentSize.width);
    int posX = self.presentationPosition.x - (textFieldWidth / 2);
    CGPoint textFieldPosition = ccp(posX, yPosition - (self.contentSize.height/2) + self.textField.frame.size.height + BUTTON_HEIGHT + VERTICAL_MARGIN + VERTICAL_MARGIN);
    CGPoint textFieldPositionUI = [[CCDirector sharedDirector] convertToUI:textFieldPosition];
    
    return textFieldPositionUI;
}

#pragma mark - Keyboard Handling

- (void)keyboardWillShow:(NSNotification *)notification {    
    NSDictionary* info = [notification userInfo];
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [[[CCDirector sharedDirector] view] convertRect:keyboardRect fromView:nil];
    
    int newY = keyboardRect.size.height + 0.5 * self.contentSize.height + 0.5 * (self.parent.contentSize.height - keyboardRect.size.height - self.contentSize.height);
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:.3f position:ccp(self.presentationPosition.x, newY)];
    
    CGPoint textFieldPositionUI = [self calculateTextFieldPosition:newY];
    
    [UIView animateWithDuration:.35f animations:^{
        self.textField.frame = CGRectMake(textFieldPositionUI.x, textFieldPositionUI.y, self.textField.frame.size.width, self.textField.frame.size.height);
    }];
    
    [self runAction:moveTo];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:.3f position:ccp(self.presentationPosition.x, self.presentationPosition.y)];

    CGPoint textFieldPositionUI = [self calculateTextFieldPosition:self.presentationPosition.y];
    
    [UIView animateWithDuration:.35f animations:^{
        self.textField.frame = CGRectMake(textFieldPositionUI.x, textFieldPositionUI.y, self.textField.frame.size.width, self.textField.frame.size.height);
    }];
    
    [self runAction:moveTo];
}

#pragma mark - Orientation Handling

- (void)didRotate:(NSNotification *)notification {
    [self dismiss];
    [self presentOnNode:[[CCDirector sharedDirector] runningScene] position:self.presentationPosition];
}


@end
