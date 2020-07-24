//
//  DetailInfoViewController.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/13.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "DetailInfoViewController.h"

@interface DetailInfoViewController ()
@end

@implementation DetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect buttonFrame = CGRectMake(self.view.frame.size.width-91, self.view.frame.size.height-121, 50, 31);
    self.buttonDelete = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonDelete.frame = buttonFrame;
    self.buttonDelete.tintColor = [UIColor redColor];
    [self.buttonDelete setTitle:@"删除" forState:UIControlStateNormal];
    
    //self.buttonDelete.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.buttonDelete];
    
    CGRect buttonStroeFrame = CGRectMake(60, self.view.frame.size.height-121, 50, 31);
    self.buttonStore = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonStore.frame = buttonStroeFrame;
    self.buttonStore.tintColor = [UIColor cyanColor];
    [self.buttonStore setTitle:@"保存" forState:UIControlStateNormal];
    [self.view addSubview:self.buttonStore];
    //初始化通讯录的个人信息
    CGRect nameFrame = CGRectMake(100, 100, 100, 60);
    CGRect phoneFrame = CGRectMake(50, 170, 160, 45);
    
    self.textFieldName = [[UITextField alloc] initWithFrame:nameFrame];
    self.textFieldPhone = [[UITextField alloc] initWithFrame:phoneFrame];
    self.textFieldName.text = self.person.name;
    self.textFieldPhone.text = self.person.phoneNum;
    
    CGRect mailFrame = CGRectMake(50, 230, self.view.frame.size.width-100, 30) ;
    self.textFieldMail = [[UITextField alloc] initWithFrame:mailFrame];
    self.textFieldMail.text = self.person.mail;
    self.textFieldMail.borderStyle = UITextBorderStyleRoundedRect;
    
    CGRect signatureFrame = CGRectMake(50, 330, self.view.frame.size.width-100, 30);
    self.textFieldSignature = [[UITextField alloc] initWithFrame:signatureFrame];
    self.textFieldSignature.text = self.person.signature;
    
    
    [self.view addSubview:self.textFieldSignature];
    [self.view addSubview:self.textFieldMail];
    [self.view addSubview:self.textFieldPhone];
    [self.view addSubview:self.textFieldName];
    

    
    
}

- (void)initWithPerson:(Person *)p{
    self.person = p;
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
