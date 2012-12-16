//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by admin on 6/D/12.
//  Copyright (c) 2012 ThoughtAdvances. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"

@interface PsychologistViewController ()
@property (nonatomic) int diagnosis;
@end

@implementation PsychologistViewController

// Identical to the same function in RotatableViewController.m
- (id <SplitViewBarButtonItemPresenter>)splitViewBarButtonItemPresenter
{
    id detailVC = [self.splitViewController.viewControllers lastObject];
    if (![detailVC conformsToProtocol:
          @protocol(SplitViewBarButtonItemPresenter)]) {
        detailVC = nil;
    }
    return detailVC;
}

- (HappinessViewController *)splitViewHappinessViewController {
    id happinessViewController = [self.splitViewController.viewControllers
                                  lastObject];
    if (![happinessViewController isKindOfClass:
          [HappinessViewController class]]) {
        happinessViewController = nil;
    }
    return happinessViewController;
}

- (void)setAndShowDiagnosis:(int)diagnosis {
    self.diagnosis = diagnosis;
    if ([self splitViewHappinessViewController]) { // If in UISplitView
        // Just set happiness
        [[self splitViewHappinessViewController] setHappiness:diagnosis];
        // Otherwise, segue using ShowDiagnosis
    } else [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
}

- (void)transferSplitViewBarButtonItemToViewController:
(id)destinationViewController { // Send a UIBarButtonItem to a new controller
    UIBarButtonItem *splitViewBarButtonItem =
    [[self splitViewBarButtonItemPresenter] splitViewBarButtonItem];
    [[self splitViewBarButtonItemPresenter] setSplitViewBarButtonItem:nil];
    if (splitViewBarButtonItem) { // If we have a button, set it in destination
        [destinationViewController setSplitViewBarButtonItem:
         splitViewBarButtonItem];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        // Don't check here because a crash means the developer needs to change
        //  something
        [segue.destinationViewController setHappiness:self.diagnosis];
    } else if ([segue.identifier isEqualToString:@"Celebrity"]) {
        [self transferSplitViewBarButtonItemToViewController:
         segue.destinationViewController];
        [segue.destinationViewController setHappiness:100];
    } else if ([segue.identifier isEqualToString:@"Serious"]) {
        [self transferSplitViewBarButtonItemToViewController:
         segue.destinationViewController];
        [segue.destinationViewController setHappiness:20];
    } else if ([segue.identifier isEqualToString:@"TVKook"]) {
        [self transferSplitViewBarButtonItemToViewController:
         segue.destinationViewController];
        [segue.destinationViewController setHappiness:50];
    }
}

- (void)handlePsychologistSegues {
    // If coming from a UIViewController other than Psychologist1ViewController,
    //  replace with Psychologist1ViewController
    UIViewController *detailViewController =
    [[self.splitViewController viewControllers] lastObject];
    if (![detailViewController.title isEqualToString:
          @"Psychologist1ViewController"]) { // It is the wrong UIViewController
        UIViewController *Psychologist1ViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"Psychologist1ViewController"];
        [self transferSplitViewBarButtonItemToViewController:
         Psychologist1ViewController]; // Send button to the new controller
        NSMutableArray *viewControllers = [[self.splitViewController
                                            viewControllers] mutableCopy];
        [viewControllers replaceObjectAtIndex:([viewControllers count] - 1) withObject:Psychologist1ViewController];
        self.splitViewController.viewControllers = viewControllers;
        
    }
}

// TODO: Make these one function which sets happiness based on button title
- (IBAction)flying {
    if (self.splitViewController) { // If iPad, then handle segue differently
        [self handlePsychologistSegues];
    }
    [self setAndShowDiagnosis:85];
}

- (IBAction)apple {
    if (self.splitViewController) { // If iPad, then handle segue differently
        [self handlePsychologistSegues];
    }
    [self setAndShowDiagnosis:100];
}

- (IBAction)dragons {
    if (self.splitViewController) { // If iPad, then handle segue differently
        [self handlePsychologistSegues];
    }
    [self setAndShowDiagnosis:20];
}


@end
