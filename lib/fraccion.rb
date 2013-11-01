require "./lib/gcd.rb"


class Fraccion 
  
    attr_reader :num, :denom
    
    # Incluimos el módulo Comparable
    include Comparable
  
    def initialize(n,d) 
      @num, @denom = n, d
    end
	

    def num()
      return @num
    end

    def denom()
      return @denom
    end
  
	# Funcion para simplificar y mostrar la fraccion en formato reducido
    def simplificar
      aux = gcd(self.num, self.denom)                        
      Fraccion.new(self.num/aux, self.denom/aux)			 
    end 
    
    #Mostramos los atributos en un string
    def to_s
      "#{@num}/#{@denom}"
    end
   
	#Mostramos los atributos en float
    def to_f
      @num/@denom.to_f
    end
   
    
   
    def ==(other)
		other.simplificar
		self.simplificar
		if ((@num == other.num) and (@denom == other.denom))
			true		
		else
			false		
		end  
    end
  
	
	def absoluto
		@num = @num.abs
		@denom = @denom.abs
		Fraccion.new(@num,@denom)
	end
  
	
	def reciprocal
		Fraccion.new(@denom,@num)
	end
  
	
	def opuesto
		Fraccion.new(-@num,@denom)
	end
  
	def mcm(n, m)
		aux=gcd(n,m)
		(n/aux)*m 
	end
	

	def /(other)
		temp = Fraccion.new(@num*other.denom, @denom*other.num)
		temp.simplificar
	end
	
	def +(other)                                                                     		          
		aux = mcm(@denom, other.denom)                                                    
		temp = Fraccion.new(((aux/@denom)*@num)+((aux/other.denom)*other.num),aux)               
		temp.simplificar
	end
    
   
	def -(other)
		aux = mcm(@denom, other.denom)
		temp = Fraccion.new(((aux/@denom)*@num)-((aux/other.denom)*other.num),aux)
		temp.simplificar                                 
	end
   
	
	def *(other)
		temp=Fraccion.new(@num*other.num, @denom*other.denom) 
		temp.simplificar                                                
	end
	
	
	
	
  
	def %(other)																	
		aux1 = self.num * other.denom				
		aux2 = self.denom * other.num				
		resto = aux1%aux2								
	end
	
	#Inluimos el operador <=>
	def <=>(other)
		self.to_f <=> other.to_f
	end
	

end
