//
//  UserCountSummary.m
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "UserCountSummary.h"


NSString *const kUserCountSummaryCelebrity = @"celebrity";
NSString *const kUserCountSummaryFollowing = @"following";
NSString *const kUserCountSummaryUserIdx = @"userIdx";
NSString *const kUserCountSummaryHitTotalCount = @"hitTotalCount";
NSString *const kUserCountSummaryFollower = @"follower";
NSString *const kUserCountSummaryArtWork = @"artWork";
NSString *const kUserCountSummaryLike = @"like";
NSString *const kUserCountSummaryLikeTotalCount = @"likeTotalCount";
NSString *const kUserCountSummaryCuration = @"curation";


@interface UserCountSummary ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserCountSummary

@synthesize celebrity = _celebrity;
@synthesize following = _following;
@synthesize userIdx = _userIdx;
@synthesize hitTotalCount = _hitTotalCount;
@synthesize follower = _follower;
@synthesize artWork = _artWork;
@synthesize like = _like;
@synthesize likeTotalCount = _likeTotalCount;
@synthesize curation = _curation;


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
            self.celebrity = [[self objectOrNilForKey:kUserCountSummaryCelebrity fromDictionary:dict] doubleValue];
            self.following = [[self objectOrNilForKey:kUserCountSummaryFollowing fromDictionary:dict] doubleValue];
            self.userIdx = [[self objectOrNilForKey:kUserCountSummaryUserIdx fromDictionary:dict] doubleValue];
            self.hitTotalCount = [self objectOrNilForKey:kUserCountSummaryHitTotalCount fromDictionary:dict];
            self.follower = [[self objectOrNilForKey:kUserCountSummaryFollower fromDictionary:dict] doubleValue];
            self.artWork = [[self objectOrNilForKey:kUserCountSummaryArtWork fromDictionary:dict] doubleValue];
            self.like = [[self objectOrNilForKey:kUserCountSummaryLike fromDictionary:dict] doubleValue];
            self.likeTotalCount = [self objectOrNilForKey:kUserCountSummaryLikeTotalCount fromDictionary:dict];
            self.curation = [[self objectOrNilForKey:kUserCountSummaryCuration fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.celebrity] forKey:kUserCountSummaryCelebrity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.following] forKey:kUserCountSummaryFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdx] forKey:kUserCountSummaryUserIdx];
    [mutableDict setValue:self.hitTotalCount forKey:kUserCountSummaryHitTotalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.follower] forKey:kUserCountSummaryFollower];
    [mutableDict setValue:[NSNumber numberWithDouble:self.artWork] forKey:kUserCountSummaryArtWork];
    [mutableDict setValue:[NSNumber numberWithDouble:self.like] forKey:kUserCountSummaryLike];
    [mutableDict setValue:self.likeTotalCount forKey:kUserCountSummaryLikeTotalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.curation] forKey:kUserCountSummaryCuration];

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

    self.celebrity = [aDecoder decodeDoubleForKey:kUserCountSummaryCelebrity];
    self.following = [aDecoder decodeDoubleForKey:kUserCountSummaryFollowing];
    self.userIdx = [aDecoder decodeDoubleForKey:kUserCountSummaryUserIdx];
    self.hitTotalCount = [aDecoder decodeObjectForKey:kUserCountSummaryHitTotalCount];
    self.follower = [aDecoder decodeDoubleForKey:kUserCountSummaryFollower];
    self.artWork = [aDecoder decodeDoubleForKey:kUserCountSummaryArtWork];
    self.like = [aDecoder decodeDoubleForKey:kUserCountSummaryLike];
    self.likeTotalCount = [aDecoder decodeObjectForKey:kUserCountSummaryLikeTotalCount];
    self.curation = [aDecoder decodeDoubleForKey:kUserCountSummaryCuration];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_celebrity forKey:kUserCountSummaryCelebrity];
    [aCoder encodeDouble:_following forKey:kUserCountSummaryFollowing];
    [aCoder encodeDouble:_userIdx forKey:kUserCountSummaryUserIdx];
    [aCoder encodeObject:_hitTotalCount forKey:kUserCountSummaryHitTotalCount];
    [aCoder encodeDouble:_follower forKey:kUserCountSummaryFollower];
    [aCoder encodeDouble:_artWork forKey:kUserCountSummaryArtWork];
    [aCoder encodeDouble:_like forKey:kUserCountSummaryLike];
    [aCoder encodeObject:_likeTotalCount forKey:kUserCountSummaryLikeTotalCount];
    [aCoder encodeDouble:_curation forKey:kUserCountSummaryCuration];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserCountSummary *copy = [[UserCountSummary alloc] init];
    
    if (copy) {

        copy.celebrity = self.celebrity;
        copy.following = self.following;
        copy.userIdx = self.userIdx;
        copy.hitTotalCount = self.hitTotalCount;
        copy.follower = self.follower;
        copy.artWork = self.artWork;
        copy.like = self.like;
        copy.likeTotalCount = self.likeTotalCount;
        copy.curation = self.curation;
    }
    
    return copy;
}


@end
