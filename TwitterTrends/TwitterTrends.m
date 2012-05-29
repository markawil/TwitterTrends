//
//  TwitterTrends.m
//  TwitterTrends
//
//  Created by Mark Wilkinson on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterTrends.h"
#import "MWViewController.h"
#import "AFNetworking.h"
#import "JSONKit.h"

@implementation TwitterTrends

- (void)queryServiceWithParent:(UIViewController *)controller {
    
    viewController = (MWViewController *)controller;
    NSURL *url = [NSURL URLWithString:@"http://api.twitter.com/1/trends/1.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation 
                                         JSONRequestOperationWithRequest:request 
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id jsonObject)
                                         {      
                                             NSArray *array = [jsonObject objectAtIndex:0];
                                             NSLog(@"array is: %@", array);
                                                                                          
                                             NSArray *trendsArray = [array valueForKey:@"trends"];
                                             
                                             for (NSDictionary *d in trendsArray) {
                                                 [viewController.names addObject:[d objectForKey:@"name"]];
                                                 [viewController.urls addObject:[d objectForKey:@"url"]];
                                             }
                                             
                                             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;                                             
                                             [viewController.serviceView reloadData];                                        
                                         } 
                                         failure:nil];
    
    [operation start];    
}
@end
