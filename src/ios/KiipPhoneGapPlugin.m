//
//  KiipPhoneGapPlugin.m
//  PhoneGapTest
//
//  Created by Nick HS on 10/30/12.
//  Edited by Sean Macfarlane on 1/10/2017
//

#import "KiipPhoneGapPlugin.h"
#import <KiipSDK/KiipSDK.h>

@interface KiipPhoneGapPlugin() <KiipDelegate>

@end

@implementation KiipPhoneGapPlugin

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void) initializeKiip:(CDVInvokedUrlCommand*)command
{
    NSString* APP_KEY = [command.arguments objectAtIndex:0];
    NSString* APP_SECRET = [command.arguments objectAtIndex:1];
    
    Kiip *kiip = [[Kiip alloc] initWithAppKey:APP_KEY andSecret:APP_SECRET];
    kiip.delegate = self;
    [Kiip setSharedInstance:kiip];
    NSLog(@"Kiip inited");
    
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) saveMoment:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    NSLog(@"Saving Moment");
    
    @try {
        NSString* momentId = [command.arguments objectAtIndex:0];
        
        [[Kiip sharedInstance] saveMoment:momentId withCompletionHandler:nil];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// #pragma mark- virtual currency

- (void) onContent:(CDVInvokedUrlCommand*)command
{
    NSLog(@"listenContent called");
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [pluginResult setKeepCallbackAsBool:YES];
    self.contentCallbackId = command.callbackId;
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) kiip:(Kiip *)kiip didReceiveContent:(NSString *)content quantity:(int)quantity transactionId:(NSString *)transactionId signature:(NSString *)signature {
    NSLog(@"CONTENT RECEIVED %@ %d %@ %@", content, quantity, transactionId, signature);
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSString stringWithFormat:@"%d", quantity], @"quantity",
                          content, @"content",
                          transactionId, @"transactionId",
                          signature, @"signature",
                          nil];
    
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
    [pluginResult setKeepCallbackAsBool:YES];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.contentCallbackId];
}

// #pragma mark - video callbacks

-(void) onVideo:(CDVInvokedUrlCommand*)command {
    
}

-(void) kiipVideoPlaybackDidBegin:(Kiip*)kiip {
    NSLog(@"VideoPlayed");
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [pluginResult setKeepCallbackAsBool:YES];
}

-(void) kiipVideoPlaybackDidEnd:(Kiip*)kiip {
    NSLog(@"VideoDismissed");
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [pluginResult setKeepCallbackAsBool:YES];
}

@end
