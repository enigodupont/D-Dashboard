module UtilityHelper
    def create_roller(value, mod)
        html = "<tr>"
        html += "  <td> <input value='1'/> </td>"
        html += "  <td> d </td>"
        html += "  <td> " + value.to_s + " </td>"
        html += "  <td> <input type='number' value='0' name='quantity' min='" + (-mod).to_s + "' max='" + mod.to_s + "'> </td>"
        html += "  <td> <input type='checkbox'> </td>"
        html += "  <td> 0 </td>"
        html += "  <td> <input type='button' onclick='runDice(this);' value='Run Dice'/> </td>"
    end


    def check_login
        if session.nil? or session[:user].nil? or session[:user]['username'].nil?
            redirect_to '/users/login'
            return false
        else 
            return true
        end
    end
end
