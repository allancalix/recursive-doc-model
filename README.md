# recursive-doc-model

Explores using a relational model to express a recursive document model where
one document (origin) can reference another (destination). Destination documents
can also contain references.

The first question explored here is how can we collect a specific attriibute,
in this case _ingredients_, for all documents referenced by the origin document
(either directly or indirectly).

## Try it yourself
Depends on:
  1. psql
  1. docker compose (built in to newer Docker cli versions)

### Commands
```bash
  # Start
  make
  # Stop
  make clean

  # Example query
  psql "postgres://admin:test123@localhost:5432" -f sql/query.sql
```
