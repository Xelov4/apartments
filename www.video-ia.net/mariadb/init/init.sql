-- Création de la base de données
CREATE DATABASE IF NOT EXISTS video_ia_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE video_ia_db;

-- Table des catégories
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    parent_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_category_parent FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE SET NULL,
    INDEX idx_category_parent (parent_id),
    INDEX idx_category_slug (slug)
);

-- Table des outils
CREATE TABLE tools (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    website VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    short_desc VARCHAR(255) NOT NULL,
    logo_url VARCHAR(255),
    category_id INT NOT NULL,
    pricing_type VARCHAR(50) NOT NULL,
    pricing_details TEXT,
    features JSON,
    is_featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_tool_category FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE RESTRICT,
    INDEX idx_tool_category (category_id),
    INDEX idx_tool_featured (is_featured),
    INDEX idx_tool_slug (slug)
);

-- Table des tags
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    slug VARCHAR(50) NOT NULL UNIQUE,
    INDEX idx_tag_slug (slug)
);

-- Table de relation outils-tags (Many-to-Many)
CREATE TABLE tools_tags (
    tool_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (tool_id, tag_id),
    CONSTRAINT fk_tooltag_tool FOREIGN KEY (tool_id) REFERENCES tools(id) ON DELETE CASCADE,
    CONSTRAINT fk_tooltag_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE,
    INDEX idx_tooltag_tool (tool_id),
    INDEX idx_tooltag_tag (tag_id)
);

-- Table des avis
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tool_id INT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    rating TINYINT NOT NULL,
    comment TEXT NOT NULL,
    is_approved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_tool FOREIGN KEY (tool_id) REFERENCES tools(id) ON DELETE CASCADE,
    INDEX idx_review_tool (tool_id),
    INDEX idx_review_approved (is_approved),
    CHECK (rating BETWEEN 1 AND 5)
);

-- Table des soumissions d'outils
CREATE TABLE submissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    website VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    short_desc VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    pricing_type VARCHAR(50) NOT NULL,
    pricing_details TEXT,
    features JSON,
    submitter_name VARCHAR(100) NOT NULL,
    submitter_email VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_submission_category FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE RESTRICT,
    INDEX idx_submission_status (status),
    INDEX idx_submission_category (category_id)
);

-- Table des utilisateurs (Admin)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(20) DEFAULT 'admin',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_email (email),
    INDEX idx_user_role (role)
);

-- Table des contacts
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_contact_read (is_read)
);

-- Table des statistiques de visite
CREATE TABLE analytics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    page_path VARCHAR(255) NOT NULL,
    visitor_ip VARCHAR(45),
    user_agent TEXT,
    referer VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_analytics_path (page_path),
    INDEX idx_analytics_date (created_at)
);

-- Insertion des catégories de base
INSERT INTO categories (name, slug, description) VALUES
('Génération de Vidéo', 'generation-video', 'Outils IA pour générer des vidéos à partir de texte, images ou autres médias'),
('Édition Automatisée', 'edition-automatisee', 'Solutions d''édition vidéo automatisée par intelligence artificielle'),
('Reconnaissance d''Objets', 'reconnaissance-objets', 'Outils d''identification et suivi d''objets dans les vidéos'),
('Sous-titrage Automatique', 'sous-titrage-automatique', 'Solutions de transcription et sous-titrage propulsées par IA'),
('Synthèse Vocale', 'synthese-vocale', 'Outils de génération de voix off et doublage par IA'),
('Amélioration de Vidéo', 'amelioration-video', 'Solutions pour upscaling, débruitage et amélioration de la qualité vidéo');

-- Insertion des sous-catégories
INSERT INTO categories (name, slug, description, parent_id) VALUES
('Création à partir de Texte', 'creation-texte', 'Génération de vidéo à partir de descriptions textuelles', 1),
('Animation de Photos', 'animation-photos', 'Animation de photos et images fixes', 1),
('Assemblage Automatique', 'assemblage-automatique', 'Création automatique de montages à partir de rushes', 2),
('Style Transfer', 'style-transfer', 'Application de styles artistiques aux vidéos', 2),
('Détection de Personnes', 'detection-personnes', 'Reconnaissance et suivi de personnes dans les vidéos', 3),
('Analyse d''Action', 'analyse-action', 'Identification d''actions et mouvements dans les vidéos', 3),
('Transcription Multilingue', 'transcription-multilingue', 'Génération de sous-titres en plusieurs langues', 4),
('Voix Réalistes', 'voix-realistes', 'Génération de voix off à rendu naturel', 5),
('Clonage Vocal', 'clonage-vocal', 'Reproduction de voix existantes', 5),
('Super Résolution', 'super-resolution', 'Augmentation de la résolution par IA', 6),
('Stabilisation', 'stabilisation', 'Stabilisation vidéo avancée', 6);

-- Insertion des tags courants
INSERT INTO tags (name, slug) VALUES
('Gratuit', 'gratuit'),
('Freemium', 'freemium'),
('Payant', 'payant'),
('SaaS', 'saas'),
('Open Source', 'open-source'),
('API Disponible', 'api-disponible'),
('Temps Réel', 'temps-reel'),
('Haute Qualité', 'haute-qualite'),
('Débutant', 'debutant'),
('Professionnel', 'professionnel'),
('Web-Based', 'web-based'),
('Desktop', 'desktop'),
('Mobile', 'mobile'),
('Nouveau', 'nouveau'),
('Plugin', 'plugin');

-- Création d'un utilisateur administrateur par défaut
INSERT INTO users (email, password, name, role) VALUES
('admin@video-ia.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrateur', 'admin'); 