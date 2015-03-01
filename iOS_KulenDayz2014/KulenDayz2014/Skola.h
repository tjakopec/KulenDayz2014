//
//  Skola.h
//  KulenDayz2014
//
//  Created by Tomislav Jakopec on 03.09.2014..
//  Copyright (c) 2014. Tomislav Jakopec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Skola : NSObject

@property int sifra;
@property NSString *naziv;
@property NSString *adresa;

- (id)initWithDictionary:(NSDictionary *) json;

@end
