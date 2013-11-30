//
//  MGWUProgressBarDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 29/11/13.
//
//

#import "MGWUProgressBarDemoLayer.h"
#import "MGWUProgressBar.h"

@implementation MGWUProgressBarDemoLayer {
    MGWUProgressBar *progressBar;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        CCLabelTTF *fillProgressBarLabel = [CCLabelTTF labelWithString:@"Fill ProgressBar" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *fillProgressBarMenuItem = [CCMenuItemLabel itemWithLabel:fillProgressBarLabel target:self selector:@selector(fillProgressBar)];
        
        CCLabelTTF *emptyProgressBarLabel = [CCLabelTTF labelWithString:@"Empty ProgressBar" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *emptyProgressBarMenuItem = [CCMenuItemLabel itemWithLabel:emptyProgressBarLabel target:self selector:@selector(emptyProgressBar)];
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:fillProgressBarMenuItem, emptyProgressBarMenuItem, backItem, nil];
        [menu alignItemsVertically];
        
        [self addChild:menu];
        
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
        
        progressBar = [MGWUProgressBar progressBarWithStyle:MGWUProgressBarStyleHorizontal fillingColor:ccc4f(255, 0, 0, 255)];
        
        progressBar.position = ccp(50, (self.contentSize.height/3) * 2);
        progressBar.maximumSize = CGSizeMake(self.contentSize.width - 2 * progressBar.position.x, 50);
        progressBar.maximumValue = 100.f;
        progressBar.changeValueAnimated = TRUE;
        
        [self addChild:progressBar];
    }
    
    return self;
}

- (void)fillProgressBar
{
    progressBar.currentValue = (arc4random()%100) * 1.f;
}

- (void)emptyProgressBar {
    progressBar.currentValue = 0.f;
}

- (void)back
{
    [[CCDirector sharedDirector] popScene];
}

@end
