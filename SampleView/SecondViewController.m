//
//  SecondViewController.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/13.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic,strong) UITextField *textField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect fieldFrame = CGRectMake(40, 80, 120, 31);

    self.textField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Type word";
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.textField];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
