//
//  IRImageTableView.h
//  IRImageTableView
//
//  Created by Isaac Rodríguez on 20/8/14.
//  Copyright (c) 2014 Isaac Rodríguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IRImageTableViewDelegate <NSObject>
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface IRImageTableView : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray *datao;
@property (nonatomic,retain) UITableView *tableView;
-(id) initWithTable:(UITableView*)tabla withData:(NSArray *)data;
@property (weak, nonatomic) id <IRImageTableViewDelegate> delegate;
@end
