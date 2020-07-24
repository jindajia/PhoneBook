//
//  ViewController.h
//  SampleView
//
//  Created by 贾金达 on 2020/7/12.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "DetailInfoViewController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//extern NSMutableArray *personList;
@interface ViewController : UIViewController
@property NSMutableArray *personList;//保存person的



@end

