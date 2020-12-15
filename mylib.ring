# Mohammad Hamdy Ghanem
# 2020

func bool(n)
 if Type(n) = "NUMBER"
   return n != 0
 elseIf isList(n)
   return len(n) > 0
 else
   return not isNull(n)
 end

func bool2Str(n)
  if bool(n)
    return "True"
  else
    return "False"
  end

func typeName(obj)
  if isNull(obj)
     return ""
  elseif isObject(obj)
     return ClassName(obj)
  else
     return lower(type(obj))
  end

Func isFunc(f)
  try
    return isFunction(f)
  catch
    return false
  end

   
func Select(condition, ifTrue, ifFalse)
	if isfunc(condition)
		cond = Call condition()
	else
		cond = condition
	end
  
	if cond
		if isfunc(ifTrue) 
			return Call ifTrue()
		else
			return ifTrue
		end
	elseif isfunc(ifFalse)  
		return Call ifFalse()
	else
		return ifFalse		
	end


func ListToStr(lst, sep, sep2)
	if isString(lst) 
      return lst
   elseif not isList(lst)
	   return String(lst)
   end

	L = len(Lst)
   SL = 0
	Lst2 =[]
   For i = 1 to L
		x = ListToStr(Lst[i], sep2, sep2)
		if x != ""
			Lst2 + x
			SL += len(x)
		end
	Next


   sep = "" + sep
	spL = len(sep)
   L = len(Lst2)
   s0 = space(SL + (L - 1) * spL)


   idx = 0   
	for i = 1 to L
		idx++
		s1 = Lst2[i]
		L2 = len(s1)
		if i = 1 
			s0[idx] = s1[1] 
		else
			for k = 1 to spL
				s0[idx] = sep[k] 
				idx++
			next
			s0[idx] = s1[1]
		end
		for j = 2 to L2 
			idx++
			s0[idx] = s1[j]
		next
	next
	return S0
