import { Inter } from 'next/font/google';
import './globals.css';
import { ThemeProvider } from '@/components/theme-provider';
import { Header } from '@/components/layout/Header';
import { Footer } from '@/components/layout/Footer';

const inter = Inter({ subsets: ['latin'] });

export const metadata = {
  title: 'Video-IA | Annuaire des outils IA pour la vidéo',
  description: 'Découvrez et comparez les meilleurs outils d\'intelligence artificielle pour la création, l\'édition et l\'amélioration de vidéos.',
  keywords: 'IA, intelligence artificielle, vidéo, outils IA, montage vidéo, génération vidéo, sous-titrage automatique',
};

export default function RootLayout({ children }) {
  return (
    <html lang="fr" suppressHydrationWarning>
      <body className={inter.className}>
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
          <div className="flex min-h-screen flex-col">
            <Header />
            <main className="flex-1">{children}</main>
            <Footer />
          </div>
        </ThemeProvider>
      </body>
    </html>
  );
} 