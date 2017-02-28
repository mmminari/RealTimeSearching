//
//  ArtWorkThumb.m
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ArtWorkThumb.h"


NSString *const kArtWorkThumbIsMain = @"isMain";
NSString *const kArtWorkThumbHeight = @"height";
NSString *const kArtWorkThumbFileName = @"fileName";
NSString *const kArtWorkThumbOrder = @"order";
NSString *const kArtWorkThumbImageKey = @"imageKey";
NSString *const kArtWorkThumbSize = @"size";
NSString *const kArtWorkThumbWidth = @"width";
NSString *const kArtWorkThumbThumbType = @"thumbType";
NSString *const kArtWorkThumbDesc = @"desc";
NSString *const kArtWorkThumbUrl = @"url";


@interface ArtWorkThumb ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ArtWorkThumb

@synthesize isMain = _isMain;
@synthesize height = _height;
@synthesize fileName = _fileName;
@synthesize order = _order;
@synthesize imageKey = _imageKey;
@synthesize size = _size;
@synthesize width = _width;
@synthesize thumbType = _thumbType;
@synthesize desc = _desc;
@synthesize url = _url;


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
            self.isMain = [[self objectOrNilForKey:kArtWorkThumbIsMain fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kArtWorkThumbHeight fromDictionary:dict];
            self.fileName = [self objectOrNilForKey:kArtWorkThumbFileName fromDictionary:dict];
            self.order = [self objectOrNilForKey:kArtWorkThumbOrder fromDictionary:dict];
            self.imageKey = [self objectOrNilForKey:kArtWorkThumbImageKey fromDictionary:dict];
            self.size = [self objectOrNilForKey:kArtWorkThumbSize fromDictionary:dict];
            self.width = [self objectOrNilForKey:kArtWorkThumbWidth fromDictionary:dict];
            self.thumbType = [[self objectOrNilForKey:kArtWorkThumbThumbType fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kArtWorkThumbDesc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kArtWorkThumbUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMain] forKey:kArtWorkThumbIsMain];
    [mutableDict setValue:self.height forKey:kArtWorkThumbHeight];
    [mutableDict setValue:self.fileName forKey:kArtWorkThumbFileName];
    [mutableDict setValue:self.order forKey:kArtWorkThumbOrder];
    [mutableDict setValue:self.imageKey forKey:kArtWorkThumbImageKey];
    [mutableDict setValue:self.size forKey:kArtWorkThumbSize];
    [mutableDict setValue:self.width forKey:kArtWorkThumbWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thumbType] forKey:kArtWorkThumbThumbType];
    [mutableDict setValue:self.desc forKey:kArtWorkThumbDesc];
    [mutableDict setValue:self.url forKey:kArtWorkThumbUrl];

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

    self.isMain = [aDecoder decodeBoolForKey:kArtWorkThumbIsMain];
    self.height = [aDecoder decodeObjectForKey:kArtWorkThumbHeight];
    self.fileName = [aDecoder decodeObjectForKey:kArtWorkThumbFileName];
    self.order = [aDecoder decodeObjectForKey:kArtWorkThumbOrder];
    self.imageKey = [aDecoder decodeObjectForKey:kArtWorkThumbImageKey];
    self.size = [aDecoder decodeObjectForKey:kArtWorkThumbSize];
    self.width = [aDecoder decodeObjectForKey:kArtWorkThumbWidth];
    self.thumbType = [aDecoder decodeDoubleForKey:kArtWorkThumbThumbType];
    self.desc = [aDecoder decodeObjectForKey:kArtWorkThumbDesc];
    self.url = [aDecoder decodeObjectForKey:kArtWorkThumbUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isMain forKey:kArtWorkThumbIsMain];
    [aCoder encodeObject:_height forKey:kArtWorkThumbHeight];
    [aCoder encodeObject:_fileName forKey:kArtWorkThumbFileName];
    [aCoder encodeObject:_order forKey:kArtWorkThumbOrder];
    [aCoder encodeObject:_imageKey forKey:kArtWorkThumbImageKey];
    [aCoder encodeObject:_size forKey:kArtWorkThumbSize];
    [aCoder encodeObject:_width forKey:kArtWorkThumbWidth];
    [aCoder encodeDouble:_thumbType forKey:kArtWorkThumbThumbType];
    [aCoder encodeObject:_desc forKey:kArtWorkThumbDesc];
    [aCoder encodeObject:_url forKey:kArtWorkThumbUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ArtWorkThumb *copy = [[ArtWorkThumb alloc] init];
    
    if (copy) {

        copy.isMain = self.isMain;
        copy.height = [self.height copyWithZone:zone];
        copy.fileName = self.fileName;
        copy.order = self.order;
        copy.imageKey = [self.imageKey copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.thumbType = self.thumbType;
        copy.desc = self.desc;
        copy.url = self.url;
    }
    
    return copy;
}


@end
