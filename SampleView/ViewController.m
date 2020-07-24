//
//  ViewController.m
//  SampleView
//
//  Created by 贾金达 on 2020/7/12.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "ViewController.h"
#import "PersonTableView.h"
#import "NewPersonViewController.h"
#import "AllPersonGroup.h"
#import "EditPersonViewController.h"
#import "PersonGroup.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,NewPersonControllerDelegate>
@property (nonatomic) PersonTableView *tableView;
@property UIView *headView;
@property UIView *footerView;
@property UISearchBar *searchBar;
@property UIButton *buttonNewPerson;
@property NSMutableArray *searchArray;//保存搜索结果
@property BOOL isSearching;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self createTableView];
    
    
 
}
- (void)addItemViewController:(NewPersonViewController *)controller didFinishEnteringItem:(Person *)p
{
    [self.personList addObject:p];
    [self.tableView reloadData];
    [Person personArraytoData:self.personList position:@"/Users/jiajinda/Developer/SampleView/info.txt"];
    NSLog(@"This was returned from NewPersonViewController %@",p.name);
}
- (void)editItemViewController:(EditPersonViewController *)controller didFinishEnteringItem:(Person *)item{
    for(int i=0;i<self.personList.count;++i){
        Person *pp = [self.personList objectAtIndex:i];
        if(pp.personNo==item.personNo){
            [self.personList removeObjectAtIndex:i];
            [self.personList addObject:item];
            continue;
        }
    }
    [self.tableView reloadData];
    [Person personArraytoData:self.personList position:@"/Users/jiajinda/Developer/SampleView/info.txt"];
}
//绘制通讯录的搜索框
- (UIView *)createHeadViewForTableView{
    self.headView = [[UIView alloc] init];
    CGRect headViewFrame = CGRectMake(15,0, SCREEN_WIDTH, 54);
    self.headView.backgroundColor = [UIColor whiteColor];
    self.headView.frame = headViewFrame;
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.backgroundColor = [UIColor whiteColor];
    self.searchBar.placeholder = @"联系人姓名";
    self.searchBar.frame = CGRectMake(15, 7, SCREEN_WIDTH-30, 40);
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    self.searchBar.delegate = self;
    [self.headView addSubview:self.searchBar];
    return self.headView;
}
- (UIView *)createFooterViewForTableView{
    self.footerView = [[UIView alloc] init];
    CGRect footerViewFrame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 50);
    self.footerView.frame = footerViewFrame;
    self.footerView.backgroundColor = [UIColor whiteColor];
    
    self.buttonNewPerson = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    CGRect buttonNewPersonFrame = CGRectMake(SCREEN_WIDTH-60, 5, 50, 40);
    [self.buttonNewPerson setTitle:@"新建" forState:UIControlStateNormal] ;
    self.buttonNewPerson.backgroundColor = [UIColor whiteColor];
    self.buttonNewPerson.frame = buttonNewPersonFrame;
    self.buttonNewPerson.showsTouchWhenHighlighted = YES;
    [self.footerView addSubview:self.buttonNewPerson];
    
    [self.buttonNewPerson addTarget:self action:@selector(newPerson) forControlEvents:UIControlEventTouchUpInside];
    return self.footerView;
}
//绘制tableview
- (void) createTableView{
    self.isSearching = false;
    self.title = @"通讯录";
    self.tableView = [[PersonTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableHeaderView = [self createHeadViewForTableView];
    self.tableView.tableFooterView = [self createFooterViewForTableView];
    [self.view addSubview:self.tableView];
    
    self.personList = [Person dataToPersonList:@"/Users/jiajinda/Developer/SampleView/info.txt"];
    AllPersonGroup *allGroup = [AllPersonGroup initWithPersonList:self.personList];
    self.personList = [allGroup dictToList];
    
}
#pragma - DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.isSearching){
        return [self.searchArray count];}
    else{
        return [self.personList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(!self.isSearching){
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
        Person *p = self.personList[indexPath.row];
    NSString *s = p.name;
    NSString *s2 = p.signature;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld  %@",indexPath.row,s];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",s2];
    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        return cell;
    }
    else{
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellSearching"];
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellSearching"];
        }
        Person *p = self.searchArray[indexPath.row];
        NSString *s = p.name;
        NSString *s2 = p.signature;
        cell.textLabel.text = [NSString stringWithFormat:@"%ld  %@",indexPath.row,s];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",s2];
        cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        return cell;
    }
}
#pragma - Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    
    EditPersonViewController *evc = [[EditPersonViewController alloc] init];
    evc.person = [self.personList objectAtIndex:indexPath.row];
    evc.delegate2 = self;
    [self.navigationController pushViewController:evc animated:YES];
    
//    DetailInfoViewController *dvc = [[DetailInfoViewController alloc] init];
//    [dvc initWithPerson:[self.personList objectAtIndex:indexPath.row]];
//    [self.navigationController pushViewController:dvc animated:YES];
}

-(UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (@available(iOS 11.0, *)) {
        UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
            [self.personList removeObjectAtIndex:indexPath.row];
    
            NSArray *deleteIndexPaths = [NSArray arrayWithObjects:
                                         [NSIndexPath indexPathForRow:indexPath.row inSection:0],
                                         nil];

            [self.tableView deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationFade];
            
            
        }];
        //删除存储列表中的通讯录
        [Person personArraytoData:self.personList position:@"/Users/jiajinda/Developer/SampleView/info.txt"];
        //也可以设置图片
        deleteAction.backgroundColor = [UIColor redColor];
        UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction]];
        return config;
    } else {
        // Fallback on earlier versions
        return nil;
    }
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText; {
    NSLog(searchText);
    if(searchText.length>0){
        self.searchArray = [Person searchingPersonList:self.personList searchingName:searchText];
        self.isSearching = true;
        NSLog(@"Searching");
    }
    else{
        self.isSearching = false;
        NSLog(@"Not Searching");
    }
    [self.tableView reloadData];
}

- (void)newPerson{
    NewPersonViewController *nev = [[NewPersonViewController alloc] init];
    nev.delegate = self;
    [self.navigationController pushViewController:nev animated:YES];
    NSLog(@"newPerson");
}
//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleDelete;
//}
//-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return @"删除";
//}
@end
