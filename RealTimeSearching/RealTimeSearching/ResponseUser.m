//
//  ResponseUser.m
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ResponseUser.h"
#import "UserCountSummary.h"
#import "ArtWorkThumb.h"


NSString *const kResponseUserFanbookUrl = @"fanbookUrl";
NSString *const kResponseUserSkin = @"skin";
NSString *const kResponseUserUserPhoto = @"userPhoto";
NSString *const kResponseUserUserGender = @"userGender";
NSString *const kResponseUserUserID = @"userID";
NSString *const kResponseUserUserCountSummary = @"userCountSummary";
NSString *const kResponseUserAuthorIcon = @"authorIcon";
NSString *const kResponseUserAuthorRequest = @"authorRequest";
NSString *const kResponseUserUserNameFirst = @"userNameFirst";
NSString *const kResponseUserUserJoinType = @"userJoinType";
NSString *const kResponseUserHasFollowing = @"hasFollowing";
NSString *const kResponseUserSkinText = @"skinText";
NSString *const kResponseUserUserShareUrl = @"userShareUrl";
NSString *const kResponseUserUserLevel = @"userLevel";
NSString *const kResponseUserUserIdx = @"userIdx";
NSString *const kResponseUserIsActive = @"isActive";
NSString *const kResponseUserArtWorkThumb = @"artWorkThumb";
NSString *const kResponseUserUserNick = @"userNick";
NSString *const kResponseUserUserJoinTypeName = @"userJoinTypeName";
NSString *const kResponseUserUserTitle = @"userTitle";
NSString *const kResponseUserUserCellPhoneCountryCode = @"userCellPhoneCountryCode";
NSString *const kResponseUserUserName = @"userName";
NSString *const kResponseUserUserCellPhone = @"userCellPhone";
NSString *const kResponseUserUserUUID = @"userUUID";
NSString *const kResponseUserUserSns = @"userSns";
NSString *const kResponseUserIsFollowing = @"isFollowing";


@interface ResponseUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResponseUser

@synthesize fanbookUrl = _fanbookUrl;
@synthesize skin = _skin;
@synthesize userPhoto = _userPhoto;
@synthesize userGender = _userGender;
@synthesize userID = _userID;
@synthesize userCountSummary = _userCountSummary;
@synthesize authorIcon = _authorIcon;
@synthesize authorRequest = _authorRequest;
@synthesize userNameFirst = _userNameFirst;
@synthesize userJoinType = _userJoinType;
@synthesize hasFollowing = _hasFollowing;
@synthesize skinText = _skinText;
@synthesize userShareUrl = _userShareUrl;
@synthesize userLevel = _userLevel;
@synthesize userIdx = _userIdx;
@synthesize isActive = _isActive;
@synthesize artWorkThumb = _artWorkThumb;
@synthesize userNick = _userNick;
@synthesize userJoinTypeName = _userJoinTypeName;
@synthesize userTitle = _userTitle;
@synthesize userCellPhoneCountryCode = _userCellPhoneCountryCode;
@synthesize userName = _userName;
@synthesize userCellPhone = _userCellPhone;
@synthesize userUUID = _userUUID;
@synthesize userSns = _userSns;
@synthesize isFollowing = _isFollowing;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.fanbookUrl = [self objectOrNilForKey:kResponseUserFanbookUrl fromDictionary:dict];
            self.skin = [self objectOrNilForKey:kResponseUserSkin fromDictionary:dict];
            self.userPhoto = [self objectOrNilForKey:kResponseUserUserPhoto fromDictionary:dict];
            self.userGender = [self objectOrNilForKey:kResponseUserUserGender fromDictionary:dict];
            self.userID = [self objectOrNilForKey:kResponseUserUserID fromDictionary:dict];
            self.userCountSummary = [UserCountSummary modelObjectWithDictionary:[dict objectForKey:kResponseUserUserCountSummary]];
            self.authorIcon = [[self objectOrNilForKey:kResponseUserAuthorIcon fromDictionary:dict] doubleValue];
            self.authorRequest = [self objectOrNilForKey:kResponseUserAuthorRequest fromDictionary:dict];
            self.userNameFirst = [self objectOrNilForKey:kResponseUserUserNameFirst fromDictionary:dict];
            self.userJoinType = [self objectOrNilForKey:kResponseUserUserJoinType fromDictionary:dict];
            self.hasFollowing = [[self objectOrNilForKey:kResponseUserHasFollowing fromDictionary:dict] boolValue];
            self.skinText = [self objectOrNilForKey:kResponseUserSkinText fromDictionary:dict];
            self.userShareUrl = [self objectOrNilForKey:kResponseUserUserShareUrl fromDictionary:dict];
            self.userLevel = [self objectOrNilForKey:kResponseUserUserLevel fromDictionary:dict];
            self.userIdx = [[self objectOrNilForKey:kResponseUserUserIdx fromDictionary:dict] doubleValue];
            self.isActive = [self objectOrNilForKey:kResponseUserIsActive fromDictionary:dict];
    NSObject *receivedArtWorkThumb = [dict objectForKey:kResponseUserArtWorkThumb];
    NSMutableArray *parsedArtWorkThumb = [NSMutableArray array];
    if ([receivedArtWorkThumb isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedArtWorkThumb) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedArtWorkThumb addObject:[ArtWorkThumb modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedArtWorkThumb isKindOfClass:[NSDictionary class]]) {
       [parsedArtWorkThumb addObject:[ArtWorkThumb modelObjectWithDictionary:(NSDictionary *)receivedArtWorkThumb]];
    }

    self.artWorkThumb = [NSArray arrayWithArray:parsedArtWorkThumb];
            self.userNick = [self objectOrNilForKey:kResponseUserUserNick fromDictionary:dict];
            self.userJoinTypeName = [self objectOrNilForKey:kResponseUserUserJoinTypeName fromDictionary:dict];
            self.userTitle = [self objectOrNilForKey:kResponseUserUserTitle fromDictionary:dict];
            self.userCellPhoneCountryCode = [self objectOrNilForKey:kResponseUserUserCellPhoneCountryCode fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kResponseUserUserName fromDictionary:dict];
            self.userCellPhone = [self objectOrNilForKey:kResponseUserUserCellPhone fromDictionary:dict];
            self.userUUID = [self objectOrNilForKey:kResponseUserUserUUID fromDictionary:dict];
            self.userSns = [self objectOrNilForKey:kResponseUserUserSns fromDictionary:dict];
            self.isFollowing = [[self objectOrNilForKey:kResponseUserIsFollowing fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.fanbookUrl forKey:kResponseUserFanbookUrl];
    [mutableDict setValue:self.skin forKey:kResponseUserSkin];
    [mutableDict setValue:self.userPhoto forKey:kResponseUserUserPhoto];
    [mutableDict setValue:self.userGender forKey:kResponseUserUserGender];
    [mutableDict setValue:self.userID forKey:kResponseUserUserID];
    [mutableDict setValue:[self.userCountSummary dictionaryRepresentation] forKey:kResponseUserUserCountSummary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorIcon] forKey:kResponseUserAuthorIcon];
    [mutableDict setValue:self.authorRequest forKey:kResponseUserAuthorRequest];
    [mutableDict setValue:self.userNameFirst forKey:kResponseUserUserNameFirst];
    [mutableDict setValue:self.userJoinType forKey:kResponseUserUserJoinType];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasFollowing] forKey:kResponseUserHasFollowing];
    [mutableDict setValue:self.skinText forKey:kResponseUserSkinText];
    [mutableDict setValue:self.userShareUrl forKey:kResponseUserUserShareUrl];
    [mutableDict setValue:self.userLevel forKey:kResponseUserUserLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdx] forKey:kResponseUserUserIdx];
    [mutableDict setValue:self.isActive forKey:kResponseUserIsActive];
    NSMutableArray *tempArrayForArtWorkThumb = [NSMutableArray array];
    for (NSObject *subArrayObject in self.artWorkThumb) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForArtWorkThumb addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForArtWorkThumb addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArtWorkThumb] forKey:kResponseUserArtWorkThumb];
    [mutableDict setValue:self.userNick forKey:kResponseUserUserNick];
    [mutableDict setValue:self.userJoinTypeName forKey:kResponseUserUserJoinTypeName];
    [mutableDict setValue:self.userTitle forKey:kResponseUserUserTitle];
    [mutableDict setValue:self.userCellPhoneCountryCode forKey:kResponseUserUserCellPhoneCountryCode];
    [mutableDict setValue:self.userName forKey:kResponseUserUserName];
    [mutableDict setValue:self.userCellPhone forKey:kResponseUserUserCellPhone];
    [mutableDict setValue:self.userUUID forKey:kResponseUserUserUUID];
    [mutableDict setValue:self.userSns forKey:kResponseUserUserSns];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollowing] forKey:kResponseUserIsFollowing];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.fanbookUrl = [aDecoder decodeObjectForKey:kResponseUserFanbookUrl];
    self.skin = [aDecoder decodeObjectForKey:kResponseUserSkin];
    self.userPhoto = [aDecoder decodeObjectForKey:kResponseUserUserPhoto];
    self.userGender = [aDecoder decodeObjectForKey:kResponseUserUserGender];
    self.userID = [aDecoder decodeObjectForKey:kResponseUserUserID];
    self.userCountSummary = [aDecoder decodeObjectForKey:kResponseUserUserCountSummary];
    self.authorIcon = [aDecoder decodeDoubleForKey:kResponseUserAuthorIcon];
    self.authorRequest = [aDecoder decodeObjectForKey:kResponseUserAuthorRequest];
    self.userNameFirst = [aDecoder decodeObjectForKey:kResponseUserUserNameFirst];
    self.userJoinType = [aDecoder decodeObjectForKey:kResponseUserUserJoinType];
    self.hasFollowing = [aDecoder decodeBoolForKey:kResponseUserHasFollowing];
    self.skinText = [aDecoder decodeObjectForKey:kResponseUserSkinText];
    self.userShareUrl = [aDecoder decodeObjectForKey:kResponseUserUserShareUrl];
    self.userLevel = [aDecoder decodeObjectForKey:kResponseUserUserLevel];
    self.userIdx = [aDecoder decodeDoubleForKey:kResponseUserUserIdx];
    self.isActive = [aDecoder decodeObjectForKey:kResponseUserIsActive];
    self.artWorkThumb = [aDecoder decodeObjectForKey:kResponseUserArtWorkThumb];
    self.userNick = [aDecoder decodeObjectForKey:kResponseUserUserNick];
    self.userJoinTypeName = [aDecoder decodeObjectForKey:kResponseUserUserJoinTypeName];
    self.userTitle = [aDecoder decodeObjectForKey:kResponseUserUserTitle];
    self.userCellPhoneCountryCode = [aDecoder decodeObjectForKey:kResponseUserUserCellPhoneCountryCode];
    self.userName = [aDecoder decodeObjectForKey:kResponseUserUserName];
    self.userCellPhone = [aDecoder decodeObjectForKey:kResponseUserUserCellPhone];
    self.userUUID = [aDecoder decodeObjectForKey:kResponseUserUserUUID];
    self.userSns = [aDecoder decodeObjectForKey:kResponseUserUserSns];
    self.isFollowing = [aDecoder decodeBoolForKey:kResponseUserIsFollowing];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_fanbookUrl forKey:kResponseUserFanbookUrl];
    [aCoder encodeObject:_skin forKey:kResponseUserSkin];
    [aCoder encodeObject:_userPhoto forKey:kResponseUserUserPhoto];
    [aCoder encodeObject:_userGender forKey:kResponseUserUserGender];
    [aCoder encodeObject:_userID forKey:kResponseUserUserID];
    [aCoder encodeObject:_userCountSummary forKey:kResponseUserUserCountSummary];
    [aCoder encodeDouble:_authorIcon forKey:kResponseUserAuthorIcon];
    [aCoder encodeObject:_authorRequest forKey:kResponseUserAuthorRequest];
    [aCoder encodeObject:_userNameFirst forKey:kResponseUserUserNameFirst];
    [aCoder encodeObject:_userJoinType forKey:kResponseUserUserJoinType];
    [aCoder encodeBool:_hasFollowing forKey:kResponseUserHasFollowing];
    [aCoder encodeObject:_skinText forKey:kResponseUserSkinText];
    [aCoder encodeObject:_userShareUrl forKey:kResponseUserUserShareUrl];
    [aCoder encodeObject:_userLevel forKey:kResponseUserUserLevel];
    [aCoder encodeDouble:_userIdx forKey:kResponseUserUserIdx];
    [aCoder encodeObject:_isActive forKey:kResponseUserIsActive];
    [aCoder encodeObject:_artWorkThumb forKey:kResponseUserArtWorkThumb];
    [aCoder encodeObject:_userNick forKey:kResponseUserUserNick];
    [aCoder encodeObject:_userJoinTypeName forKey:kResponseUserUserJoinTypeName];
    [aCoder encodeObject:_userTitle forKey:kResponseUserUserTitle];
    [aCoder encodeObject:_userCellPhoneCountryCode forKey:kResponseUserUserCellPhoneCountryCode];
    [aCoder encodeObject:_userName forKey:kResponseUserUserName];
    [aCoder encodeObject:_userCellPhone forKey:kResponseUserUserCellPhone];
    [aCoder encodeObject:_userUUID forKey:kResponseUserUserUUID];
    [aCoder encodeObject:_userSns forKey:kResponseUserUserSns];
    [aCoder encodeBool:_isFollowing forKey:kResponseUserIsFollowing];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResponseUser *copy = [[ResponseUser alloc] init];
    
    if (copy) {

        copy.fanbookUrl = self.fanbookUrl;
        copy.skin = self.skin;
        copy.userPhoto = [self.userPhoto copyWithZone:zone];
        copy.userGender = [self.userGender copyWithZone:zone];
        copy.userID = [self.userID copyWithZone:zone];
        copy.userCountSummary = [self.userCountSummary copyWithZone:zone];
        copy.authorIcon = self.authorIcon;
        copy.authorRequest = self.authorRequest;
        copy.userNameFirst = self.userNameFirst;
        copy.userJoinType = [self.userJoinType copyWithZone:zone];
        copy.hasFollowing = self.hasFollowing;
        copy.skinText = self.skinText;
        copy.userShareUrl = [self.userShareUrl copyWithZone:zone];
        copy.userLevel = [self.userLevel copyWithZone:zone];
        copy.userIdx = self.userIdx;
        copy.isActive = [self.isActive copyWithZone:zone];
        copy.artWorkThumb = [self.artWorkThumb copyWithZone:zone];
        copy.userNick = [self.userNick copyWithZone:zone];
        copy.userJoinTypeName = [self.userJoinTypeName copyWithZone:zone];
        copy.userTitle = self.userTitle;
        copy.userCellPhoneCountryCode = self.userCellPhoneCountryCode;
        copy.userName = [self.userName copyWithZone:zone];
        copy.userCellPhone = self.userCellPhone;
        copy.userUUID = [self.userUUID copyWithZone:zone];
        copy.userSns = self.userSns;
        copy.isFollowing = self.isFollowing;
    }
    
    return copy;
}


@end
