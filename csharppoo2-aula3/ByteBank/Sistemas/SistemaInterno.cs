using ByteBank.Funcionarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ByteBank.Sistemas
{
    public class SistemaInterno
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="diretor"> Usuario que entra no sistema</param>
        /// <param name="senha">Senha do usuario</param>
        /// <returns></returns>
        public bool Logar(Diretor diretor, string senha)
        {
            bool usuarioAutenticador = diretor.Autenticar(senha);

            if (usuarioAutenticador)
            {

                Console.WriteLine("Bem-Vindo ao Sistema");
                return true;

            }
            else
            {

                Console.WriteLine("Senha esta incorreta");
                return false;
            }

        }

        public bool Logar2(GerenteDeConta gerente, string senha)
        {
            bool usuarioAutenticador = gerente.Autenticar(senha);

            if (usuarioAutenticador)
            {

                Console.WriteLine("Bem-Vindo ao Sistema");
                return true;

            }
            else
            {

                Console.WriteLine("Senha esta incorreta");
                return false;
            }

        }




    }
}
