//
//  DetailInfoViewController.h
//  SampleView
//
//  Created by 贾金达 on 2020/7/13.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailInfoViewController : UIViewController
@property UITextField *textFieldName;
@property UITextField *textFieldPhone;
@property UITextField *textFieldSignature;
@property UITextField *textFieldMail;
@property UIImage *image;
@property UIButton *buttonDelete;
@property UIButton *buttonStore;
@property Person *person;
- (void)initWithPerson:(Person *)p;
@end

NS_ASSUME_NONNULL_END
