using System.Windows.Controls;

namespace JSOS_3._0
{
    public interface IMainWindow
    {
        void home();
        void loadView(Frame f);
        void login(int rola);
        void signin();
        void kandydatWybor();
        void kandydat();
        void student();
        void studentDane();
        void studentOceny();
        void studentZajecia();
        void pracownik();

    }
}