//
//  ResponseUser.h
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserCountSummary;

@interface ResponseUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id fanbookUrl;
@property (nonatomic, assign) id skin;
@property (nonatomic, strong) NSString *userPhoto;
@property (nonatomic, strong) NSString *userGender;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) UserCountSummary *userCountSummary;
@property (nonatomic, assign) double authorIcon;
@property (nonatomic, assign) id authorRequest;
@property (nonatomic, assign) id userNameFirst;
@property (nonatomic, strong) NSString *userJoinType;
@property (nonatomic, assign) BOOL hasFollowing;
@property (nonatomic, assign) id skinText;
@property (nonatomic, strong) NSString *userShareUrl;
@property (nonatomic, strong) NSString *userLevel;
@property (nonatomic, assign) double userIdx;
@property (nonatomic, strong) NSString *isActive;
@property (nonatomic, strong) NSArray *artWorkThumb;
@property (nonatomic, strong) NSString *userNick;
@property (nonatomic, strong) NSString *userJoinTypeName;
@property (nonatomic, assign) id userTitle;
@property (nonatomic, assign) id userCellPhoneCountryCode;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) id userCellPhone;
@property (nonatomic, strong) NSString *userUUID;
@property (nonatomic, assign) id userSns;
@property (nonatomic, assign) BOOL isFollowing;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
