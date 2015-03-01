//
//  ViewController.m
//  KulenDayz2014
//
//  Created by Tomislav Jakopec on 03.09.2014..
//  Copyright (c) 2014. Tomislav Jakopec. All rights reserved.
//

#import "ViewController.h"
#import "Osoba.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize labela;
@synthesize slika;

-(IBAction) klikGumb1:(id) sender
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://jakopec.com/kulendayz2014/realniPrimjerBaza.php"]];
    __block NSDictionary *osobeDictionary;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
     osobeDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *osobe =[[NSMutableArray alloc] init];
    Osoba *o;
    for(id key in osobeDictionary) {
     o = [Osoba alloc];
     o = [o initWithDictionary:key];
     [osobe addObject: o];
    }
    NSURL *URL = [NSURL URLWithString:
    [NSString stringWithFormat:@"data:application/octet-stream;base64,%@", [o slika]]];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"d'.' MMMM yyyy"];
    slika.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
    NSString *s = [o ime];
    s=[s stringByAppendingString:@" "];
    s=[s stringByAppendingString:[o prezime]];
    s=[s stringByAppendingString:@" "];
    s=[s stringByAppendingString:[outputFormatter stringFromDate:[o datumRodenja]]];
    s=[s stringByAppendingString:@" "];
    s=[s stringByAppendingString:[[o skola] adresa] ];
    labela.text=s;
     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
