//
//  ViewController.m
//  GoTube
//
//  Created by HLPTH-MACMINI2 on 7/4/2557 BE.
//  Copyright (c) 2557 HLP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
#define kUserAgent @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.79 Safari/537.4"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youtube.com/get_video_info?video_id=ExIaidu4-Yw"]];
    [request setValue:kUserAgent forHTTPHeaderField:@"User-Agent"];
    [request setHTTPMethod:@"GET"];
    
    
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (!error) {
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"responseString = %@", responseString);
        NSLog(@"response =  %@", response.URL);
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
