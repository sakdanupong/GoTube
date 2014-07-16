//
//  ViewController.m
//  GoTube
//
//  Created by HLPTH-MACMINI2 on 7/4/2557 BE.
//  Copyright (c) 2557 HLP. All rights reserved.
//

#import "ViewController.h"
#import "LBYouTubeExtractor.h"
#import "AFNetworking.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@end
#define kUserAgent @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.79 Safari/537.4"
//#define kUserAgent @"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)"


#define BASE_URL @"http://youtube.com/"
#define GET_VIDEO_INFO @"get_video_info"
#define GET_VIDEO @"get_video"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:kUserAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];

    
    //url for dowload video is
    // http://api-gt-yt-dl.appspot.com/get_download_url?url=http://www.youtube.com/watch?v=R5wA8wr5ccg
    
    
//    NSString *token = [@"vjVQa1PpcFMR3uzc1JupjWtDZeEXsHFPV2dU6SPXdxY%3D" stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
//    NSLog(@"%@", token);
//    
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youtube.com/get_video_info?video_id=ExIaidu4-Yw"]];
//    [request setHTTPMethod:@"GET"];
//    
//    
//    
//    NSURLResponse *response = nil;
//    NSError *error = nil;
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    if (!error) {
//        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//        NSLog(@"responseString = %@", responseString);
//        NSLog(@"response =  %@", response.URL);
//        
//        NSMutableDictionary *parts = [self dictionaryFromQueryStringComponents:responseString];
//        NSString *dd =[parts objectForKey:@"url_encoded_fmt_stream_map"];
//        NSLog(@"%@", dd);
////        NSMutableDictionary *url_encoded_fmt_stream_map = [self dictionaryFromQueryStringComponents:];
//
//    }
//
//    [self createVideoFolder];
//    NSString *pathTODocs = [self getApplicationSupportVideoPath];
//
    

    

    

    
    
    
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

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *getVDOInfoUrl = [self getVideoInfoUrl:@"ExIaidu4-Yw"];
    [manager GET:getVDOInfoUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSMutableDictionary *dict = [self dictionaryFromQueryStringComponents:responseString];
//        NSLog(@"%@", dict);
//        NSArray *tokenArr = [dict objectForKey:@"token"];
//        NSString *token = [tokenArr objectAtIndex:0];
//        NSString *getVideoUrl = [self getVideoUrl:@"ExIaidu4-Yw" token:token];
//        NSLog(@"%@", getVideoUrl);
//        [self getVideoFromVideoUrl:getVideoUrl];
        
        NSArray *map = [dict objectForKey:@"url_encoded_fmt_stream_map"];
        NSString *str_map = [map objectAtIndex:0];
        NSMutableDictionary *map_dict = [self dictionaryFromQueryStringComponents:str_map];
//        NSLog(@"map %@", map_dict);
        
        NSArray *s_array = [map_dict objectForKey:@"s"];
        NSString *s = [s_array objectAtIndex:0];
//        NSLog(@"signature %@", s);

        NSArray *url_array = [map_dict objectForKey:@"url"];
        NSString *url = [url_array objectAtIndex:0];
        NSLog(@"url %@", [@"http://r7---sn-w5nuxa-c33e7.googlevideo.com/videoplayback?mws=yes&ms=au&ip=171.6.150.139&mt=1405199763&key=yt5&source=youtube&upn=DuHBK9K8a54&mv=m&sparams=id%2Cip%2Cipbits%2Citag%2Cratebypass%2Csource%2Cupn%2Cexpire&id=o-AJZbUhdVQP8eOfRSAjqcbgXXSV7B7bZISbTSMijuiAYY&sver=3&ipbits=0&fexp=902408%2C916636%2C924213%2C924217%2C924222%2C929305%2C930008%2C931975%2C934024%2C934030%2C936927%2C938672%2C945242%2C946021&itag=43&ratebypass=yes&expire=1405224000&signature=47701AF30C92B1697FB580BA3587DD4F4354A863.1E53A91F23DFB51152639A196FB145F16371F6DF" stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding]);
        
        NSString *urlForDownload = [NSString stringWithFormat:@"%@&signature=%@", url , s];

        NSLog(@"%@", urlForDownload);
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:urlForDownload];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            NSLog(@"File downloaded to: %@", filePath);
        }];
        [downloadTask resume];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
//    - (void)doCalculation
//    {
//        //you can use any string instead "com.mycompany.myqueue"
//        dispatch_queue_t backgroundQueue = dispatch_queue_create("com.mycompany.myqueue", 0);
//        
//        dispatch_async(backgroundQueue, ^{
//            int result = <some really long calculation that takes seconds to complete>;
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self updateMyUIWithResult:result];
//            });    
//        });
//    }
    
}




- (void)getVideoFromVideoUrl:(NSString*)url {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager HEAD:url parameters:nil success:^(AFHTTPRequestOperation *operation) {
         NSLog(@"success = %@", operation);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@", operation);
    }];
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"success = %@", operation);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error = %@", operation);
////        [operation setRedirectResponseBlock:^NSURLRequest *(NSURLConnection *connection, NSURLRequest *request, NSURLResponse *redirectResponse) {
////            NSLog(@"Response: %@", redirectResponse.debugDescription);
////            NSLog(@"Request: %@", request.debugDescription);
////            return request;
////        }];
//    }];
    
}

- (NSString*)getVideoUrl:(NSString*)video_id token:(NSString*)token {
    return [NSString stringWithFormat:@"%@%@?%@&t=%@&fmt=18&asv=2", BASE_URL, GET_VIDEO, [self getParameterWithVideoId:video_id], token];
}

- (NSString *)getVideoInfoUrl:(NSString*)video_id {
   return [NSString stringWithFormat:@"%@%@?%@&asv=3&el=detailpage&hl=en_US", BASE_URL, GET_VIDEO_INFO, [self getParameterWithVideoId:video_id]];
}

- (NSString *)getParameterWithVideoId:(NSString*)video_id {
    return [NSString stringWithFormat:@"video_id=%@",video_id];
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
