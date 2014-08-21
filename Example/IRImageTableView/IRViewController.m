//
//  IRViewController.m
//  IRImageTableView
//
//  Created by Isaac Rodríguez on 20/8/14.
//  Copyright (c) 2014 Isaac Rodríguez. All rights reserved.
//

#import "IRViewController.h"
#import "IRImageTableView.h"
#import "UIImageView+WebCache.h"

@interface IRViewController (){
    IRImageTableView *ir;
}
@property (strong, nonatomic) NSArray *data;
@end

@implementation IRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"IRImageTableView";

    self.data = @[@{@"name":@"Section 1",@"image":@"http://cdn.opensly.com/series/3Y9RHHDZ49.jpg"},
                  @{@"name":@"Section 2",@"image":@"http://cdn.opensly.com/series/3Y9RHHDZ49.jpg"},
                  @{@"name":@"Section 3",@"image":@"http://cdn.opensly.com/series/3Y9RHHDZ49.jpg"},
                  @{@"name":@"Section 4",@"image":@"http://cdn.opensly.com/series/3Y9RHHDZ49.jpg"},
                  @{@"name":@"Section 5",@"image":@"http://cdn.opensly.com/series/3Y9RHHDZ49.jpg"},
                ];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    ir = [[IRImageTableView alloc] initWithTable:tableView withData:self.data];
    [ir setDelegate:self];
    [self.view addSubview:ir.tableView];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"IRImageTableView"
                                                    message:[NSString stringWithFormat: @"Section %i",indexPath.section]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
}

@end
