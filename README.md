IRImageTableView
================
![](https://dl.dropboxusercontent.com/u/98803549/cm.png)

A solution to add a UIImageView in an UITableView (inspired by Tweetbot).

## IRImageTableView Class

```objective-c
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id <IRImageTableViewDelegate> delegate;

-(id)initWithTable:(UITableView*)aTable withData:(NSArray *)aData;

@end

```

##IRImageTableViewDelegate Protocol
```objective-c
@protocol IRImageTableViewDelegate <NSObject>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
```


##Contact 
- http://twitter.com/sideround
- hi@koideapps.com
