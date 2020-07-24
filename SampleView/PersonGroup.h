//
//  PersonGroup.h
//  SampleView
//
//  Created by 贾金达 on 2020/7/16.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface PersonGroup : NSObject
@property NSString *groupName;
@property NSMutableArray *personInGroup;

+ (PersonGroup *)initWithPersonList:(NSMutableArray *)persons GroupName:(NSString *)groupName;
+(PersonGroup *)initWithPerson:(Person *)person GroupName:(NSString *)groupName;
- (void)addPerson:(Person *)newPerson;

@end

NS_ASSUME_NONNULL_END
