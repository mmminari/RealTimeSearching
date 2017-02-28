//
//  Data.h
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSString *tapType;
@property (nonatomic, strong) NSString *inputKeyword;
@property (nonatomic, strong) NSArray *responseUser;
@property (nonatomic, assign) double totalCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
