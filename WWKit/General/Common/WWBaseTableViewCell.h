//
//  WWBaseTableViewCell.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWBaseTableViewCell : UITableViewCell

@property (nonatomic, weak) UIView *highlightedView;
@property (nonatomic, copy) NSIndexPath *indexPath;
@property (nonatomic, weak) UITableView *tableView;

+ (id)cellWithTableView:(UITableView *)tableView;
+ (id)cellWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier width:(CGFloat) wid;
- (id)initWithFrame:(CGRect)frame initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (void)initSubViews;
@end
