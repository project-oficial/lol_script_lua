*está e uma documentação de como criar um script para a plataforma*

# Classes GERAIS

As estruturas Vec2, Vec3 e Vec4 são usadas na plataforma para representar vetores de 2, 3 e 4 componentes, respectivamente.
## Vec2
A estrutura Vec2 possui as seguintes propriedades:

-   `x`: componente X do vetor
-   `y`: componente Y do vetor

### Construtores

-   `Vec2()`: cria um vetor com valores (0, 0)
-   `Vec2(x, y)`: cria um vetor com os valores informados para as componentes X e Y

## Vec3

A estrutura Vec3 possui as seguintes propriedades:

-   `x`: componente X do vetor
-   `y`: componente Y do vetor
-   `z`: componente Z do vetor

### Construtores

-   `Vec3()`: cria um vetor com valores (0, 0, 0)
-   `Vec3(x, y, z)`: cria um vetor com os valores informados para as componentes X, Y e Z

## Vec4

A estrutura Vec4 possui as seguintes propriedades:

-   `x`: componente X do vetor
-   `y`: componente Y do vetor
-   `z`: componente Z do vetor
-   `w`: componente W do vetor

### Construtores

-   `Vec4()`: cria um vetor com valores (0, 0, 0, 0)
-   `Vec4(x, y, z, w)`: cria um vetor com os valores informados para as componentes X, Y, Z e W

É possível fazer operações matemáticas com as estruturas Vec2, Vec3 e Vec4, como soma, subtração, multiplicação e divisão. Além disso, essas estruturas podem ser usadas como argumentos em diversas funções da plataforma.




*inicialmente iremos começar pelos parametrons iniciais da função de update*

# Funções ``UI``

## Função: ``Begin()``

Descrição: A função Begin() é utilizada para iniciar uma janela com um título especificado pelo parâmetro 'title'. Além disso, é possível definir se a janela inicialmente deve estar aberta ou fechada através do parâmetro 'open', sendo 'true' para aberta e 'false' para fechada. É importante lembrar que, ao finalizar a janela, deve-se chamar a função End() para finalizar a janela corretamente.

### Parâmetros:

Descrição: A função Begin() é utilizada para iniciar uma janela com um título especificado pelo parâmetro 'title'. Além disso, é possível definir se a janela inicialmente deve estar aberta ou fechada através do parâmetro 'open', sendo 'true' para aberta e 'false' para fechada. É importante lembrar que, ao finalizar a janela, deve-se chamar a função End() para finalizar a janela corretamente.

-   title: um ponteiro para uma string que representa o título da janela.
-   open: um valor booleano que indica se a janela deve ser aberta ou fechada.

### Retorno:

-   Um valor booleano que indica se a janela foi iniciada com sucesso.

Exemplo de uso:

```lua
 if(menu) then
	 menu = ui:Begin("Minha janela", menu);
	 
	 ui:end()
 end
```
Nesse exemplo, uma janela com o título "Minha Janela" será criada e inicialmente aberta. O código para desenhar a janela deve ser escrito dentro do bloco condicional, e a função End() deve ser chamada ao final para finalizar a janela.

## Função: `BeginChild()`

Descrição: A função `BeginChild()` inicia um novo espaço de desenho em uma janela ou dentro de outro espaço de desenho. Esse espaço é delimitado por uma borda opcional e possui um tamanho especificado por um vetor de duas dimensões.

### Argumentos:

-   `name`: um ponteiro para um caractere que representa o nome do espaço de desenho. Deve ser único dentro do pai imediato.
-   `size`: um vetor de duas dimensões que define a largura e a altura do espaço de desenho.
-   `border`: um valor booleano que define se o espaço de desenho terá uma borda ou não.

### Retorno: A função retorna um valor booleano indicando se o espaço de desenho foi criado com sucesso.

Observações: A função `BeginChild()` deve ser seguida pela função `EndChild()` para finalizar o espaço de desenho. Qualquer conteúdo desenhado após `BeginChild()` e antes de `EndChild()` será limitado ao espaço de desenho criado.

Exemplo de uso:
```lua
 if(menu) then
	 menu = ui:Begin("Minha janela", menu);
	 if (ui:BeginChild("My Child", Vec2(15, 100), true)) then
		 ui:Text("This is my child window"); 
		 ui::EndChild();
     end
	 ui:end()
 end
```
## Função: `Button()`

A função `Button` é responsável por renderizar um botão interativo dentro de uma janela ou de um elemento de interface.

### Argumentos:
-   `name`: É uma string que representa o texto que será exibido dentro do botão.

### Retorno:

-   Retorna `true` se o botão foi pressionado, caso contrário, retorna `false`

```lua
 if(menu) then
	 menu = ui:Begin("Minha janela", menu);
	 if (ui:BeginChild("My Child", Vec2(15, 100), true)) then
		 ui:Text("This is my child window"); 
		 ui::EndChild();
     end
     if(ui:Button("Click"))then
	     ui:Text("Good work!");
     end
	 ui:end()
 end
```

## Função ``CheckBox()``

A função `CheckBox` é usada para criar um componente de caixa de seleção com um rótulo (título) e um estado booleano. O estado é representado por uma caixa de seleção que pode ser marcada ou desmarcada pelo usuário.

### Parâmetros

-   `title`: uma string constante representando o rótulo (título) que aparece ao lado da caixa de seleção.
-   `enable`: um valor booleano que representa o estado atual da caixa de seleção. Se for `true`, a caixa de seleção estará marcada. Se for `false`, a caixa de seleção estará desmarcada.

### Retorno

-   `true`: se a caixa de seleção estiver marcada.
-   `false`: se a caixa de seleção estiver desmarcada.

```lua
	enable = ui:CheckBox("Habilitar", enable);
	if(enable)then
		-- algo que você precise por aqui caso esteja habilitado
	end;
```

## função ``Text( )``

A função ``Text`` mostra um texto na tela dentro da janela.

### Argumentos:
-   text: um ponteiro para uma cadeia de caracteres contendo o texto a ser mostrado.

### Retorno: A função não retorna nenhum valor.

Exemplo:
```lua
  ui:Text("Olá mundo");
```

## Função ``SliderInt()``

A função SliderInt cria uma barra arrastável com um número inteiro.

### Argumentos:

-   ``label:`` um ponteiro para uma cadeia de caracteres contendo o rótulo do controle.
-   ``val:`` um inteiro contendo o valor atual do controle. Este valor será modificado pelo usuário.
-   ``min:`` um inteiro contendo o valor mínimo permitido para o controle.
-   ``max:`` um inteiro contendo o valor máximo permitido para o controle.

### Retorno: 
A função retorna o valor selecionado pelo usuário.

Exemplo
```lua
 valor = ui::SliderInt("Valor:", valor, 0, 100);
```

## Função ``Separator( )``

A função Separator desenha uma linha horizontal para separar os elementos.

### Argumentos: 
A função não recebe nenhum argumento.

### Retorno: 
A função não retorna nenhum valor.

Exemplo:
```lua
	
	ui:Text("Elemento 1");
	ui:Separator();
	ui:Text("Elemento 2");

```

## Função ``NewLine( )``

A função NewLine cria um espaço vertical entre os elementos.

### Argumentos: 
A função não recebe nenhum argumento.

### Retorno: 
A função não retorna nenhum valor.

Exemplo:
```lua
ui:Text("Elemento 1");
ui:NewLine();
ui:Text("Elemento 2");
```

## Função ``ListBox()``

A função ListBox cria uma lista de itens selecionáveis.

### Argumentos:

-   label: um ponteiro para uma cadeia de caracteres contendo o rótulo do controle.
-   list: uma referência ao objeto de lista que contém os itens a serem exibidos na lista.
-   index: um índice inteiro contendo o índice do item selecionado na lista.

### Retorno: 
A função retorna o índice do item selecionado pelo usuário.

Exemplo:
```lua
	local lista = {};
	table.insert(lista,"Obj1");
	table.insert(lista,"Obj2");
	table.insert(lista,"Obj3");
	table.insert(lista,"Obj4");
	index = ui:ListBox("Lista de itens", lista, index);
```

## Função ``ComboBox()`` 

A função ComboBox cria um menu suspenso com itens selecionáveis.

### Argumentos:

-   label: um ponteiro para uma cadeia de caracteres contendo o rótulo do controle.
-   list: uma referência ao objeto de lista que contém os itens a serem exibidos no menu.
-   index: um índice inteiro contendo o índice do item selecionado no menu.

### Retorno: 
A função retorna o índice do item selecionado pelo usuário.

Exemplo:
```lua
	local lista = {};
	table.insert(lista,"Obj1");
	table.insert(lista,"Obj2");
	table.insert(lista,"Obj3");
	table.insert(lista,"Obj4");
	index = ui:ComboBox("Lista de itens", lista, index);
```
