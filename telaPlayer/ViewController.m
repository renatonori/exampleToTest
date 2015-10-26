//
//  ViewController.m
//  telaPlayer
//
//  Created by Renato Ioshida on 10/13/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//

#import "ViewController.h"
#import "OpcoesSourcesViewController.h"
#import "AlphaVerticalSlideTransition.h"

@interface ViewController ()

@property CGFloat oldY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.letraMusicaTextView.delegate =self;
    [self.letraMusicaTextView setContentInset:UIEdgeInsetsMake(self.letraMusicaTextView.frame.size.height/2, self.letraMusicaTextView.contentInset.left, self.letraMusicaTextView.contentInset.bottom, self.letraMusicaTextView.contentInset.right)];
[self.letraMusicaTextView scrollRectToVisible:CGRectMake(0,0,1,1) animated:NO];
//    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //correção bug para uitextview que começava no fim
    
    [self.letraMusicaTextView setScrollEnabled:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(![self isBouncing:scrollView]){
        if([self scrollViewGoingToBottom:scrollView]){
            if(self.imagemArtistaBackground.alpha >= 0.3f){
                self.imagemArtistaBackground.alpha = self.imagemArtistaBackground.alpha - 0.03f;
            }
        }else if(self.imagemArtistaBackground.alpha < 1.f){
            self.imagemArtistaBackground.alpha = self.imagemArtistaBackground.alpha + 0.03f;
        }
    }
}
-(BOOL)scrollViewGoingToBottom:(UIScrollView *)scrollView{

    if(self.oldY <= scrollView.contentOffset.y){
        self.oldY = scrollView.contentOffset.y;
        return YES;
    }else{
        self.oldY = scrollView.contentOffset.y;
        return NO;
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (BOOL)isBouncing:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < 0) {
        return YES;
    }
    
    if (scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height)) {
        return YES;
    }
    return NO;
}
- (IBAction)iniciarMusica:(id)sender {
    
    OpcoesSourcesViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"OpcoesSourcesViewControllerID"];
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];
    
}

#pragma mark UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    AlphaVerticalSlideTransition *transition = [AlphaVerticalSlideTransition new];
    transition.presenting = YES;
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    AlphaVerticalSlideTransition *transition = [AlphaVerticalSlideTransition new];
    transition.presenting = NO;
    return transition;
    
}

@end
