# estava aqui a tentar arranjar uma forma fixe de saber se
# uma lista tinha todos os elementos iguais acabei por nao usar
# isto porque as minhas listas tinham 5 elementos mas achei isto
# curioso demais para nao partilhar no entanto nao deve ser nada
# que o pessoal dos lisps nao esteja acostumado a ver

# o primeiro metodo usa uma funcao mto fixe reduce descontinuada no python3
# reduce aplica uma funcao (neste caso anonima) sobre todos os elementos e retorna um valor
# o problema e que numa funcao em reduce o x e' o valor da ultima avaliacao de lambda
# mas para comparar todos precisamos da ultima valiacao mais dois elementos do conjunto
# entao usei tuplos e assim uma avaliacao pode retornar o ultimo elemento e o resultado da avaliacao
def compareall1(l):
	last, allequal = reduce(
		lambda x, y:
			(y[0], x[1] and x[0] == y[0]), # (current_elem, last_eval && last_elem == curr_elem)
		[(a, True) for a in l]) # o senao deste metodo, temos gerar tuplos com True antes do reduce
	return allequal

# outro metodo que me lembrei, correr um sort e comparar o ultimo com o primeiro elemento :]
# simples mas o sort pode ser mesmo muito pesado
def compareall2(l):
	l = sorted(l)
	return l[0] == l[-1]

# depois lembrei-me de como evitar a list compreension usando a inicializacao do reduce
# o resultado continua a ser um tuplo mas e usada a lista original
# ainda assim nao temos forma de parar ao primeiro false...
def compareall3(l):
	allequal, last = reduce(
		lambda x, y:
			(x[0] and x[1] == y, y),
		l,
		(True, l[0]))
	return allequal

# aha! generators! agora para ao primeiro false
# zip(l, l[1:]) vai-me dar tuplos com um elemento e o outro a seguir
# zip tb trata das diferencas de tamanho das listas
# a partir daqui partimos do principio:
# se a == b e b == c ... a == c
def aux_compareall4(l):
	for x, y in zip(l, l[1:]):
		yield x == y

def compareall4(l):
	return all(aux_compareall4(l))

# e porque algodao quando se pode ter... list compreensions
def compareall5(l):
	return all([x == y for x, y in zip(l, l[1:])])

# apos ler sobre o cmp() ocorreu-me que
# a comparacao de listas e exactamente isto
# l[:-x] e' o mesmo que l[:len(l)-x]
def compareall6(l):
	return l[:-1] == l[1:] # TOMA LA MORANGOS!

#l[1:] == [i + 1 for i in l[:-1]]

# final words:
# ve esta observacao mto fixe do zip
# http://muffinresearch.co.uk/archives/2007/10/16/python-transposing-lists-with-map-and-zip/


# testes
print(compareall1([1,2,3231,232,321,312,321,321,1]))
print(compareall1([2,2,2,2,2,2,2,2,2]))

print(compareall2([1,2,3231,232,321,312,321,321,1]))
print(compareall2([2,2,2,2,2,2,2,2,2]))

print(compareall3([1,2,3231,232,321,312,321,321,1]))
print(compareall3([2,2,2,2,2,2,2,2,2]))

print(compareall4([1,2,3231,232,321,312,321,321,1]))
print(compareall4([2,2,2,2,2,2,2,2,2]))

print(compareall5([1,2,3231,232,321,312,321,321,1]))
print(compareall5([2,2,2,2,2,2,2,2,2]))

print(compareall6([1,2,3231,232,321,312,321,321,1]))
print(compareall6([2,2,2,2,2,2,2,2,2]))

