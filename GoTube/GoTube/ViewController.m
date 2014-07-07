//
//  ViewController.m
//  GoTube
//
//  Created by HLPTH-MACMINI2 on 7/4/2557 BE.
//  Copyright (c) 2557 HLP. All rights reserved.
//

#import "ViewController.h"
#import "LBYouTubeExtractor.h"

@interface ViewController ()

@end
#define kUserAgent @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.79 Safari/537.4"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:kUserAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    NSString *token = [@"vjVQa1PpcFMR3uzc1JupjWtDZeEXsHFPV2dU6SPXdxY%3D" stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSLog(@"%@", token);
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youtube.com/get_video_info?video_id=ExIaidu4-Yw"]];
    [request setHTTPMethod:@"GET"];
    
    
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (!error) {
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"responseString = %@", responseString);
        NSLog(@"response =  %@", response.URL);
        
        NSMutableDictionary *parts = [self dictionaryFromQueryStringComponents:responseString];
        NSString *dd =[parts objectForKey:@"url_encoded_fmt_stream_map"];
        NSLog(@"%@", dd);
//        NSMutableDictionary *url_encoded_fmt_stream_map = [self dictionaryFromQueryStringComponents:];

    }

    [self createVideoFolder];
    NSString *pathTODocs = [self getApplicationSupportVideoPath];
    
    
//    LBYouTubeExtractor *extractor = [[LBYouTubeExtractor alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:(@"http://www.youtube.com/watch?v=%@"), @"ExIaidu4-Yw" ]] quality:LBYouTubeVideoQualityLarge];
//    [extractor extractVideoURLWithCompletionBlock:^(NSURL *videoURL, NSError *error) {
//        if(!error) {
//            NSLog(@"Did extract video URL using completion block: %@", videoURL);
//            NSLog(@"%@", videoURL);
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                NSData *data = [NSData dataWithContentsOfURL: videoURL];
//                NSLog(@"%@",[NSByteCountFormatter stringFromByteCount:data.length countStyle:NSByteCountFormatterCountStyleFile]);
//                NSString *filename = [NSString stringWithFormat:(@"video_%@.mp4"), @"ExIaidu4-Yw" ];
//                [data writeToFile:[pathTODocs stringByAppendingPathComponent:filename] atomically:YES];
//                NSLog(@"File %@ successfully saved", filename);
//            });
//        } else {
//            NSLog(@"Failed extracting video URL using block due to error:%@", error);
//        }
//    }];

    
}

- (NSString *)stringByDecodingURLFormat:(NSString*)responseString {
    NSString *result = [responseString stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSMutableDictionary *)dictionaryFromQueryStringComponents:(NSString*)responseString {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    for (NSString *keyValue in [responseString componentsSeparatedByString:@"&"]) {
        NSArray *keyValueArray = [keyValue componentsSeparatedByString:@"="];
        if ([keyValueArray count] < 2) {
            continue;
        }
        
        NSString *key = [self stringByDecodingURLFormat:(NSString*)[keyValueArray objectAtIndex:0]];
        NSString *value = [self stringByDecodingURLFormat:(NSString*)[keyValueArray objectAtIndex:1]];
        
        NSMutableArray *results = [parameters objectForKey:key];
        
        if(!results) {
            results = [NSMutableArray arrayWithCapacity:1];
            [parameters setObject:results forKey:key];
        }
        
        [results addObject:value];
    }
    
    return parameters;
}


- (void)createVideoFolder {
    [self initApplicationSupportDirectory];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *vdoPath = [self getApplicationSupportVideoPath];
    
    // Create dir if need
    if(![fileManager fileExistsAtPath:vdoPath]) {
        [fileManager createDirectoryAtPath:vdoPath withIntermediateDirectories:NO attributes:nil error:&error];
        // Avoid backup to itunes
        NSURL *url = [NSURL fileURLWithPath:vdoPath];
        [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error: &error];
    }
    
}

- (NSString*)getApplicationSupportVideoPath {
    NSString* supportPath = [self applicationAppSupportDirectory];
    NSString *s = [supportPath stringByAppendingPathComponent:@"Video"];
    return s;
}

- (NSString *)applicationAppSupportDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) lastObject];
}

- (void)initApplicationSupportDirectory {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    NSString *appSupportDir = [self applicationAppSupportDirectory];
    if(![fileManager fileExistsAtPath:appSupportDir]) {
        NSError *error;
        [fileManager createDirectoryAtPath:appSupportDir withIntermediateDirectories:NO attributes:nil error:&error];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
