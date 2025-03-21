import Link from 'next/link';
import { Button } from '@/components/ui/button';

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-4 md:p-24">
      <div className="w-full max-w-5xl">
        <div className="text-center mb-12">
          <h1 className="text-4xl md:text-6xl font-bold mb-4">
            Bienvenue sur Video-IA
          </h1>
          <p className="text-lg md:text-xl text-muted-foreground mb-8">
            L'annuaire complet des outils d'intelligence artificielle pour la vidéo
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button asChild size="lg">
              <Link href="/tools">
                Explorer les outils
              </Link>
            </Button>
            <Button variant="outline" size="lg" asChild>
              <Link href="/categories">
                Parcourir par catégorie
              </Link>
            </Button>
          </div>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
          <div className="p-6 border rounded-lg shadow-sm">
            <h2 className="text-xl font-semibold mb-3">Trouvez le bon outil</h2>
            <p className="text-muted-foreground">
              Accédez à une base de données complète d'outils IA pour la vidéo, avec descriptions détaillées et avis utilisateurs.
            </p>
          </div>
          <div className="p-6 border rounded-lg shadow-sm">
            <h2 className="text-xl font-semibold mb-3">Comparez les solutions</h2>
            <p className="text-muted-foreground">
              Évaluez les différentes options selon vos besoins spécifiques et votre budget.
            </p>
          </div>
          <div className="p-6 border rounded-lg shadow-sm">
            <h2 className="text-xl font-semibold mb-3">Restez informé</h2>
            <p className="text-muted-foreground">
              Découvrez les dernières innovations en matière d'IA appliquée à la vidéo.
            </p>
          </div>
        </div>
        
        <div className="text-center">
          <h2 className="text-2xl font-bold mb-4">Vous connaissez un outil qui devrait être listé ?</h2>
          <Button asChild>
            <Link href="/submit">
              Proposer un nouvel outil
            </Link>
          </Button>
        </div>
      </div>
    </main>
  );
} 