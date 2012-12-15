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
    if ([self splitViewHappinessViewController]) {
        [[self splitViewHappinessViewController] setHappiness:diagnosis];
    } else [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        // Don't check here because a crash means the developer needs to change
        //  something
        [segue.destinationViewController setHappiness:self.diagnosis];
    } else if ([segue.identifier isEqualToString:@"Celebrity"]) {
        [segue.destinationViewController setHappiness:100];
    } else if ([segue.identifier isEqualToString:@"Serious"]) {
        [segue.destinationViewController setHappiness:20];
    } else if ([segue.identifier isEqualToString:@"TVKook"]) {
        [segue.destinationViewController setHappiness:50];
    }
}

- (IBAction)flying {
    [self setAndShowDiagnosis:85];
}

- (IBAction)apple {
    [self setAndShowDiagnosis:100];
}

- (IBAction)dragons {
    [self setAndShowDiagnosis:20];
}


@end
