//
//  UserCountSummary.h
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserCountSummary : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double celebrity;
@property (nonatomic, assign) double following;
@property (nonatomic, assign) double userIdx;
@property (nonatomic, assign) id hitTotalCount;
@property (nonatomic, assign) double follower;
@property (nonatomic, assign) double artWork;
@property (nonatomic, assign) double like;
@property (nonatomic, assign) id likeTotalCount;
@property (nonatomic, assign) double curation;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
