#!/usr/bin/env node

/**
 * ArangoDB setup script
 * Initializes database, collections, and indexes
 */

const { Database } = require('arangojs');
require('dotenv').config();

const config = {
  url: process.env.ARANGO_URL || 'http://localhost:8529',
  database: process.env.ARANGO_DATABASE || 'accessibility',
  username: process.env.ARANGO_USERNAME || 'root',
  password: process.env.ARANGO_PASSWORD || 'development',
};

async function setup() {
  console.log('🔧 Setting up ArangoDB...\n');

  const db = new Database({
    url: config.url,
    auth: {
      username: config.username,
      password: config.password,
    },
  });

  try {
    // Create database
    console.log(`Creating database: ${config.database}`);
    const databases = await db.listDatabases();

    if (!databases.includes(config.database)) {
      await db.createDatabase(config.database);
      console.log(`✓ Database created: ${config.database}`);
    } else {
      console.log(`✓ Database already exists: ${config.database}`);
    }

    // Use the database
    db.useDatabase(config.database);

    // Create collections
    const collections = [
      'sites',
      'scans',
      'violations',
      'wcag_criteria',
      'organizations',
    ];

    for (const name of collections) {
      const exists = await db.collection(name).exists();
      if (!exists) {
        await db.createCollection(name);
        console.log(`✓ Collection created: ${name}`);
      } else {
        console.log(`✓ Collection exists: ${name}`);
      }
    }

    // Create edge collections
    const edgeCollections = [
      'site_scans',
      'scan_violations',
      'violation_criteria',
      'org_sites',
    ];

    for (const name of edgeCollections) {
      const exists = await db.collection(name).exists();
      if (!exists) {
        await db.createEdgeCollection(name);
        console.log(`✓ Edge collection created: ${name}`);
      } else {
        console.log(`✓ Edge collection exists: ${name}`);
      }
    }

    console.log('\n✅ ArangoDB setup complete!');
    process.exit(0);
  } catch (error) {
    console.error('\n❌ Setup failed:', error.message);
    process.exit(1);
  }
}

setup();
