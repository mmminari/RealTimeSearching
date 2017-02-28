//
//  DataList.m
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DataList.h"


NSString *const kDataListDisplayOrder = @"displayOrder";
NSString *const kDataListOrderIdx = @"orderIdx";
NSString *const kDataListDeleteFlag = @"deleteFlag";
NSString *const kDataListDescKR = @"descKR";
NSString *const kDataListTitleKR = @"titleKR";


@interface DataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DataList

@synthesize displayOrder = _displayOrder;
@synthesize orderIdx = _orderIdx;
@synthesize deleteFlag = _deleteFlag;
@synthesize descKR = _descKR;
@synthesize titleKR = _titleKR;


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
            self.displayOrder = [[self objectOrNilForKey:kDataListDisplayOrder fromDictionary:dict] doubleValue];
            self.orderIdx = [[self objectOrNilForKey:kDataListOrderIdx fromDictionary:dict] doubleValue];
            self.deleteFlag = [[self objectOrNilForKey:kDataListDeleteFlag fromDictionary:dict] boolValue];
            self.descKR = [self objectOrNilForKey:kDataListDescKR fromDictionary:dict];
            self.titleKR = [self objectOrNilForKey:kDataListTitleKR fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayOrder] forKey:kDataListDisplayOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderIdx] forKey:kDataListOrderIdx];
    [mutableDict setValue:[NSNumber numberWithBool:self.deleteFlag] forKey:kDataListDeleteFlag];
    [mutableDict setValue:self.descKR forKey:kDataListDescKR];
    [mutableDict setValue:self.titleKR forKey:kDataListTitleKR];

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

    self.displayOrder = [aDecoder decodeDoubleForKey:kDataListDisplayOrder];
    self.orderIdx = [aDecoder decodeDoubleForKey:kDataListOrderIdx];
    self.deleteFlag = [aDecoder decodeBoolForKey:kDataListDeleteFlag];
    self.descKR = [aDecoder decodeObjectForKey:kDataListDescKR];
    self.titleKR = [aDecoder decodeObjectForKey:kDataListTitleKR];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_displayOrder forKey:kDataListDisplayOrder];
    [aCoder encodeDouble:_orderIdx forKey:kDataListOrderIdx];
    [aCoder encodeBool:_deleteFlag forKey:kDataListDeleteFlag];
    [aCoder encodeObject:_descKR forKey:kDataListDescKR];
    [aCoder encodeObject:_titleKR forKey:kDataListTitleKR];
}

- (id)copyWithZone:(NSZone *)zone
{
    DataList *copy = [[DataList alloc] init];
    
    if (copy) {

        copy.displayOrder = self.displayOrder;
        copy.orderIdx = self.orderIdx;
        copy.deleteFlag = self.deleteFlag;
        copy.descKR = [self.descKR copyWithZone:zone];
        copy.titleKR = [self.titleKR copyWithZone:zone];
    }
    
    return copy;
}


@end
