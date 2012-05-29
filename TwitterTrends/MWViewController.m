//
//  MWViewController.m
//  TwitterTrends
//
//  Created by Mark Wilkinson on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MWViewController.h"
#import "TwitterTrends.h"
#import "AFJSONRequestOperation.h"
#import "JSONKit.h"
#import "WebViewController.h"

@implementation MWViewController

@synthesize serviceView;
@synthesize names;
@synthesize urls;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    
    self.names = [[NSMutableArray alloc] init];
    self.urls = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    TwitterTrends *twitterTrends = [[TwitterTrends alloc] init];
    [twitterTrends queryServiceWithParent:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = [names objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:[urls objectAtIndex:indexPath.row]];
    WebViewController *webViewContorller = [[WebViewController alloc] initWithURL:url andTitle:title];
    [self presentModalViewController:webViewContorller animated:YES];
    
    NSLog(@"Clicked on row %d", indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
   // NSDictionary *trend = [self.names objectAtIndex:indexPath.row];
   // cell.textLabel.text = [trend valueForKey:@"name"];
    cell.textLabel.text = [self.names objectAtIndex:indexPath.row];
    return cell;
}


@end
