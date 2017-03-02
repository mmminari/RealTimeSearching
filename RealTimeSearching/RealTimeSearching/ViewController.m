//
//  ViewController.m
//  RealTimeSearching
//
//  Created by 김민아 on 2017. 2. 27..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoCell.h"

#import "HTTPClient.h"
#import "DataModels.h"

@interface ViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) HTTPClient *httpClient;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) NSArray *userList;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"UserInfoCell" bundle:nil] forCellReuseIdentifier:@"UserInfoCell"];
    
    self.httpClient = [[HTTPClient alloc]initWithBaseURL];
    self.queue = [[NSOperationQueue alloc]init];
    self.userList = [NSArray array];
    
    [self reqLogin];

}

#pragma mark - Request
- (void)reqLogin
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setObject:@"yonghwinam@smtown.com" forKey:@"userID"];
    [param setObject:@"apple0000" forKey:@"userPassword"];
    [param setObject:@"autoLogin" forKey:@"Y"];
    
    NSDictionary *resigsterDevice =
    @{
      @"deviceToken":@"token",
      @"deviceType":@"ios",
      @"version":@"1",
      @"lang":@"ko",
      @"isPushOn":[NSNumber numberWithBool:TRUE],
      @"isPushDebug":[NSNumber numberWithBool:TRUE]
      };
    
    [param setObject:resigsterDevice forKey:@"registerDevice"];
    
    [self.httpClient POSTWithUrlString:@"/auth" parameters:param success:^(id results) {
        [self successCompletionOfReqLoginWithResult:results];
    } failure:^(NSError *error) {
        NSLog(@"Login Error : %@", error.description);
    }];
}

- (void)reqUserSearchWithSearchText:(NSString *)searchText
{
    NSDictionary *param = @{
                            @"userIdx":@(1035),
                            @"page":@"1",
                            @"count":@"30",
                            @"lang":@"ko",
                            @"keyword":searchText,
                            @"filter:":@"",
                            @"tapType":@"1"
                            };
    
    NSLog(@"param : %@", searchText);
    
    [self.httpClient SearchWithUrlString:@"/search" parameters:param success:^(id results) {
        
        [self successCompletionOfReqUserSearchWithResult:results];
        NSLog(@"success");
        
    } failure:^(NSError *error) {
        //NSLog(@"error :%@", error.description);
    }];
}

- (void)testWithText:(NSString *)text
{
    NSLog(@"testWithText : %@", text);
}

#pragma mark - Process
- (void)successCompletionOfReqLoginWithResult:(id)results
{
    NSLog(@"Login Results : %@", results);
}

- (void)successCompletionOfReqUserSearchWithResult:(id)results
{
    UserSearch *resultUsers = [UserSearch modelObjectWithDictionary:results];
    
    if(resultUsers.code == 0)
    {
        self.userList = resultUsers.data.responseUser;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"searchBar : %@", searchBar.text);
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText isEqualToString:@""])
    {
        self.userList = nil;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
    else
    {
        [self reqUserSearchWithSearchText:searchText];
    }

}
   

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    
    result = self.userList.count;
    
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UserInfoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UserInfoCell" forIndexPath:indexPath];
    
    @try {
        ResponseUser *user = self.userList[indexPath.row];
        
        [cell setUserNick:user.userNick];
        
        [cell setUserProfileWithUrlString:user.userPhoto];
        
    } @catch (NSException *exception) {
        
        NSLog(@"exception : %@", exception.description);
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat result = 50.0f;
    
    return result;
}

@end
