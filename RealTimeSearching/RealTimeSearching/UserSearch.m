//
//  UserSearch.m
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "UserSearch.h"
#import "Data.h"


NSString *const kUserSearchMessage = @"message";
NSString *const kUserSearchData = @"data";
NSString *const kUserSearchCode = @"code";


@interface UserSearch ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserSearch

@synthesize message = _message;
@synthesize data = _data;
@synthesize code = _code;


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
            self.message = [self objectOrNilForKey:kUserSearchMessage fromDictionary:dict];
            self.data = [Data modelObjectWithDictionary:[dict objectForKey:kUserSearchData]];
            self.code = [[self objectOrNilForKey:kUserSearchCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kUserSearchMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kUserSearchData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kUserSearchCode];

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

    self.message = [aDecoder decodeObjectForKey:kUserSearchMessage];
    self.data = [aDecoder decodeObjectForKey:kUserSearchData];
    self.code = [aDecoder decodeDoubleForKey:kUserSearchCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kUserSearchMessage];
    [aCoder encodeObject:_data forKey:kUserSearchData];
    [aCoder encodeDouble:_code forKey:kUserSearchCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserSearch *copy = [[UserSearch alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
