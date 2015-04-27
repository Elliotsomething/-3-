//
//  viewViewController.m
//  画3个图形
//
//  Created by mac book on 13-6-25.
//  Copyright (c) 2013年 mac book. All rights reserved.
//

#import "viewViewController.h"
#import "view.h"
@interface viewViewController ()
@property(strong)view *vi;
@end

@implementation viewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.vi=[[view alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    [self.view addSubview:self.vi];
    [self.vi setBackgroundColor:[UIColor clearColor]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn:(id)sender {
    if ([sender selectedSegmentIndex]==0) {
        NSLog(@"nihao");
        [self.vi clear:1];
    }
    if ([sender selectedSegmentIndex]==1) {
        [self.vi clear:2];
        NSLog(@"wohao");
    }
if ([sender selectedSegmentIndex]==2) {
    [self.vi clear:3];
    NSLog(@"dajiahao ");
}
}
@end
