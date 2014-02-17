//
//  SFBrowserViewController.h
//  GameKitTest
//
//  Created by Spencer Fornaciari on 2/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFAppDelegate.h"

@interface SFBrowserViewController : MCBrowserViewController

@property (nonatomic, assign) NSUInteger maximumNumberOfPeers;
@property (nonatomic, assign) NSUInteger minimumNumberOfPeers;

-(void)setupWithServiceType:(NSString *)serviceType withSession:(MCSession *)session andPeer:(MCPeerID *)peerID;

@end
