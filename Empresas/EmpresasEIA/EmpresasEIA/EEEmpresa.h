//
//  EEEmpresa.h
//  EmpresasEIA
//
//  Created by Fabio Marinho on 06/07/13.
//  Copyright (c) 2013 eia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EEEmpresa : NSObject
{
    NSString *_nome;
    NSNumber *_qtdeFuncionarios;
}

-(id) initWithNome:(NSString *) nomeInicial andFuncionarios:(NSNumber *) funcionarios;

@property (nonatomic,retain) NSString *_nome;
@property (nonatomic,retain) NSNumber *_qtdeFuncionarios;


@end
