/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  images: {
    domains: ['video-ia.com', 'www.video-ia.com'],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**.video-ia.com',
      },
    ],
  },
  output: 'standalone',
}

module.exports = nextConfig 