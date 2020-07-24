//
//  EditPersonViewController.h
//  SampleView
//
//  Created by 贾金达 on 2020/7/16.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "NewPersonViewController.h"
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@class EditPersonViewController;
@protocol EditPersonViewDelegate <NSObject>

- (void)editItemViewController:(EditPersonViewController *)controller didFinishEnteringItem:(Person *)item;
@end
@interface EditPersonViewController : NewPersonViewController

@property (nonatomic, weak) id<EditPersonViewDelegate> delegate2;

@property Person *person;
@end

NS_ASSUME_NONNULL_END
