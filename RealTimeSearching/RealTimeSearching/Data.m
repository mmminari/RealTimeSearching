//
//  Data.m
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "DataList.h"
#import "ResponseUser.h"


NSString *const kDataDataList = @"dataList";
NSString *const kDataTapType = @"tapType";
NSString *const kDataInputKeyword = @"inputKeyword";
NSString *const kDataResponseUser = @"ResponseUser";
NSString *const kDataTotalCount = @"totalCount";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize dataList = _dataList;
@synthesize tapType = _tapType;
@synthesize inputKeyword = _inputKeyword;
@synthesize responseUser = _responseUser;
@synthesize totalCount = _totalCount;


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
    NSObject *receivedDataList = [dict objectForKey:kDataDataList];
    NSMutableArray *parsedDataList = [NSMutableArray array];
    if ([receivedDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDataList addObject:[DataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDataList isKindOfClass:[NSDictionary class]]) {
       [parsedDataList addObject:[DataList modelObjectWithDictionary:(NSDictionary *)receivedDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedDataList];
            self.tapType = [self objectOrNilForKey:kDataTapType fromDictionary:dict];
            self.inputKeyword = [self objectOrNilForKey:kDataInputKeyword fromDictionary:dict];
    NSObject *receivedResponseUser = [dict objectForKey:kDataResponseUser];
    NSMutableArray *parsedResponseUser = [NSMutableArray array];
    if ([receivedResponseUser isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResponseUser) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResponseUser addObject:[ResponseUser modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResponseUser isKindOfClass:[NSDictionary class]]) {
       [parsedResponseUser addObject:[ResponseUser modelObjectWithDictionary:(NSDictionary *)receivedResponseUser]];
    }

    self.responseUser = [NSArray arrayWithArray:parsedResponseUser];
            self.totalCount = [[self objectOrNilForKey:kDataTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForDataList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dataList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDataList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDataList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kDataDataList];
    [mutableDict setValue:self.tapType forKey:kDataTapType];
    [mutableDict setValue:self.inputKeyword forKey:kDataInputKeyword];
    NSMutableArray *tempArrayForResponseUser = [NSMutableArray array];
    for (NSObject *subArrayObject in self.responseUser) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResponseUser addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResponseUser addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResponseUser] forKey:kDataResponseUser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kDataTotalCount];

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

    self.dataList = [aDecoder decodeObjectForKey:kDataDataList];
    self.tapType = [aDecoder decodeObjectForKey:kDataTapType];
    self.inputKeyword = [aDecoder decodeObjectForKey:kDataInputKeyword];
    self.responseUser = [aDecoder decodeObjectForKey:kDataResponseUser];
    self.totalCount = [aDecoder decodeDoubleForKey:kDataTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataList forKey:kDataDataList];
    [aCoder encodeObject:_tapType forKey:kDataTapType];
    [aCoder encodeObject:_inputKeyword forKey:kDataInputKeyword];
    [aCoder encodeObject:_responseUser forKey:kDataResponseUser];
    [aCoder encodeDouble:_totalCount forKey:kDataTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.dataList = [self.dataList copyWithZone:zone];
        copy.tapType = [self.tapType copyWithZone:zone];
        copy.inputKeyword = [self.inputKeyword copyWithZone:zone];
        copy.responseUser = [self.responseUser copyWithZone:zone];
        copy.totalCount = self.totalCount;
    }
    
    return copy;
}


@end
