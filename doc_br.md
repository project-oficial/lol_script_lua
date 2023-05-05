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



# Funções ``Draw``



## Função ``DrawCicle``

A função ``DrawCircle`` é responsável por desenhar um círculo na interface gráfica da plataforma. 
Ela recebe cinco parâmetros:

## Parâmetros:
-   "center": um objeto da classe "Vec2" que representa o centro do círculo a ser desenhado.
-   "radius": um valor float que representa o raio do círculo a ser desenhado.
-   "numPoints": um valor inteiro que representa o número de pontos a serem utilizados para desenhar o círculo. Quanto maior o valor, mais suave será a curvatura do círculo.
-   "thickness": um valor float que representa a espessura da linha utilizada para desenhar o círculo.
-   "color": um objeto da classe "Vec4" que representa a cor utilizada para desenhar o círculo. A cor é definida pelos valores RGBA (red, green, blue, alpha).

Essa função é útil para desenhar objetos circulares.
Exemplo:

```lua
-- Cria um vetor 2D com a posição do centro do círculo
local center = Vec2(100, 100)

-- Define o raio do círculo
local radius = 50

-- Define a quantidade de pontos do círculo
local numPoints = 30

-- Define a espessura da linha do círculo
local thickness = 2.0

-- Cria um vetor RGBA com a cor do círculo (vermelho)
local color = Vec4(1, 0, 0, 1)

-- Chama a função DrawCircle para desenhar o círculo
draw:DrawCircle(center, radius, numPoints, thickness, color)
```

## Função ``DrawCircleFilled``

A função `DrawCircleFilled` é bastante semelhante à `DrawCircle`, com a diferença de que o círculo é preenchido em vez de ser desenhado apenas com uma linha. Ela recebe os mesmos parâmetros que a função `DrawCircle`, com exceção do parâmetro `thickness`.

## Parâmetros:
-   "center": um objeto da classe "Vec2" que representa o centro do círculo a ser desenhado.
-   "radius": um valor float que representa o raio do círculo a ser desenhado.
-   "numPoints": um valor inteiro que representa o número de pontos a serem utilizados para desenhar o círculo. Quanto maior o valor, mais suave será a curvatura do círculo.
-   "color": um objeto da classe "Vec4" que representa a cor utilizada para preencher o círculo. A cor é definida pelos valores RGBA (red, green, blue, alpha).

Essa função é útil para desenhar objetos circulares preenchidos.
Exemplo:

```lua
-- Cria um vetor 2D com a posição do centro do círculo
local center = Vec2(100, 100)

-- Define o raio do círculo
local radius = 50

-- Define a quantidade de pontos do círculo
local numPoints = 30

-- Cria um vetor RGBA com a cor de preenchimento do círculo (azul)
local fillColor = Vec4(0, 0, 1, 1)

-- Chama a função DrawCircleFilled para desenhar o círculo preenchido
draw:DrawCircleFilled(center, radius, numPoints, fillColor)
```

## Função `DrawCircle3D()`

Desenha um círculo no plano na posição do objeto especificado. A cor do círculo pode ser definida por meio de um vetor RGBA. O texto pode ser adicionado como um parâmetro opcional.

## Parâmetros:
- `Obj`: O objeto que define a posição do círculo no plano.
- `color`: Um vetor RGBA que define a cor do círculo.
- `txt`: Um texto que pode ser adicionado ao círculo.

Exemplo de uso:
```lua
local GameOBJ = plataform:GetPlayer();
local color = Vec4(0.5, 0.5, 0.5, 1); -- cinza 
local txt = "Exemplo de texto" 

draw:DrawCircle3D(GameOBJ, color, txt);
```

## Função `DrawText`:

Desenha um texto na posição especificada `pos`, usando a cor especificada `color` e o texto a ser exibido `text`.

Parâmetros:

-   `pos` (Vec2): posição em que o texto será desenhado.
-   `text` (const char*): texto a ser exibido.
-   `color` (Vec4): cor do texto.

Exemplo de uso:
```lua
local text = "Olá, mundo!"  
local color = Vec4(1, 1, 1, 1);
draw:DrawTextA(Vec2(100,100), text, color);
```


## Função ``DrawButton``
 A função ``DrawButton`` desenha um botão na tela, na posição especificada por `p`, com o texto `text`, a cor de fundo `colorButton`, a cor do texto `colorText` e o arredondamento dos cantos do botão definido por `rounding`.

- `p`: um vetor de 2 dimensões (x, y) que representa a posição do botão na tela.
- `text`: uma string que representa o texto exibido dentro do botão.
- `colorButton`: um vetor de 4 dimensões (r, g, b, a) que representa a cor de fundo do botão. Os valores de `r`, `g`, `b` e `a` variam de 0 a 1, onde 0 significa que a cor está totalmente ausente e 1 significa que a cor está completamente presente.
- `colorText`: um vetor de 4 dimensões (r, g, b, a) que representa a cor do texto dentro do botão. Os valores de `r`, `g`, `b` e `a` variam de 0 a 1, onde 0 significa que a cor está totalmente ausente e 1 significa que a cor está completamente presente.
- `rounding`: um valor que representa o arredondamento dos cantos do botão. Quanto maior o valor, mais arredondados serão os cantos. Se o valor for 0, o botão terá cantos retos.

Exemplo de uso:
````lua
local pos = Vec2(100.0, 100.0);
local text = "Eu pareço um botão!";
local colorButton = Vec4(0.2, 0.4, 0.6, 1.0);
local colorText = Vec4(1.0, 1.0, 1.0, 1.0);
local rounding = 5;
draw:DrawButton(pos, text, colorButton, colorText, rounding)
````

A função ``DrawRect`` é responsável por desenhar um retângulo na interface gráfica da plataforma. 
Ela recebe quatro parâmetros:

## Parâmetros:
-   "box": um objeto da classe "Vec4" que representa as coordenadas do retângulo a ser desenhado. O objeto possui as seguintes informações: (x, y, largura, altura), onde (x, y) é a posição inicial do retângulo, e (largura, altura) são suas dimensões.
-   "color": um objeto da classe "Vec4" que representa a cor utilizada para preencher o retângulo. A cor é definida pelos valores RGBA (red, green, blue, alpha).
-   "rounding": um valor float que representa a quantidade de arredondamento das bordas do retângulo. Quanto maior o valor, mais arredondado será o retângulo.
-   "thickness": um valor float que representa a espessura da linha utilizada para desenhar as bordas do retângulo.

Essa função é útil para desenhar objetos retangulares.
Exemplo:
```lua
-- Cria um vetor 4D com as coordenadas do retângulo
local box = Vec4(100, 100, 200, 150)

-- Cria um vetor RGBA com a cor do retângulo (verde)
local color = Vec4(0, 1, 0, 1)

-- Define a quantidade de arredondamento das bordas do retângulo
local rounding = 10.0

-- Define a espessura da linha do retângulo
local thickness = 2.0

-- Chama a função DrawRect para desenhar o retângulo
draw:DrawRect(box, color, rounding, thickness)
```

## Função `DrawRectFilled()`
A função `DrawRectFilled` é responsável por desenhar um retângulo preenchido na interface gráfica da plataforma. Ela recebe três parâmetros:

## Parâmetros:
-   "box": um objeto da classe "Vec4" que representa o retângulo a ser desenhado. Os quatro valores do vetor representam respectivamente as coordenadas x e y do canto superior esquerdo do retângulo, seguidas das coordenadas x e y do canto inferior direito do retângulo.
-   "color": um objeto da classe "Vec4" que representa a cor utilizada para preencher o retângulo. A cor é definida pelos valores RGBA (red, green, blue, alpha).
-   "rounding": um valor float que representa o arredondamento dos cantos do retângulo.

Essa função é útil para desenhar objetos retangulares preenchidos.
Exemplo:
```lua
-- Cria um vetor 4D com as coordenadas do retângulo (canto superior esquerdo, canto inferior direito)
local box = Vec4(100, 100, 200, 200)

-- Cria um vetor RGBA com a cor do retângulo (vermelho)
local color = Vec4(1, 0, 0, 1)

-- Define o arredondamento dos cantos do retângulo
local rounding = 10

-- Chama a função DrawRectFilled para desenhar o retângulo preenchido
draw:DrawRectFilled(box, color, rounding)
```
