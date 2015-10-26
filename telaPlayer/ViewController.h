//
//  ViewController.h
//  telaPlayer
//
//  Created by Renato Ioshida on 10/13/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate,UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *letraMusicaBottomDistanceConstraint;
@property (strong, nonatomic) IBOutlet UIView *controleInicial;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *videoViewHeightConstraint;
@property (strong, nonatomic) IBOutlet UITextView *letraMusicaTextView;
@property (strong, nonatomic) IBOutlet UIImageView *imagemArtistaBackground;

@end

