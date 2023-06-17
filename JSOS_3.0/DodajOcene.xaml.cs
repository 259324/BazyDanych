using System;
using System.Collections.Generic;
using System.Linq;
using System.Management.Instrumentation;
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
    /// Interaction logic for  new_event.xaml
    /// </summary>
    public partial class DodajOcene : Window
    {
        public DodajOcene()
        {
            InitializeComponent();
        }
        /// <summary>
        /// Function adds new event to database and gives opportunity to fill up informations and date about it 
        /// </summary>
        private void Dodaj(object sender, RoutedEventArgs e)
        {
            
            bool err = false;
            stopien_err.Content = "";
            opis_err.Content = "";

            if (!poprawnyStopien())
            {
                stopien_err.Content = "Niepoprawny stopien!";
                err = true;
            }
            if (opis_TB.Text == "")
            {
                opis_err.Content = "Wprowadź opis!";
                err = true;
            }
            if (!err)
            {
                this.Close();
            }



        }

        private bool poprawnyStopien()
        {
            switch (stopien_TB.Text)
            {
                case "2":
                case "3":
                case "4":
                case "5":
                case "2.0":
                case "2.5":
                case "3.0":
                case "3.5":
                case "4.0":
                case "4.5":
                case "5.0":
                case "5.5":
                    return true;
                default:
                    return false;
            }
        }
    }
}

