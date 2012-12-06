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
- (void)setAndShowDiagnosis:(int)diagnosis {
    self.diagnosis = diagnosis;
    // PsychologistViewController sends the signal to ShowDiagonsis segue
    [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        // Don't check here because a crash means the developer needs to change
        //  something
        NSLog(@"self.destinationViewController = %@",
              segue.destinationViewController);
        [segue.destinationViewController setHappiness:self.diagnosis];
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
