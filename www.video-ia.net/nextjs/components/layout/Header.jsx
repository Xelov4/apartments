"use client"

import Link from 'next/link'
import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { MoonIcon, SunIcon, Menu, X } from 'lucide-react'
import { useTheme } from 'next-themes'

export function Header() {
  const { setTheme, theme } = useTheme()
  const [isMenuOpen, setIsMenuOpen] = useState(false)

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen)
  }

  return (
    <header className="sticky top-0 z-40 w-full border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
      <div className="container flex h-16 items-center justify-between py-4">
        <div className="flex gap-6 md:gap-10">
          <Link href="/" className="flex items-center space-x-2">
            <span className="inline-block font-bold text-xl">Video-IA</span>
          </Link>
          <nav className="hidden md:flex gap-6">
            <Link 
              href="/tools" 
              className="flex items-center text-lg font-medium transition-colors hover:text-primary"
            >
              Outils
            </Link>
            <Link 
              href="/categories" 
              className="flex items-center text-lg font-medium transition-colors hover:text-primary"
            >
              Catégories
            </Link>
            <Link 
              href="/contact" 
              className="flex items-center text-lg font-medium transition-colors hover:text-primary"
            >
              Contact
            </Link>
          </nav>
        </div>
        
        <div className="flex items-center gap-2">
          <Button
            variant="ghost"
            size="icon"
            aria-label="Toggle theme"
            className="mr-2"
            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
          >
            <SunIcon className="h-5 w-5 rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
            <MoonIcon className="absolute h-5 w-5 rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
            <span className="sr-only">Toggle theme</span>
          </Button>
          
          <Button asChild className="hidden md:flex">
            <Link href="/submit">Proposer un outil</Link>
          </Button>
          
          <Button 
            variant="ghost" 
            size="icon" 
            className="md:hidden" 
            onClick={toggleMenu}
          >
            {isMenuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
          </Button>
        </div>
      </div>
      
      {/* Menu mobile */}
      {isMenuOpen && (
        <div className="container pb-4 pt-2 md:hidden">
          <nav className="flex flex-col gap-4">
            <Link 
              href="/tools" 
              className="flex items-center text-lg font-medium transition-colors hover:text-primary"
              onClick={() => setIsMenuOpen(false)}
            >
              Outils
            </Link>
            <Link 
              href="/categories" 
              className="flex items-center text-lg font-medium transition-colors hover:text-primary"
              onClick={() => setIsMenuOpen(false)}
            >
              Catégories
            </Link>
            <Link 
              href="/contact" 
              className="flex items-center text-lg font-medium transition-colors hover:text-primary"
              onClick={() => setIsMenuOpen(false)}
            >
              Contact
            </Link>
            <Button asChild>
              <Link 
                href="/submit" 
                onClick={() => setIsMenuOpen(false)}
              >
                Proposer un outil
              </Link>
            </Button>
          </nav>
        </div>
      )}
    </header>
  );
} 