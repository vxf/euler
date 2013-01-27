CARD_VALUES = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
ROYAL_FLUSH = [CARD_VALUES.index(c) for c in ['T', 'J', 'Q', 'K', 'A']]

# handvalue
class HANDVALUE :
	HIGHCARD = 0
	ONEPAIR = len(CARD_VALUES)
	TWOPAIRS = len(CARD_VALUES) * 2
	THREEOFAKIND = len(CARD_VALUES) * 3
	STRAIGHT = len(CARD_VALUES) * 4
	FLUSH = len(CARD_VALUES) * 5
	FULLHOUSE = len(CARD_VALUES) * 6
	FOUROFAKIND = len(CARD_VALUES) * 7
	STRAIGHTFLUSH = len(CARD_VALUES) * 8
	ROYALFLUSH = len(CARD_VALUES) * 9

def handval(h):
	hs = [s for v, s in h]
	hv = sorted([CARD_VALUES.index(v) for v, s in h])

	highest = hv[-1]
	isflush = hs[:-1] == hs[1:] # afinal acabei por usar isto :]
	# isstraight = all([x + 1 == y for x, y in zip(hv, hv[1:])]) # e isto tb vem do reduce.py...
 	isstraight = hv[1:] == [i + 1 for i in hv[:-1]]

	if isflush :
		if isstraight :
			#return "STRAIGHT FLUSH" # pode empatar
			return (HANDVALUE.STRAIGHTFLUSH + highest,)
		elif hv == ROYAL_FLUSH :
			#return "ROYAL FLUSH" # pode empatar ????
			return (HANDVALUE.ROYALFLUSH + highest,)
		else :
			#return "FLUSH"  # pode empatar
			return (HANDVALUE.FLUSH + highest,)
	if isstraight :
		#return "STRAIGHT" # pode empatar
		return (HANDVALUE.STRAIGHT + highest,)

	kinds = {}
	for v in hv :
		kinds[v] = kinds.get(v, 0) + 1

	# in http://www.python.org/dev/peps/pep-0265/
	kinds = [(v, k) for k, v in kinds.items()]
	kinds = sorted(kinds, reverse=True)

	if kinds[0][0] == 4 :
		#return "FOUR OF A KIND"
		return (HANDVALUE.FOUROFAKIND + kinds[0][1],)
	elif kinds[0][0] == 3 :
		if kinds[1][0] == 2 :
			#return "FULL HOUSE"
			return (HANDVALUE.FULLHOUSE + kinds[0][1],)
		else :
			#return "THREE OF A KIND"
			return (HANDVALUE.THREEOFAKIND + kinds[0][1],)
	elif kinds[0][0] == 2 :	
		if kinds[1][0] == 2 :
			#return "TWO PAIRS" # pode empatar
			return (HANDVALUE.TWOPAIRS + kinds[0][1], kinds[1][1], kinds[2][1])
		else :
			#return "ONE PAIR" # pode empatar
			return (HANDVALUE.ONEPAIR + kinds[0][1], kinds[1][1])

	return (highest, highest)


awins = 0

for l in open('poker.txt'):
	l = l.strip().split()
	a, b = l[:5], l[5:]
	va, vb = handval(a), handval(b)

	if va > vb :
		awins = awins + 1

print(awins)

