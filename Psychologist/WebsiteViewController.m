//
//  WebsiteViewController.m
//  Psychologist
//
//  Created by admin on 16/D/12.
//  Copyright (c) 2012 ThoughtAdvances. All rights reserved.
//

#import "WebsiteViewController.h"

@interface WebsiteViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation WebsiteViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
@end
