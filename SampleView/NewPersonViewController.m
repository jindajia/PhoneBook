//
//  NewPersonViewController.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/15.
//  Copyright © 2020 jiajinda. All rights reserved.
//
#import "Person.h"
#import "NewPersonViewController.h"
#import "ChineseToPinyin.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface NewPersonViewController ()

@end

@implementation NewPersonViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    @property UITextField *textFieldName;
//    @property UITextField *textFieldPhone;
//    @property UITextField *textFieldmail;
//    @property UITextField *textFieldsignature;
//    @property UIButton *buttonFinish;
//    @property UIImage *photo;
//    @property UIButton *buttonSelectPhoto;
    
    //初始化alertWindow
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.backgroundColor = [UIColor blackColor];
    CGSize size = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+200);
    self.scrollView.contentSize = size;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    
    
    self.alertWindow = [[UIWindow alloc] init];
    self.alertWindow.rootViewController = [[UIViewController alloc] init];
    self.alertWindow.windowLevel = UIWindowLevelAlert + 1;
    
    self.buttonFinish = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishAdd)];
    self.navigationItem.rightBarButtonItem = self.buttonFinish;
    self.view.backgroundColor = [UIColor whiteColor];
    [self display];
    
}
- (void)display{
    //姓名textfield
    self.textFieldName = [[UITextField alloc] init];
    self.textFieldName.placeholder = @"姓名";
    self.textFieldName.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldName.frame = CGRectMake(20, 200 ,SCREEN_WIDTH-40, 60);
    [self.scrollView addSubview:self.textFieldName];
    
    //电话号textField
    self.textFieldPhone = [[UITextField alloc] init];
    self.textFieldPhone.placeholder = @"电话号码";
    self.textFieldPhone.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldPhone.frame = CGRectMake(20, 280, SCREEN_WIDTH-40, 60);
    [self.scrollView addSubview:self.textFieldPhone];
    
    //邮箱textfield
    self.textFieldmail = [[UITextField alloc] init];
    self.textFieldmail.placeholder = @"邮箱";
    self.textFieldmail.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldmail.frame = CGRectMake(20, 360, SCREEN_WIDTH-40, 60);
    [self.scrollView addSubview:self.textFieldmail];
    
    //个性签名textField
    self.textFieldsignature = [[UITextField alloc] init];
    self.textFieldsignature.placeholder = @"个性签名";
    self.textFieldsignature.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldsignature.frame = CGRectMake(20, 440, SCREEN_WIDTH-40, 60);
    [self.scrollView addSubview:self.textFieldsignature];
    
    //选择照片button
    self.buttonSelectPhoto = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    CGRect buttonSelectFrame = CGRectMake((SCREEN_WIDTH-100)/2, 130, 100, 40);
    [self.buttonSelectPhoto setTitle:@"选择照片" forState:UIControlStateNormal] ;
    self.buttonSelectPhoto.backgroundColor = [UIColor whiteColor];
    self.buttonSelectPhoto.frame = buttonSelectFrame;
    self.buttonSelectPhoto.showsTouchWhenHighlighted = YES;
    [self.scrollView addSubview:self.buttonSelectPhoto];
    //UIImage
    NSString *path = @"/Users/jiajinda/Desktop/geektime-ios-course-master/project/SampleApp/icon.bundle/like@2x.png";
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    self.photo = [[UIImageView alloc] initWithImage:image];
    self.photo.frame = CGRectMake((SCREEN_WIDTH-100)/2, 20, 100, 100);
    [self.scrollView addSubview:self.photo];
    
}

-(void)finishAdd{
    NSLog(@"finish");
    
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
        p.name = self.textFieldName.text;
        p.phoneNum = self.textFieldPhone.text;
        p.mail = self.textFieldmail.text;
        p.signature = self.textFieldsignature.text;
        p.namePinYin = [ChineseToPinyin transformPinYinWithString:p.name];
        
        //NSString *content = @"Pass this value back to ViewControllerA";
        [self.delegate addItemViewController:self didFinishEnteringItem:p];
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
