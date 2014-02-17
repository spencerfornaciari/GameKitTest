//
//  SFBrowserViewController.m
//  GameKitTest
//
//  Created by Spencer Fornaciari on 2/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFBrowserViewController.h"

@interface SFBrowserViewController ()

@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) NSString *serviceType;

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
    
   // MCNearbyServiceBrowser *browser = [[MCNearbyServiceBrowser alloc] initWithPeer:localPeerID serviceType:XXServiceType];
    //browser.delegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupWithServiceType:(NSString *)serviceType withSession:(MCSession *)session andPeer:(MCPeerID *)peerID
{
    self.serviceType = serviceType;
    self.session = session;
    self.peerID = peerID;
}

@end
