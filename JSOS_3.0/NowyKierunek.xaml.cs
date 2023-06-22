using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace JSOS_3._0
{
    /// <summary>
    /// Interaction logic for NowyKierunek.xaml
    /// </summary>
    public partial class NowyKierunek : Window
    {
        public NowyKierunek()
        {
            InitializeComponent();
        }
        /// <summary>
        /// Function adds new event to database and gives opportunity to fill up informations and date about it 
        /// </summary>
        private void Dodaj(object sender, RoutedEventArgs e)
        {

            bool err = false;
            nazwa_err.Content = "";
            przed1_err.Content = "";

            if (nazwa_TB.Text=="")
            {
                nazwa_err.Content = "Niepoprawna nazwa!";
                err = true;
            }
            if (przed1_TB.Text == "")
            {
                przed1_err.Content = "Przynajmniej jeden przedmiot!";
                err = true;
            }
            if (!err)
            {
                //DOdaj
                this.Close();
            }
        }
    }
}

