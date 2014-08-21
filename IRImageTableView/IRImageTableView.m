//
//  IRImageTableView.m
//  IRImageTableView
//
//  Created by Isaac Rodríguez on 20/8/14.
//  Copyright (c) 2014 Isaac Rodríguez. All rights reserved.
//

#import "IRImageTableView.h"
#import "UIImageView+WebCache.h"

@implementation IRImageTableView

- (id)initWithTable:(UITableView *)aTable withData:(NSArray *)aData{
    
    if (self = [super init]) {
        _data = aData;
        _tableView = aTable;
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
    }
    
    return self;
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *metadata = [_data objectAtIndex:indexPath.section];
    
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:metadata[@"image"]]]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    CGFloat height = imageView.frame.size.height;
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary *metadata = [_data objectAtIndex:section];
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
    customView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0f alpha:1.0];
    customView.alpha = 0.8999999999;
    customView.opaque = NO;
    [customView.layer setOpaque:NO];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(8, 10, 255, 20)];
    title.text = metadata[@"name"];
    title.backgroundColor = [UIColor clearColor];
    [customView addSubview:title];
    
    return customView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *metadata = [_data objectAtIndex:indexPath.section];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:metadata[@"image"]]]];
    
    UIImageView *imageViewo = [[UIImageView alloc] initWithImage:image];
    CGFloat width = imageViewo.frame.size.width;
    CGFloat height = imageViewo.frame.size.height;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:metadata[@"image"]]];
    
    CGRect frame = [_tableView rectForRowAtIndexPath:indexPath];
    
    imageView.center = CGPointMake(cell.contentView.bounds.size.width/2,frame.size.height/2);
    [cell.contentView addSubview:imageView];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        return [_delegate tableView:_tableView didSelectRowAtIndexPath:indexPath];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
