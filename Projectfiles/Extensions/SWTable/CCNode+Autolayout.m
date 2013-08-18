//
//  CCNode+Autolayout.m
//  SWGameLib
//
//
//  Copyright (c) 2010 Sangwoo Im
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  
//  Created by Sangwoo Im on 4/14/10.
//  Copyright 2010 Sangwoo Im. All rights reserved.
//

#import "CCNode+Autolayout.h"
#import "CCActionManager.h"
#import "CCDirector.h"
#import "CCGrid.h"

@implementation CCNode (Autolayout)

- (void)iterate
{
	// quick return if not visible
	if (!_visible)
		return;
	
	[self performSelector:@selector(layout)];
	
	kmGLPushMatrix();
	
	if ( _grid && _grid.active) {
		[_grid beforeDraw];
		[self transformAncestors];
	}
	
	[self transform];
	if ([self respondsToSelector:@selector(beforeDraw)]) {
		[self performSelector:@selector(beforeDraw)];
	}
	
	if(_children) {
		[self sortAllChildren];
		ccArray *arrayData = _children->data;
		NSUInteger i = 0;
		
		// draw children zOrder < 0
		for( ; i < arrayData->num; i++ ) {
			CCNode *child = arrayData->arr[i];
			if ( [child zOrder] < 0 )
				[child visit];
			else
				break;
		}
		
		// self draw
		[self draw];
		
		// draw children zOrder >= 0
		for( ; i < arrayData->num; i++ ) {
			CCNode *child =  arrayData->arr[i];
			[child visit];
		}
		
	} else
		[self draw];

	if ([self respondsToSelector:@selector(afterDraw)]) {
		[self performSelector:@selector(afterDraw)];
	}

    // reset for next frame
	_orderOfArrival = 0;

	if ( _grid && _grid.active)
		[_grid afterDraw:self];
	
	kmGLPopMatrix();
}

- (void)layoutChildren {}
- (void)layout {
	if (_isTransformDirty && _isInverseDirty) {
		[self layoutChildren];
		if (_grid && _grid.active) {
			self.grid = [[_grid class] gridWithSize:_grid.gridSize];
			self.grid.active = YES;
		}
	}
}

- (void)setNeedsLayout {
	_isTransformDirty = _isInverseDirty = YES;
}
@end


@implementation CCScene (Autolayout)

- (void)setNeedsLayout {
	self.contentSize = [[[CCDirector sharedDirector] view] frame].size;
	CCNode *child;
	CCARRAY_FOREACH(_children, child) {
		[child setNeedsLayout];
	}
}
@end