//
//  PersonGroup.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/16.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "PersonGroup.h"

@implementation PersonGroup
+ (PersonGroup *)initWithPersonList:(NSMutableArray *)persons GroupName:(NSString *)groupName{
    PersonGroup *newPersonGroup = [[PersonGroup alloc] init];
    newPersonGroup.groupName = groupName;
    newPersonGroup.personInGroup = persons;
    return newPersonGroup;
}
+(PersonGroup *)initWithPerson:(Person *)person GroupName:(NSString *)groupName{
    PersonGroup *newPersonGroup = [[PersonGroup alloc] init];
    newPersonGroup.groupName = groupName;
    newPersonGroup.personInGroup = [[NSMutableArray alloc] init];
    [newPersonGroup.personInGroup addObject:person];
    return newPersonGroup;
}
- (void)addPerson:(Person *)newPerson{
    [self.personInGroup addObject:newPerson];
}

@end
