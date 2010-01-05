//
//  BCSlidingWindowLayerAppDelegate.h
//  BCSlidingWindowLayer
//
//  Created by Jeremy Knope on 1/4/10.
//  Copyright 2010 Buttered Cat Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class BCSlidingWindowLayer;

@interface BCSlidingWindowLayerAppDelegate : NSObject
{
    NSWindow *window;
	BCSlidingWindowLayer *sprite;
}

@property (assign) IBOutlet NSWindow *window;

@end
