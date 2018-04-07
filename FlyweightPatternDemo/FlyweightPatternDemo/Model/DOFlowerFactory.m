//
//  DOFlowerFactory.m
//  FlyweightPatternDemo
//
//  Created by 魏欣宇 on 2018/4/8.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOFlowerFactory.h"

@implementation DOFlowerFactory

- (DOFlower *)flowerWithType:(FlowerType) flower_type
{
    //懒加载pools_dict，初始化享元池
    if (self.pools_dict == nil)
    {
        self.pools_dict = [[NSMutableDictionary alloc] initWithCapacity:FlowerType_Total];
    }
    
    //从享元池中获取
    DOFlower *flower = [self.pools_dict objectForKey:[NSNumber numberWithInteger:flower_type]];
    
    //如果没有，就创建
    if (flower == nil)
    {
        flower = [[DOFlower alloc] init];
        
        switch (flower_type) {
            case FlowerType_Red:
                flower.flower_name = @"红花";
                break;
            case FlowerType_Blue:
                flower.flower_name = @"蓝花";
                break;
            case FlowerType_Yellow:
                flower.flower_name = @"黄花";
                break;
                
            default:
                break;
        }
        
        [self.pools_dict setObject:flower forKey:[NSNumber numberWithInteger:flower_type]];
    }
    
    return flower;
}

- (NSString *)detailsInfor
{
    NSArray *result_array = [self.pools_dict allKeys];
    
    NSString *result = nil;
    for (NSNumber *key in result_array)
    {
        result = result == nil ? [NSString stringWithFormat:@"--Flower地址：%@  key = %@", self.pools_dict[key], key] : [NSString stringWithFormat:@"%@\n--Flower地址：%@  key = %@", result, self.pools_dict[key], key];
    }
    
    return result;
}

@end
