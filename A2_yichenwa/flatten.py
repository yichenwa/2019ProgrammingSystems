def flatten(input):
    out=[]
    def re(l):
        for i in l:
            if type(i)==int:
                out.append(i)
            else :
                re(i)
    re(input)
    return out


inlist=[[[1],2],[[[[[3]]]]],[4,[5],[[6]]]]
outlist = [x for x in flatten(inlist)]
print(outlist)
