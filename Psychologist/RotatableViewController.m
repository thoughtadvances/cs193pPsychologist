//
//  RotatableViewController.m
//  Psychologist
//
//  Created by admin on 15/D/12.
//  Copyright (c) 2012 ThoughtAdvances. All rights reserved.
//

#import "RotatableViewController.h"
#import "SplitViewBarButtonItemPresenter.h"

@interface RotatableViewController ()

@end

@implementation RotatableViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.splitViewController.delegate = self; // This is the delegate
}

- (id <SplitViewBarButtonItemPresenter>)splitViewBarButtonItemPresenter {
    // The SplitViewBarButtonItemPresenter is the detail view
    id detailViewController =
    [self.splitViewController.viewControllers lastObject];
    if (![detailViewController conformsToProtocol:
          @protocol(SplitViewBarButtonItemPresenter)]) {
        detailViewController = nil;
    }
    return detailViewController;
}

- (BOOL)splitViewController:(UISplitViewController *)svc
   shouldHideViewController:(UIViewController *)vc
              inOrientation:(UIInterfaceOrientation)orientation {
    // Hide the master if the detail implements
    //  @protocol(splitViewBarButtonItemPresenter)
    return [self splitViewBarButtonItemPresenter] ?
    UIInterfaceOrientationIsPortrait(orientation) : NO;
}

- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc {
    //
    barButtonItem.title = self.title; // Title of the UIViewController
    [self splitViewBarButtonItemPresenter].splitViewBarButtonItem =
    barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [self splitViewBarButtonItemPresenter].splitViewBarButtonItem = nil;
}

@end
