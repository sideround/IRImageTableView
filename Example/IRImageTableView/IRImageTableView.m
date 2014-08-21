//
//  IRImageTableView.m
//  IRImageTableView
//
//  Created by Isaac Rodríguez on 20/8/14.
//  Copyright (c) 2014 Isaac Rodríguez. All rights reserved.
//

#import "IRImageTableView.h"
#import "UIImageView+WebCache.h"

@interface IRImageTableView () <IRImageTableViewDelegate>

@end

@implementation IRImageTableView
@synthesize tableView,datao;

- (id)initWithTable:(UITableView *)tabla withData:(NSArray *)data{
    
    if (self = [super init]) {
        tableView = tabla;
        [tableView setDataSource:self];
        [tableView setDelegate:self];
        datao = data;
    }
    
    return self;
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.datao count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *data = [self.datao objectAtIndex:indexPath.section];
    
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[data objectForKey:@"image"]]]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    CGFloat height = imageView.frame.size.height;
    
    return height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary *data = [self.datao objectAtIndex:section];
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10,0,300,40)];
    customView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0f alpha:1.0];
    customView.alpha = 0.8999999999;
    customView.opaque = NO;
    [customView.layer setOpaque:NO];
    
    UILabel *titulo = [[UILabel alloc]initWithFrame:CGRectMake(8, 10, 255, 20)];
    titulo.text = [data objectForKey:@"name"];
    titulo.backgroundColor = [UIColor clearColor];
    [customView addSubview:titulo];
    
    return customView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *data = [self.datao objectAtIndex:indexPath.section];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[data objectForKey:@"image"]]]];

    UIImageView *imageViewo = [[UIImageView alloc] initWithImage:image];
    CGFloat width = imageViewo.frame.size.width;
    CGFloat height = imageViewo.frame.size.height;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[data objectForKey:@"image"]]];
    
    CGRect frame = [self.tableView rectForRowAtIndexPath:indexPath];
    
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        return [self.delegate tableView:self.tableView didSelectRowAtIndexPath:indexPath];
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
