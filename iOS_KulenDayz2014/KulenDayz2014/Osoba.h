//
//  Osoba.h
//  KulenDayz2014
//
//  Created by Tomislav Jakopec on 03.09.2014..
//  Copyright (c) 2014. Tomislav Jakopec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Skola.h"

@interface Osoba : NSObject

@property int sifra;
@property float koeficijent;
@property NSString *ime;
@property NSString *prezime;
@property NSDate *datumRodenja;
@property NSString *slika;
@property Skola *skola;
@property NSMutableArray *interesi;

- (id)initWithDictionary:(NSDictionary *) json;

@end
