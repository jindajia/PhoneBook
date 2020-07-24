//
//  NewPersonViewController.h
//  SampleView
//
//  Created by 贾金达 on 2020/7/15.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@class NewPersonViewController;
@protocol NewPersonControllerDelegate <NSObject>

- (void)addItemViewController:(NewPersonViewController *)controller didFinishEnteringItem:(Person *)item;

@end

@interface NewPersonViewController : UIViewController

@property (nonatomic, weak) id<NewPersonControllerDelegate> delegate;


@property UITextField *textFieldName;
@property UITextField *textFieldPhone;
@property UITextField *textFieldmail;
@property UITextField *textFieldsignature;
@property UIBarButtonItem *buttonFinish;
@property UIImageView *photo;
@property UIButton *buttonSelectPhoto;
@property UIWindow *alertWindow;
@property UIScrollView *scrollView;



@end


NS_ASSUME_NONNULL_END
