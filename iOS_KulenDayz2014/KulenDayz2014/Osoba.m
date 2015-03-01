//
//  Osoba.m
//  KulenDayz2014
//
//  Created by Tomislav Jakopec on 03.09.2014..
//  Copyright (c) 2014. Tomislav Jakopec. All rights reserved.
//

#import "Osoba.h"
#import "Interes.h"
#import "Skola.h"

@implementation Osoba

-(id)initWithDictionary:(NSDictionary *) json
{
    self = [super init];
    if (self) {
        self.sifra = [[json objectForKey:@"sifra"] intValue];
        self.koeficijent = [[json objectForKey:@"koeficijent"] floatValue];
        self.ime = [json objectForKey:@"ime"];
        self.prezime = [json objectForKey:@"prezime"];
        self.slika = [json objectForKey:@"slika"];
        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [inputFormatter setLocale: usLocale];
        [inputFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];
        self.datumRodenja = [inputFormatter dateFromString: [json objectForKey:@"datumRodenja"]];
        NSDictionary *iteresi = [json objectForKey:@"interesi"];
        self.interesi = [[NSMutableArray alloc] init];
        Interes *i;
        for(id interes in iteresi) {
            i = [Interes alloc];
            i = [i initWithDictionary:interes];
            [self.interesi addObject: i];
        }
        
        Skola *s =[Skola alloc];
        s=[s initWithDictionary:[json objectForKey:@"skola"]];
        self.skola = s;
        
    }
    return self;
}

@end
