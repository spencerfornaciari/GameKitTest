//
//  SFBrowserViewController.m
//  GameKitTest
//
//  Created by Spencer Fornaciari on 2/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFBrowserViewController.h"

@interface SFBrowserViewController ()

@end

@implementation SFBrowserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MCNearbyServiceBrowser *browser = [[MCNearbyServiceBrowser alloc] initWithPeer:localPeerID serviceType:XXServiceType];
    browser.delegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
