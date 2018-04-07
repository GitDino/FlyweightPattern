//
//  DOFlowerFactory.h
//  FlyweightPatternDemo
//
//  Created by 魏欣宇 on 2018/4/8.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOFlower.h"

typedef NS_ENUM(NSInteger) {
    FlowerType_Red,
    FlowerType_Blue,
    FlowerType_Yellow,
    FlowerType_Total
}FlowerType;

@interface DOFlowerFactory : NSObject

/**
 享元池（缓存池）
 */
@property (nonatomic, strong) NSMutableDictionary *pools_dict;

- (DOFlower *)flowerWithType:(FlowerType) flower_type;

- (NSString *)detailsInfor;

@end
