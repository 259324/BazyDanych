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
    public partial class StudentOceny: Page
    {
        private readonly IMainWindow _mainWindow;
        public Ocena[] listaOcen = { new Ocena(3.5,DateTime.Now,"druty","gmacki","praca na lekcji") };


        // Załaduj plik XAML ze stylami
        private ResourceDictionary resourceDict = new ResourceDictionary();



        public StudentOceny(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;

            resourceDict.Source = new Uri("Style.xaml", UriKind.RelativeOrAbsolute);

            Grid legenda = new Grid();

            legenda.ColumnDefinitions.Add(new ColumnDefinition());
            legenda.ColumnDefinitions.Add(new ColumnDefinition());
            legenda.ColumnDefinitions.Add(new ColumnDefinition());
            legenda.ColumnDefinitions.Add(new ColumnDefinition());
            legenda.Style = resourceDict["KomorkaL"] as Style;

            Label stopienL = new Label();
        //< Label Style = "{DynamicResource Tytul}" />

            stopienL.Style = resourceDict["OcenaL"] as Style;
            stopienL.Content = "Stopien";
            Grid.SetColumn(stopienL, 0);
            legenda.Children.Add(stopienL);

            Label dataL = new Label();
            dataL.Style = resourceDict["OcenaL"] as Style;
            dataL.Content = "Data";
            Grid.SetColumn(dataL, 1);
            legenda.Children.Add(dataL);

            Label przedmiotL = new Label();
            przedmiotL.Style = resourceDict["OcenaL"] as Style;
            przedmiotL.Content = "Przedmiot";
            Grid.SetColumn(przedmiotL, 2);
            legenda.Children.Add(przedmiotL);

            Label wystawilL = new Label();
            wystawilL.Style = resourceDict["OcenaL"] as Style;
            wystawilL.Content = "Wystawil";
            Grid.SetColumn(wystawilL, 3);
            legenda.Children.Add(wystawilL);


            panelOcen.Children.Add(legenda);


            for (int i = 0; i < listaOcen.Length; i++)
            {

                Grid komorka = new Grid();

                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.Style = resourceDict["Komorka"] as Style;

                Label stopien = new Label();
                stopien.Style = resourceDict["Ocena"] as Style;
                stopien.Content = listaOcen[i].stopien;
                Grid.SetColumn(stopien, 0);
                komorka.Children.Add(stopien);

                Label data = new Label();
                data.Style = resourceDict["Ocena"] as Style;
                data.Content = listaOcen[i].data;
                Grid.SetColumn(data, 1);
                komorka.Children.Add(data);

                Label przedmiot = new Label();
                przedmiot.Style = resourceDict["Ocena"] as Style;
                przedmiot.Content = listaOcen[i].przedmiot;
                Grid.SetColumn(przedmiot, 2);
                komorka.Children.Add(przedmiot);

                Label wystawil = new Label();
                wystawil.Style = resourceDict["Ocena"] as Style;
                wystawil.Content = listaOcen[i].wystawil;
                Grid.SetColumn(wystawil, 3);
                komorka.Children.Add(wystawil);


                panelOcen.Children.Add(komorka);

            }

        }
        public void Powrot(object sender, EventArgs e)
        {
            _mainWindow.student();
        }
    }

    public class Ocena
    {
        public double stopien;
        public DateTime data;
        public string przedmiot;
        public string wystawil;
        public string opis;

        public Ocena(double stopien_,DateTime data_,string przedmiot_,string wystawil_, string opis_)
        {
            stopien = stopien_;
            data = data_;
            przedmiot = przedmiot_; 
            wystawil = wystawil_;
            opis = opis_;
        }
    }
}
