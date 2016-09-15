  class DFA
    attr_accessor :start, :end, :transition
   
    def initialize(options = {})
      @start = options[:start]
      @end = options[:end]
      @transition = options[:transition]
    end



    def run(input)  
      token ="";
      current_state = @start
      for i in input
        current_state = @transition[current_state][i]
        if (i==1)
          token = ";"
        end
        if (i==2)
          token = "num"
        end
        if (i==3)
          token = "letra"
        end
        if (i==4)
          token = "="
        end
        if (i==5)
          token = "espacio"
        end
        puts "El estado en el que estoy #{current_state} y soy el token : #{token}"
      end
      return true if @end.include? current_state
      return false
    end


  end
 

  if $PROGRAM_NAME == __FILE__
    d = DFA.new(:start => :q0, :end => [:q5],
                :transition =>
                { :q0 => {4 => :q1, 3 => :q2, 2 => :q3, 1 => :q4, 5 => :q0},
                  :q1 => {5 => :q5},
                  :q2 => {2 => :q2, 3 => :q2, 5 => :q5},
                  :q3 => {2 => :q3, 5 => :q5},
                  :q4 => {5 => :q5},
                  :q5 => {1 => :q0, 2 => :q0, 3 => :q0, 4 => :q0, 5 => :q0}
                })

         
            def validation(string)
              
           val =  string.split(//);
           cadena = [];
           cont = 0;
           for i in val
            if (i[0].ord==59)
              cadena[cont]=1;
             
            end
            if ((i[0].ord>=48) && (i[0].ord<=57) )
              cadena[cont]=2;
                          end
            if ((i[0].ord>=97)&&(i[0].ord<=122))
              
             cadena[cont]=3;
            end
            if (i[0].ord==61)
              cadena[cont]=4;

            end
            if (i[0].ord == 32)
              cadena[cont]=5;
            end
            cont = cont+1
           end
            
           return cadena
        end

     puts d.run(validation("; "))

    


    
  end


