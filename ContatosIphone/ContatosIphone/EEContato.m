//
//  EEContato.m
//  ContatosIphone
//
//  Created by Fabio Marinho on 24/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "EEContato.h"

@implementation EEContato
@synthesize dados;

-(id) initWithDados: (contatoStruct) d{
    if (self=[super init]){
        self.dados = d;
    }
    return self;
}

+(NSMutableArray *) getContatosFromAddressBook:(ABAddressBookRef) abRef{
    ABRecordRef copiaAddressBook = ABAddressBookCopyDefaultSource(abRef);
    NSMutableArray *ret = [[[NSMutableArray alloc] init] autorelease];
    
    NSArray *arr = (__bridge NSArray *) ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(abRef, copiaAddressBook, kABPersonSortByLastName);
    NSMutableArray *arr2 = [[NSMutableArray alloc] init];
    int count = [arr count];
    for (int i=0;i<count;i++){
        ABRecordRef r = [arr objectAtIndex:i];
        contatoStruct c;
        c.primeiroNome = ABRecordCopyValue(r, kABPersonFirstNameProperty);
        c.ultimoNome = ABRecordCopyValue(r, kABPersonLastNameProperty);
        ABMultiValueRef email = ABRecordCopyValue(r, kABPersonEmailProperty);
        if (ABMultiValueGetCount(email)>0){
            c.email = ABMultiValueCopyValueAtIndex(email, 0);
        }
        EEContato *contato = [[EEContato alloc] initWithDados:c];
        [arr2 addObject:contato];
        [contato release];
        
    }
    return arr2;
}

@end
