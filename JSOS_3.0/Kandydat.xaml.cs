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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace JSOS_3._0
{
    /// <summary>
    /// Interaction logic for Kandydat.xaml
    /// </summary>
    public partial class Kandydat : Page
    {
        private readonly IMainWindow _mainWindow;
        public string[] listaDanych = { "Imię", "Nazwisko" };


        public Kandydat(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;

            for (int i = 0; i < listaDanych.Length; i++) { 
                TextBox komorka = new TextBox();
                komorka.Text = listaDanych[i];
                komorka.Width = 500;
                komorka.HorizontalAlignment = HorizontalAlignment.Left;

                Frame f = new Frame { Content = komorka };
                panelDanych.Children.Add(f);

            }

        }
    }
}
