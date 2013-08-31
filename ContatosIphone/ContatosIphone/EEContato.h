//
//  EEContato.h
//  ContatosIphone
//
//  Created by Fabio Marinho on 24/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook/AddressBook.h"

typedef struct contact{
    NSString *primeiroNome;
    NSString *ultimoNome;
    NSString *email;
} contatoStruct;

@interface EEContato : NSObject{
    contatoStruct dados;
}

@property(nonatomic,assign) contatoStruct dados;

-(id) initWithDados: (contatoStruct) d;
+(NSMutableArray *) getContatosFromAddressBook:(ABAddressBookRef) abRef;

@end
