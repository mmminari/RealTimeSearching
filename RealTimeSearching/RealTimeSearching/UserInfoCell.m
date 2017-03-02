//
//  UserInfoCell.m
//  RealTimeSearching
//
//  Created by 김민아 on 2017. 2. 28..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "UserInfoCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


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
    [self setImageView:self.ivUserProfile urlString:urlString placeholderImage:nil animation:YES];
}

- (void)setUserNick:(NSString *)userNick
{
    self.lbUserNick.text = userNick;
}


-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani
{
    NSURL *url = [NSURL URLWithString:urlString];
    [imageView sd_setImageWithURL:url placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         if(cacheType == SDImageCacheTypeNone)
         {
             if(ani)
             {
                 
                 [imageView.layer addAnimation:[self fadeOutAnimationForChangeImage] forKey:@"fadeOutAnimationForChangeImage"];
             }
             
         }
     }];
}

- (CATransition *)fadeOutAnimationForChangeImage
{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    return transition;
}


@end
