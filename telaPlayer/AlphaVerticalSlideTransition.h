//
//  AlphaVerticalSlideTransition.h
//  telaPlayer
//
//  Created by Renato Ioshida on 10/26/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface AlphaVerticalSlideTransition :NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isPresenting) BOOL presenting;
@end
