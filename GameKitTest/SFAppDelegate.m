//
//  SFAppDelegate.m
//  GameKitTest
//
//  Created by Spencer Fornaciari on 2/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFAppDelegate.h"

NSString *const kServiceType = @"sn-gamekittest";

@interface SFAppDelegate () <MCSessionDelegate, MCAdvertiserAssistantDelegate>

@property (strong, nonatomic) MCAdvertiserAssistant *advertiserAssistant;
@property (strong, nonatomic) MCNearbyServiceAdvertiser *advertiser;
@property (strong, nonatomic) NSDictionary *discoveryInfo;

@end

@implementation SFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // 1
    NSString *peerName = [[UIDevice currentDevice] name];
    
    self.peerId = [[MCPeerID alloc] initWithDisplayName:peerName]; // 2
    self.session = [[MCSession alloc] initWithPeer:self.peerId
                                  securityIdentity:nil
                              encryptionPreference:MCEncryptionNone];
    
    self.session.delegate = self;
    
    self.discoveryInfo = @{@"code": @"SWINGBOX"};
    
//    self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.peerId
//                                                        discoveryInfo:self.discoveryInfo
//                                                          serviceType:kServiceType];
    // 3
    self.advertiserAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:kServiceType
                                                                    discoveryInfo:self.discoveryInfo
                                                                          session:self.session];
         // 4
     [self.advertiserAssistant start];
    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    
}

-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    
}

-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    
}

-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    
}

@end
