//
//  EEEmpresa.m
//  EmpresasEIA
//
//  Created by Fabio Marinho on 06/07/13.
//  Copyright (c) 2013 eia. All rights reserved.
//

#import "EEEmpresa.h"

@implementation EEEmpresa
@synthesize _nome, _qtdeFuncionarios;

-(id) initWithNome:(NSString *) nomeInicial andFuncionarios:(NSNumber *) funcionarios{

    if (self=[super init]){
        self._nome = nomeInicial;
        self._qtdeFuncionarios = funcionarios;
    }
    return self;
}


-(void) dealloc{
    [_nome release];
    [_qtdeFuncionarios release];
    [super dealloc];
}

@end
