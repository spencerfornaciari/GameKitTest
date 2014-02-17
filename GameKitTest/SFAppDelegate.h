//
//  SFAppDelegate.h
//  GameKitTest
//
//  Created by Spencer Fornaciari on 2/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kServiceType;
extern NSString *const DataReceivedNotification;

@interface SFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MCSession *session;
@property (strong, nonatomic) MCPeerID *peerId;

@end
