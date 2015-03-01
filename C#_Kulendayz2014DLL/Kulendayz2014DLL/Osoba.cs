using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kulendayz2014DLL
{
    class Osoba
    {

        public string ime { get; set; }
        public string prezime { get; set; }
        public string slika { get; set; }
        public int sifra { get; set; }
        public DateTime datumRodenja { get; set; }
        public Skola skola { get; set; }
        public List<Interes> interesi { get; set; }

    }
}
