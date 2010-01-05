//
//  BCSpriteSheetLayer.m
//  BCSlidingWindowLayer
//
//  Created by Jeremy Knope on 1/4/10.
//  Copyright 2010 Buttered Cat Software. All rights reserved.
//

#import "BCSpriteSheetLayer.h"


@implementation BCSpriteSheetLayer

// we don't want the layer holding the sprite image to animate it's movement, so rid of actions
// not sure if there's a better way, but seemed like easiest was to sub-class and override this
- (id<CAAction>)actionForKey:(NSString *)aKey
{
	return nil;
}

@end
