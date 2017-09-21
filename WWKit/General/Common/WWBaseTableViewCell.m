//
//  WWBaseTableViewCell.m
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWBaseTableViewCell.h"

@implementation WWBaseTableViewCell

+ (id)cellWithTableView:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    WWBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithReuseIdentifier:identifier];
        cell.tableView = tableView;
    }
    return cell;
}
+ (id)cellWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    WWBaseTableViewCell *cell = [self cellWithTableView:tableView];
    cell.indexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    return cell;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //cancel selected background color
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier width:(CGFloat) wid{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.width=wid;
        self.backgroundColor = [UIColor clearColor];
        //cancel selected background color
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.contentView.layer.masksToBounds = YES;
        self.clipsToBounds=NO;
        self.contentView.superview.clipsToBounds=NO;
        self.frame=frame;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted) {
        self.highlightedView.backgroundColor = UIColorFromRGB(233.0f, 233.0f, 233.0f);
    } else {
        self.highlightedView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
