//
//  WWDemoRequest.m
//  WWKit
//
//  Created by weigh on 2017/11/3.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWDemoRequest.h"

@implementation WWDemoRequest

- (WWRequestMethod)getRequestMethod{        //default method is POST
    return WWRequestMethodGet;
}

- (NSString*)getRequestUrl
{
    return @"api.php?m=get.helpimgs&id=13";
}

@end
