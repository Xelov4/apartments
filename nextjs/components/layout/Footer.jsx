import Link from 'next/link'

export function Footer() {
  return (
    <footer className="border-t">
      <div className="container py-8 md:py-12">
        <div className="grid grid-cols-1 gap-8 md:grid-cols-4">
          <div>
            <h3 className="text-lg font-semibold mb-4">Video-IA</h3>
            <p className="text-sm text-muted-foreground">
              L'annuaire complet des outils d'intelligence artificielle pour la vidéo.
            </p>
          </div>
          <div>
            <h3 className="text-lg font-semibold mb-4">Navigation</h3>
            <ul className="space-y-2">
              <li>
                <Link 
                  href="/" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  Accueil
                </Link>
              </li>
              <li>
                <Link 
                  href="/tools" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  Outils
                </Link>
              </li>
              <li>
                <Link 
                  href="/categories" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  Catégories
                </Link>
              </li>
              <li>
                <Link 
                  href="/submit" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  Proposer un outil
                </Link>
              </li>
            </ul>
          </div>
          <div>
            <h3 className="text-lg font-semibold mb-4">Ressources</h3>
            <ul className="space-y-2">
              <li>
                <Link 
                  href="/about" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  À propos
                </Link>
              </li>
              <li>
                <Link 
                  href="/contact" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  Contact
                </Link>
              </li>
              <li>
                <Link 
                  href="/privacy" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  Politique de confidentialité
                </Link>
              </li>
              <li>
                <Link 
                  href="/terms" 
                  className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                >
                  Conditions d'utilisation
                </Link>
              </li>
            </ul>
          </div>
          <div>
            <h3 className="text-lg font-semibold mb-4">Suivez-nous</h3>
            <div className="flex space-x-4">
              <a 
                href="https://twitter.com/videoianet" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-muted-foreground hover:text-foreground transition-colors"
              >
                Twitter
              </a>
              <a 
                href="https://linkedin.com/company/video-ia" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-muted-foreground hover:text-foreground transition-colors"
              >
                LinkedIn
              </a>
            </div>
          </div>
        </div>
        <div className="mt-8 border-t pt-8 flex flex-col md:flex-row justify-between">
          <p className="text-xs text-muted-foreground">
            &copy; {new Date().getFullYear()} Video-IA. Tous droits réservés.
          </p>
          <p className="text-xs text-muted-foreground mt-2 md:mt-0">
            Conçu avec passion en France 🇫🇷
          </p>
        </div>
      </div>
    </footer>
  )
} 