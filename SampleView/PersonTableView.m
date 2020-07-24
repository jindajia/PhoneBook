//
//  PersonTableView.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/14.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "PersonTableView.h"
#import "Person.h"
#import "DetailInfoViewController.h"
@implementation PersonTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//   return [self.personList count];
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"Cell"];
//    if(!cell){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
//    }
//    Person *p = self.personList[indexPath.row];
//    NSString *s = p.name;
//    NSString *s2 = p.phoneNum;
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld  %@",indexPath.row,s];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",s2];
//    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
//    
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",(long)indexPath.row);
//    
//    DetailInfoViewController *dvc = [[DetailInfoViewController alloc] init];
//    [dvc initWithPerson:[self.personList objectAtIndex:indexPath.row]];
//    UIViewController * uvc = [self.superview nextResponder];
//    [uvc.navigationController pushViewController:dvc animated:YES];
//}
@end
