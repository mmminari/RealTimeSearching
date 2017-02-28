//
//  UserInfoCell.h
//  RealTimeSearching
//
//  Created by 김민아 on 2017. 2. 28..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoCell : UITableViewCell

- (void)setUserProfileWithUrlString:(NSString *)urlString;
- (void)setUserNick:(NSString *)userNick;

@end
