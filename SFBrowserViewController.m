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

@property (nonatomic, strong) NSMutableArray *nearbyPeers;
@property (nonatomic, strong) NSMutableArray *acceptedPeers;
@property (nonatomic, strong) NSMutableArray *declinedPeers;


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

-(id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    self.maximumNumberOfPeers = 1;
    self.minimumNumberOfPeers = 1;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(peerConneceted:)
                                                 name:PeerConnectionAcceptedNotification
                                               object:nil];
    
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
