//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by admin on 6/D/12.
//  Copyright (c) 2012 ThoughtAdvances. All rights reserved.
//

#import "PsychologistViewController.h"

@interface PsychologistViewController ()
@property (nonatomic) int diagnosis;
@end

@implementation PsychologistViewController
- (void)setAndShowDiagnosis:(int)diagnosis {
    self.diagnosis = diagnosis;
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
