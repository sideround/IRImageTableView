//
//  IRImageTableView.h
//  IRImageTableView
//
//  Created by Isaac Rodríguez on 20/8/14.
//  Copyright (c) 2014 Isaac Rodríguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IRImageTableViewDelegate <NSObject>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface IRImageTableView : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id <IRImageTableViewDelegate> delegate;

- (id)initWithTable:(UITableView*)tabla withData:(NSArray *)data;

@end
