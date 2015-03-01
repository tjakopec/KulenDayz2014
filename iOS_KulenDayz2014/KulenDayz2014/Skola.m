//
//  Skola.m
//  KulenDayz2014
//
//  Created by Tomislav Jakopec on 03.09.2014..
//  Copyright (c) 2014. Tomislav Jakopec. All rights reserved.
//

#import "Skola.h"

@implementation Skola

-(id)initWithDictionary:(NSDictionary *) json
{
    self = [super init];
    if (self) {
        self.sifra = [[json objectForKey:@"sifra"] intValue];
        self.naziv = [json objectForKey:@"naziv"];
        self.adresa = [json objectForKey:@"adresa"];
    }
    return self;
}


@end
