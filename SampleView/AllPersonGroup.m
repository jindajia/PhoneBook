//
//  AllPersonGroup.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/16.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "AllPersonGroup.h"

@implementation AllPersonGroup
+(AllPersonGroup*)initWithPersonList:(NSMutableArray *)persons{
    AllPersonGroup *a = [[AllPersonGroup alloc] init];
    a.allGroup = [NSMutableDictionary dictionary];
    for(Person *p in persons){
        //如果有该组
        if([a.allGroup valueForKey:[p getFirstChar]]){
            [[a.allGroup valueForKey:[p getFirstChar]] addPerson:p];
        }
        else{
            PersonGroup *pGroup = [PersonGroup initWithPerson:p GroupName:[p getFirstChar]];
            a.allGroup[[p getFirstChar]] = pGroup;
        }
    }
    return a;
}
-(void)addGroup:(PersonGroup *)group{
    self.allGroup[group.groupName] = group;
}
-(void)deleteGroup:(NSString *)key{
    [self.allGroup removeObjectForKey:key];
}
- (NSMutableArray *)dictToList{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(NSString *keys in self.allGroup){
        PersonGroup *group = self.allGroup[keys];
        NSMutableArray *personsInAGroup = group.personInGroup;
        for(Person *po in personsInAGroup){
            [array addObject:po];
        }
    }
    return array;
}
@end
