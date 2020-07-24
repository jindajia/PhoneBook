//
//  EditPersonViewController.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/16.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "EditPersonViewController.h"
#import "ChineseToPinyin.h"
@interface EditPersonViewController ()

@end

@implementation EditPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textFieldName.text = self.person.name;
    self.textFieldmail.text = self.person.mail;
    self.textFieldPhone.text = self.person.phoneNum;
    self.textFieldsignature.text = self.person.signature;
    self.buttonFinish.title = @"保存";
}

-(void)finishAdd{
    NSLog(@"存储");
    if(self.textFieldName.text.length==0||self.textFieldPhone.text.length==0){
        UIAlertController *uiAlertController=
        [UIAlertController alertControllerWithTitle:@"稍等"
        message:@"请填写手机号和姓名"
        preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:uiAlertController animated:YES completion:nil];

        UIAlertAction *action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [uiAlertController addAction:action];
    }
    else{
        Person *p = [[Person alloc] init];
        p.personNo = self.person.personNo;
        p.name = self.textFieldName.text;
        p.phoneNum = self.textFieldPhone.text;
        p.mail = self.textFieldmail.text;
        p.signature = self.textFieldsignature.text;
        p.namePinYin = [ChineseToPinyin transformPinYinWithString:p.name];
        
        //NSString *content = @"Pass this value back to ViewControllerA";
        [self.delegate2 editItemViewController:self didFinishEnteringItem:p];
        //最重要的部分！
        [self.navigationController popViewControllerAnimated:YES];
    }
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
