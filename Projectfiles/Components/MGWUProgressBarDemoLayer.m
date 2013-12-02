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
    MGWUProgressBar *progressBar1;
    MGWUProgressBar *progressBar2;
    MGWUProgressBar *progressBar3;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        // setting up a progress bar with a solid color
        progressBar1 = [MGWUProgressBar progressBarWithStyle:MGWUProgressBarStyleHorizontal fillingColor:ccc4f(1.f, 0, 0, 1.f)];
        progressBar1.position = ccp(50, (self.contentSize.height/4) * 3);
        progressBar1.maximumSize = CGSizeMake(self.contentSize.width - 2 * progressBar1.position.x, 50);
        progressBar1.maximumValue = 100.f;
        progressBar1.changeValueAnimated = TRUE;
        [self addChild:progressBar1];
        
        
        // setting up a progress bar with a 9-patch image
        progressBar2 = [MGWUProgressBar progressBarWithStyle:MGWUProgressBarStyleHorizontal fillingImage:@"notification-box.png" capInsets:CGRectMake(1, 1, 13, 48)];
        progressBar2.position = ccp(50, (self.contentSize.height/4) * 2);
        progressBar2.maximumSize = CGSizeMake(self.contentSize.width - 2 * progressBar1.position.x, 50);
        progressBar2.maximumValue = 100.f;
        progressBar2.changeValueAnimated = TRUE;
        [self addChild:progressBar2];

    
        // setting up a progress bar with a sprite that will be revealed gradually
        progressBar3 = [MGWUProgressBar progressBarWithStyle:MGWUProgressBarStyleHorizontal revealingSprite:@"metercolors.png"];
        progressBar3.position = ccp(50, (self.contentSize.height/4) * 1);
        progressBar3.maximumValue = 100.f;
        progressBar3.changeValueAnimated = TRUE;
        [self addChild:progressBar3];
        
        CCLabelTTF *fillProgressBarLabel = [CCLabelTTF labelWithString:@"Fill ProgressBar" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *fillProgressBarMenuItem = [CCMenuItemLabel itemWithLabel:fillProgressBarLabel target:self selector:@selector(fillProgressBar)];
        
        CCLabelTTF *emptyProgressBarLabel = [CCLabelTTF labelWithString:@"Empty ProgressBar" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *emptyProgressBarMenuItem = [CCMenuItemLabel itemWithLabel:emptyProgressBarLabel target:self selector:@selector(emptyProgressBar)];
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:fillProgressBarMenuItem, emptyProgressBarMenuItem, backItem, nil];
        [menu alignItemsVertically];
        
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
        
        [self addChild:menu];
    }
    
    return self;
}

- (void)fillProgressBar
{
    progressBar1.currentValue = (arc4random()%100) * 1.f;
    progressBar2.currentValue = (arc4random()%100) * 1.f;
    progressBar3.currentValue = (arc4random()%100) * 1.f;
}

- (void)emptyProgressBar {
    progressBar1.currentValue = 0.f;
    progressBar2.currentValue = 0.f;
    progressBar3.currentValue = 0.f;
}

- (void)back
{
    [[CCDirector sharedDirector] popScene];
}

@end
