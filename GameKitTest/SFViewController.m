//
//  SFViewController.m
//  GameKitTest
//
//  Created by Spencer Fornaciari on 2/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()

@property (nonatomic) NSMutableArray *mutableBlockedPeers;
@property (nonatomic) MCPeerID *localPeerID;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mutableBlockedPeers = [NSMutableArray new];
    self.localPeerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];
    
    MCNearbyServiceAdvertiser *advertiser =
    [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.localPeerID
                                      discoveryInfo:nil
                                        serviceType:XXServiceType];
    advertiser.delegate = self;
    [advertiser startAdvertisingPeer];
    
    MCNearbyServiceBrowser *browser = [[MCNearbyServiceBrowser alloc] initWithPeer:self.localPeerID serviceType:XXServiceType];
    browser.delegate = self;
    
    MCBrowserViewController *browserViewController = [[MCBrowserViewController alloc] initWithBrowser:browser
                                             session:session];
    browserViewController.delegate = self;
    [self presentViewController:browserViewController
                       animated:YES
                     completion:
     ^{
         [browser startBrowsingForPeers];
     }];
    
    
    NSString *message = @"Hello, World!";
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    
    if (![self.session sendData:data
                        toPeers:peers
                       withMode:MCSessionSendDataReliable
                          error:&error]) {
        NSLog(@"[Error] %@", error);
    }
    
    NSOutputStream *outputStream =
    [session startStreamWithName:name
                          toPeer:peer];
    
    stream.delegate = self;
    [stream scheduleInRunLoop:[NSRunLoop mainRunLoop]
                      forMode:NSDefaultRunLoopMode];
    [stream open];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - MCNearbyServiceAdvertiserDelegate Methods

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser
didReceiveInvitationFromPeer:(MCPeerID *)peerID
       withContext:(NSData *)context
 invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler
{
    if ([self.mutableBlockedPeers containsObject:peerID]) {
        invitationHandler(NO, nil);
        return;
    }
    
    
//    [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Received Invitation from %@", @"Received Invitation from {Peer}"), peerID.displayName]
//                                delegate:self
//                       cancelButtonTitle:NSLocalizedString(@"Reject", nil)
//                  destructiveButtonTitle:NSLocalizedString(@"Block", nil)
//                       otherButtonTitles:@[NSLocalizedString(@"Accept", nil)], nil];
    
    [UIActionSheet alloc] initWithTitle:<#(NSString *)#> delegate:<#(id<UIActionSheetDelegate>)#> cancelButtonTitle:<#(NSString *)#> destructiveButtonTitle:<#(NSString *)#> otherButtonTitles:<#(NSString *), ...#>, nil
    [[UIActionSheet actionSheetWithTitle:
                       cancelButtonTitle:
                  destructiveButtonTitle:
                       otherButtonTitles:
                                   block:^(UIActionSheet *actionSheet, NSInteger buttonIndex)
      {
          BOOL acceptedInvitation = (buttonIndex == [actionSheet firstOtherButtonIndex]);
          
          if (buttonIndex == [actionSheet destructiveButtonIndex]) {
              [self.mutableBlockedPeers addObject:peerID];
          }
          
          MCSession *session = [[MCSession alloc] initWithPeer:self.localPeerID
                                              securityIdentity:nil
                                          encryptionPreference:MCEncryptionNone];
          session.delegate = self;
          
          invitationHandler(acceptedInvitation, (acceptedInvitation ? session : nil));
      }] showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

#pragma mark - MCSessionDelegate Methods

-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    
}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    
}

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSString *message =
    [[NSString alloc] initWithData:data
                          encoding:NSUTF8StringEncoding];
    NSLog(@"%@", message);
}

-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    
}

-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
}

//Streams are open channels of information used to continuously transfer data like audio, video, or real-time sensor events.
-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    
}

#pragma mark - MCBrowserDelegate Methods

-(void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info
{
    
}

-(void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID
{
    
}

-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    
}

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
