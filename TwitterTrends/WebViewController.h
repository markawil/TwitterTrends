//
//  WebViewController.h
//  Prototype
//
//  Created by Mark Wilkinson on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController {
    
    NSURL *theURL;
    NSString *theTitle;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UINavigationItem *webTitle;

- (id)initWithURL:(NSURL *)url;
- (id)initWithURL:(NSURL *)url andTitle:(NSString *)title;

- (IBAction)done:(id)sender;

@end
