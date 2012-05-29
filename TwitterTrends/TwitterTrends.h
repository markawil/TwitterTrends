//
//  TwitterTrends.h
//  TwitterTrends
//
//  Created by Mark Wilkinson on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MWViewController;

@interface TwitterTrends : NSObject {
    
    MWViewController *viewController;
    NSURL *theUrl;
}

- (void)queryServiceWithParent:(UIViewController *)controller;

@end
