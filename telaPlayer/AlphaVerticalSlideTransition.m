//
//  AlphaVerticalSlideTransition.m
//  Moymer
//
//  Created by vham on 20/08/15.
//  Copyright (c) 2015 Mobwise. All rights reserved.
//

#import "AlphaVerticalSlideTransition.h"

@implementation AlphaVerticalSlideTransition
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}



-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    
    
    const BOOL isUnwinding = [toController presentedViewController] == fromController;
    const BOOL isPresenting = !isUnwinding;
    
    
    UIViewController *presentedController = isPresenting ? toController : fromController;//from
    
    [containerView addSubview:presentedController.view];
    [containerView bringSubviewToFront:presentedController.view];
    
    if(isPresenting)
    {
        
        presentedController.view.frame = CGRectMake(0, 0, transitionContext.containerView.frame.size.width, transitionContext.containerView.frame.size.height);
        
        UIView *background = [presentedController.view viewWithTag:1];
        UIView *body = [presentedController.view viewWithTag:2];
        UIView *containerOptional = [presentedController.view viewWithTag:3];
        
        
        CGRect startFrame = CGRectMake( body.frame.origin.x, body.frame.origin.y + 800, body.frame.size.width, body.frame.size.height);
        CGRect startFrameContainer = CGRectMake( containerOptional.frame.origin.x, containerOptional.frame.origin.y + 800, containerOptional.frame.size.width, containerOptional.frame.size.height);
        
        
        CGRect endFrame =  body.frame;
        CGRect endFrameContainer = containerOptional.frame;
        
        body.frame = startFrame;
        containerOptional.frame = startFrameContainer;
        
        background.alpha = 0;
        
        
        [UIView animateWithDuration: [self transitionDuration: transitionContext] animations:^{
            body.frame = endFrame;
            containerOptional.frame = endFrameContainer;
            background.alpha = 1;
        } completion: ^(BOOL finished){
            if(finished)
                [transitionContext completeTransition: ![transitionContext transitionWasCancelled]];
        }];
    }
    else
    {
        presentedController.view.frame = CGRectMake(0, 0, transitionContext.containerView.frame.size.width, transitionContext.containerView.frame.size.height);
        
        
        UIView *background = [presentedController.view viewWithTag:1];
        UIView *body = [presentedController.view viewWithTag:2];
        UIView *containerOptional = [presentedController.view viewWithTag:3];
        
        
        //anima com frame
        CGRect endFrame = body.frame;
        CGRect endFrameContainer = containerOptional.frame;
        
        endFrame.origin.y += 800;
        endFrameContainer.origin.y += 800;
        
        background.alpha = 1;
        
        [UIView animateWithDuration: [self transitionDuration: transitionContext] animations:^{
            
            body.frame = endFrame;
            containerOptional.frame = endFrameContainer;
            background.alpha = 0;
            
        } completion:^(BOOL finished) {
            if(finished)
                [transitionContext completeTransition: ![transitionContext transitionWasCancelled]];
        }];
    }
}


@end