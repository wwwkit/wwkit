//
//  WWTabBarItem.m
//  WWKit
//
//  Created by weigh on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWTabBarItem.h"

@interface WWTabBarItem ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WWTabBarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    self.titleLabel = [UILabel createLabelWithFrame:CGRectMake(0, 0, self.width, 12.0f)
                                           withSize:10.0f
                                          withColor:UIColorFromRGB(102.0f, 102.0f, 102.0f)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.highlightedTextColor = UIColorFromRGB(127.0f, 214.0f, 168.0f);
    [self addSubview:self.titleLabel];
}

- (void)setNormal:(NSString *)normal seleted:(NSString *)selected title:(NSString *)title
{
    self.imageView.image = [UIImage imageNamed:normal];
    self.imageView.highlightedImage = [UIImage imageNamed:selected];
    [self.imageView sizeToFit];
    self.imageView.top = (self.height-self.imageView.height)/2.0f;//9.0f;
    self.imageView.centerX = self.centerX - self.left;
    self.titleLabel.text = title;
    self.titleLabel.top = self.height - 17.0f;
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self.imageView setHighlighted:selected];
    [self.titleLabel setHighlighted:selected];
}

@end
