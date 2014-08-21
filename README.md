IRImageTableView
================
![](https://dl.dropboxusercontent.com/u/98803549/cm.png)

A solution to add a UIImageView in an UITableView (inspired by Tweetbot).

## IRImageTableView Class

```objective-c
@interface IRImageTableView : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray *datao;
@property (nonatomic,retain) UITableView *tableView;
-(id) initWithTable:(UITableView*)table withData:(NSArray *)data;
@property (weak, nonatomic) id <IRImageTableViewDelegate> delegate;
@end

```

##IRImageTableViewDelegate Protocol
```objective-c
@protocol IRImageTableViewDelegate <NSObject>
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
```


##Contact 
- http://twitter.com/sideround
- hi@koideapps.com
