//
//  AllPersonGroup.h
//  SampleView
//
//  Created by 贾金达 on 2020/7/16.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonGroup.h"
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface AllPersonGroup : NSObject

@property NSMutableDictionary *allGroup;

+(AllPersonGroup*)initWithPersonList:(NSMutableArray *)persons;
-(void)addGroup:(PersonGroup *)group;
-(void)deleteGroup:(NSString *)key;
- (NSMutableArray *)dictToList;
@end

NS_ASSUME_NONNULL_END
