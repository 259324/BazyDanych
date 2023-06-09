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
        public string[] listaDanych = { "Imię", "Nazwisko" , "Login" , "Hasło" , "Nr. telefonu" , "E-mail" , "PESEL" , "Matura %" , "Kierunek"};


        public Kandydat(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;


            for (int i = 0; i < listaDanych.Length; i++) {

                Grid komorka = new Grid();

                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.ColumnDefinitions.Add(new ColumnDefinition());

                komorka.ColumnDefinitions[0].Width = new GridLength(150);


                TextBox poleDanych = new TextBox();
                poleDanych.Text = listaDanych[i];
                poleDanych.Width = 500;
                poleDanych.HorizontalAlignment = HorizontalAlignment.Left;
                poleDanych.Margin = new Thickness(10);
                poleDanych.FontSize = 15;


                Label jakieDane = new Label();
                jakieDane.Content = listaDanych[i];
                jakieDane.FontSize = 15;
                jakieDane.Margin = new Thickness(10);
                jakieDane.HorizontalAlignment = HorizontalAlignment.Left;



                Grid.SetColumn(jakieDane, 0);
                komorka.Children.Add(jakieDane);

                Grid.SetColumn(poleDanych, 1);
                komorka.Children.Add(poleDanych);


                panelDanych.Children.Add(komorka);

            }

        }
        public void Powrot(object sender, EventArgs e)
        {
            _mainWindow.kandydatWybor();
        }
    }
}
