//
//  UserInfoCell.m
//  RealTimeSearching
//
//  Created by 김민아 on 2017. 2. 28..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "UserInfoCell.h"

@interface UserInfoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *ivUserProfile;
@property (weak, nonatomic) IBOutlet UILabel *lbUserNick;


@end

@implementation UserInfoCell

- (void)awakeFromNib
{
    [super awakeFromNib];

}

- (void)setUserProfileWithUrlString:(NSString *)urlString
{
    
}

- (void)setUserNick:(NSString *)userNick
{
    self.lbUserNick.text = userNick;
}



@end
