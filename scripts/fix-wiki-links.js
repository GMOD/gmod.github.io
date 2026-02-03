#!/usr/bin/env node

const fs = require('fs')
const path = require('path')

const wikiDir = path.join(__dirname, '..', 'content', 'wiki')

// Get all markdown files in wiki directory
function getMarkdownFiles(dir) {
  const files = []
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name)
    if (entry.isDirectory()) {
      files.push(...getMarkdownFiles(fullPath))
    } else if (entry.name.endsWith('.md')) {
      files.push(fullPath)
    }
  }
  return files
}

// Check if a link target is an external link or anchor
function isExternalOrAnchor(target) {
  return (
    target.startsWith('http://') ||
    target.startsWith('https://') ||
    target.startsWith('mailto:') ||
    target.startsWith('#') ||
    target.startsWith('/') ||
    target.startsWith('../')
  )
}

// Fix links in content
function fixLinks(content) {
  // First, remove code blocks temporarily to avoid modifying them
  const codeBlocks = []
  let processed = content.replace(/```[\s\S]*?```/g, (match) => {
    codeBlocks.push(match)
    return `__CODE_BLOCK_${codeBlocks.length - 1}__`
  })

  // Also protect inline code
  const inlineCode = []
  processed = processed.replace(/`[^`]+`/g, (match) => {
    inlineCode.push(match)
    return `__INLINE_CODE_${inlineCode.length - 1}__`
  })

  // Fix markdown links - handle links with parentheses in the target
  // Pattern: [text](target) or [text](target "title")
  // The target may contain parentheses like Page_(name)
  processed = processed.replace(
    /\[([\s\S]*?)\]\(([^)\s]+(?:\([^)]*\))?[^)\s]*)(?:\s+"[^"]*")?\)/g,
    (match, text, target) => {
      // Don't modify external links, anchors, or already-absolute paths
      if (isExternalOrAnchor(target)) {
        return `[${text}](${target})`
      }
      // Convert to absolute wiki path
      return `[${text}](/wiki/${target})`
    }
  )

  // Restore code blocks - use function to avoid $$ interpretation
  for (let i = 0; i < codeBlocks.length; i++) {
    processed = processed.replace(`__CODE_BLOCK_${i}__`, () => codeBlocks[i])
  }

  // Restore inline code - use function to avoid $$ interpretation
  for (let i = 0; i < inlineCode.length; i++) {
    processed = processed.replace(`__INLINE_CODE_${i}__`, () => inlineCode[i])
  }

  return processed
}

// Also fix HTML href attributes that point to wiki pages
function fixHtmlLinks(content) {
  // Fix <a href="PageName" ...> to <a href="/wiki/PageName" ...>
  // But not external links
  return content.replace(
    /<a\s+href="([^"]+)"/g,
    (match, href) => {
      if (isExternalOrAnchor(href)) {
        return match
      }
      return `<a href="/wiki/${href}"`
    }
  )
}

// Main
const files = getMarkdownFiles(wikiDir)
let totalFixed = 0

for (const file of files) {
  const original = fs.readFileSync(file, 'utf8')
  let fixed = fixLinks(original)
  fixed = fixHtmlLinks(fixed)

  if (fixed !== original) {
    fs.writeFileSync(file, fixed)
    const relPath = path.relative(wikiDir, file)
    console.log(`Fixed: ${relPath}`)
    totalFixed++
  }
}

console.log(`\nTotal files modified: ${totalFixed}`)
