//
//  AppDelegate.m
//  GoTube
//
//  Created by HLPTH-MACMINI2 on 7/4/2557 BE.
//  Copyright (c) 2557 HLP. All rights reserved.
//

#import "AppDelegate.h"


// https://github.com/video-dl/video-dl-ios

// https://github.com/hellozimi/HCYoutubeParser
// https://github.com/0xced/XCDYouTubeKit
// https://github.com/larcus94/LBYouTubeView
// https://github.com/pbernery/PBYouTubeVideoViewController
// https://github.com/steipete/PSYouTubeExtractor
// https://github.com/mikeMTOL/KSVideoPlayer

// http://stackoverflow.com/questions/3311795/youtube-video-download-url
// http://stackoverflow.com/questions/5087249/save-youtube-video-to-iphone-in-the-app
// http://blog.abhiomkar.in/2010/05/12/downloading-youtube-videos-using-python-one-liner/
// http://stackoverflow.com/questions/16503166/getting-a-youtube-download-url-from-existing-url
// http://stackoverflow.com/questions/2678051/can-t-download-youtube-video


// reason
// http://stackoverflow.com/questions/22316310/how-to-stop-xcode5-1-building-for-64bit
// http://stackoverflow.com/questions/20122815/xcode-5-about-64-bits-architecture-and-backwards-compatibility


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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

@end
