//
//  PopUpProtected.h
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#ifndef MGWU_Widgets_PopUpProtected_h
#define MGWU_Widgets_PopUpProtected_h

@interface PopUp() <UITextFieldDelegate> {

}

- (void)presentOnNode:(CCNode *)parentNode position:(CGPoint)pos;

@property (nonatomic, strong) UITextField *textField;

@end

#endif
