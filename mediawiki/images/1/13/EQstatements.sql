-- Required: 
--   Chado group module tables
--   GO ontology
--   PATO ontology
--   RO (OBOREL) ontology

-- Add phenotypeprop table
CREATE TABLE phenotypeprop (
   phenotypeprop_id SERIAL PRIMARY KEY,
   phenotype_id INT NOT NULL,
      FOREIGN KEY (phenotype_id) REFERENCES phenotype (phenotype_id) ON DELETE CASCADE INITIALLY DEFERRED,
   type_id INT NOT NULL,
      FOREIGN KEY (type_id) REFERENCES cvterm (cvterm_id) ON DELETE CASCADE INITIALLY DEFERRED,
   value TEXT NULL,
   rank INT NOT NULL DEFAULT 0,

   CONSTRAINT phenotypeprop_c1 UNIQUE (phenotypeprop_id,type_id,rank)
);

-- Modify phenotype_cvterm
ALTER TABLE phenotype_cvterm 
  ADD COLUMN type_id INT NOT NULL,
  ADD CONSTRAINT type_idfk FOREIGN KEY (type_id) REFERENCES cvterm (cvterm_id) ON DELETE CASCADE INITIALLY DEFERRED
;

-- Add phenotype_cvterm_grpmember
CREATE TABLE phenotype_cvterm_grpmember (
    phenotype_cvterm_grpmember_id serial PRIMARY KEY,
    grpmember_id integer NOT NULL REFERENCES grpmember
      ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
    phenotype_cvterm_id integer NOT NULL REFERENCES phenotype_cvterm
      ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
    linking_table information_schema.sql_identifier
      DEFAULT 'phenotype_cvterm' CHECK (linking_table = 'phenotype_cvterm'),
    FOREIGN KEY(grpmember_id, linking_table)
      REFERENCES grpmember(grpmember_id, linking_table),
    UNIQUE(grpmember_id)
);

-- CV terms describing the parts of an EQ statement
INSERT INTO cv
  (name, definition)
VALUES
  ('postcomposed_terms', 
   'Names for parts of post-composed terms'),
  ('phenotype_properties',
   'Properties attached to phenotypes')
;
INSERT INTO dbxref
  (db_id, accession)
VALUES
  ((SELECT db_id FROM db WHERE name='internal'), 'primary_entity1'),
  ((SELECT db_id FROM db WHERE name='internal'), 'primary_entity_relationship'),
  ((SELECT db_id FROM db WHERE name='internal'), 'primary_entity2'),
  ((SELECT db_id FROM db WHERE name='internal'), 'quality'),
  ((SELECT db_id FROM db WHERE name='internal'), 'qualifier'),
  ((SELECT db_id FROM db WHERE name='internal'), 'secondary_entity1'),
  ((SELECT db_id FROM db WHERE name='internal'), 'secondary_entity_relationship'),
  ((SELECT db_id FROM db WHERE name='internal'), 'secondary_entity2'),
  ((SELECT db_id FROM db WHERE name='internal'), 'development_stage'),
  ((SELECT db_id FROM db WHERE name='internal'), 'environment'),
  
  ((SELECT db_id FROM db WHERE name='internal'), 'phene_description'),
  ((SELECT db_id FROM db WHERE name='internal'), 'dominant_recessive_trait'),
  ((SELECT db_id FROM db WHERE name='internal'), 'loss_or_gain_of_function'),
  
  ((SELECT db_id FROM db WHERE name='internal'), 'eq_statement'),
  ((SELECT db_id FROM db WHERE name='internal'), 'primary_entity'),
  ((SELECT db_id FROM db WHERE name='internal'), 'quality_qualifier'),
  ((SELECT db_id FROM db WHERE name='internal'), 'secondary_entity'),
  ((SELECT db_id FROM db WHERE name='internal'), 'condition'),
  ((SELECT db_id FROM db WHERE name='internal'), 'condition_for')
;
INSERT INTO cvterm
  (cv_id, name, definition, dbxref_id)
VALUES
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'primary entity 1', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='primary_entity1')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'primary entity relationship', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='primary_entity_relationship')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'primary entity 2', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='primary_entity2')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'quality', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='quality')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'qualifier', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='qualifier')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'secondary entity 1', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='secondary_entity1')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'secondary entity relationship', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='secondary_entity_relationship')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'secondary entity 2', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='secondary_entity2')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'environment', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='environment')),

  ((SELECT cv_id FROM cv WHERE name='phenotype_properties'),
   'phene description', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='phene_description')),
  ((SELECT cv_id FROM cv WHERE name='phenotype_properties'),
   'dominant recessive trait', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='dominant_recessive_trait')),
  ((SELECT cv_id FROM cv WHERE name='phenotype_properties'),
   'loss or gain of function', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='loss_or_gain_of_function')),
   
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'EQ statement', '', 
   (SELECT dbxref_id FROM dbxref WHERE accession='eq_statement')),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'Primary entity', '', 
   (SELECT dbxref_id FROM dbxref 
    WHERE accession='primary_entity' 
          AND db_id = (SELECT db_id FROM db WHERE name='internal'))),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'Quality-qualifier', '', 
   (SELECT dbxref_id FROM dbxref 
    WHERE accession='quality_qualifier'
          AND db_id = (SELECT db_id FROM db WHERE name='internal'))),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'Secondary entity', '', 
   (SELECT dbxref_id FROM dbxref 
    WHERE accession='secondary_entity'
          AND db_id = (SELECT db_id FROM db WHERE name='internal'))),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'Condition', '', 
   (SELECT dbxref_id FROM dbxref 
    WHERE accession='condition'
          AND db_id = (SELECT db_id FROM db WHERE name='internal'))),
  ((SELECT cv_id FROM cv WHERE name='postcomposed_terms'),
   'Condition for', '', 
   (SELECT dbxref_id FROM dbxref 
    WHERE accession='condition_for'
          AND db_id = (SELECT db_id FROM db WHERE name='internal')))
;



-- Load a statement
INSERT INTO phenotype
  (uniquename, name)
VALUES
  ('phene1', 'Abnormal hypocotyl gravicurvature under far-red-light')
;

INSERT INTO phenotypeprop
  (phenotype_id, type_id, value, rank)
VALUES
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='phene description' 
          AND cv_id = (SELECT cv_id FROM cv 
                       WHERE name='phenotype_properties')),
   'Abnormal hypocotyl length and cotyledon size under red and far-red light',
   1),
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='dominant recessive trait' 
          AND cv_id = (SELECT cv_id FROM cv 
                       WHERE name='phenotype_properties')),
   'Recessive',
   1),
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='loss or gain of function' 
          AND cv_id = (SELECT cv_id FROM cv 
                       WHERE name='phenotype_properties')),
   'Loss-of-function',
   1)
;

INSERT INTO phenotype_cvterm
  (phenotype_id, cvterm_id, type_id, rank)
VALUES
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='0009630' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='GO'))),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='primary entity 1' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   1),
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='0000066' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='RO'))),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='primary entity relationship' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   2),
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='0020100' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='PO'))),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='primary entity 2' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   3),
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='0001236' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='PATO'))),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='quality' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   4),
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='0000460' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='PATO'))),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='qualifier' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   5),
  ((SELECT phenotype_id FROM phenotype WHERE uniquename='phene1'),
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='0007203' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='EO'))),
   (SELECT cvterm_id FROM cvterm 
    WHERE name='environment' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   6)
;

-- statement structure (start from root of grp tree)
INSERT INTO grp
  (name, uniquename, type_id)
VALUES
  ('Abnormal hypocotyl gravicurvature under far-red-light', 
   'grp1',
   (SELECT cvterm_id FROM cvterm 
    WHERE name='EQ statement' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
  ('Hypocotyl gravitropism', 
   'grp2',
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Primary Entity' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
  ('Process quality abnormal', 
   'grp3',
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Quality-qualifier' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
  ('Far red light regimen', 
   'grp4',
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Condition' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')))
;

INSERT INTO grp_relationship
  (value, rank, type_id, subject_id, object_id)
VALUES
  ('', 1,
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='is_a' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='OBO_REL'))),
    (SELECT grp_id FROM grp WHERE uniquename='grp1'),
    (SELECT grp_id FROM grp WHERE uniquename='grp4')),
  ('', 2,
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='is_a' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='OBO_REL'))),
    (SELECT grp_id FROM grp WHERE uniquename='grp2'),
    (SELECT grp_id FROM grp WHERE uniquename='grp4')),
  ('', 1,
   (SELECT cvterm_id FROM cvterm 
    WHERE dbxref_id = (SELECT dbxref_id FROM dbxref 
                       WHERE accession='condition_for' 
                             AND db_id = (SELECT db_id FROM db 
                                          WHERE name='internal'))),
    (SELECT grp_id FROM grp WHERE uniquename='grp3'),
    (SELECT grp_id FROM grp WHERE uniquename='grp4'))
;

INSERT INTO grpmember
  (rank, type_id, grp_id, linking_table)
VALUES
  (1,
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Primary Entity' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   (SELECT grp_id FROM grp WHERE uniquename='grp2'),
   'phenotype_cvterm'),
  (2,
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Primary Entity' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   (SELECT grp_id FROM grp WHERE uniquename='grp2'),
   'phenotype_cvterm'),
  (3,
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Primary Entity' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   (SELECT grp_id FROM grp WHERE uniquename='grp2'),
   'phenotype_cvterm'),
  (4,
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Quality-qualifier' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   (SELECT grp_id FROM grp WHERE uniquename='grp3'),
   'phenotype_cvterm'),
  (5,
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Quality-qualifier' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   (SELECT grp_id FROM grp WHERE uniquename='grp3'),
   'phenotype_cvterm'),
  (6,
   (SELECT cvterm_id FROM cvterm 
    WHERE name='Condition' 
          AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
   (SELECT grp_id FROM grp WHERE uniquename='grp4'),
   'phenotype_cvterm')
;

WITH rows AS (
  INSERT INTO grpmember 
    (rank, type_id, grp_id, linking_table) 
  VALUES
    (1,
     (SELECT cvterm_id FROM cvterm 
      WHERE name='Primary entity' 
            AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
     (SELECT grp_id FROM grp WHERE uniquename='grp2'),
     'phenotype_cvterm')
   RETURNING grpmember_id
)
INSERT INTO phenotype_cvterm_grpmember
  (grpmember_id, phenotype_cvterm_id, linking_table)
VALUES
  ((SELECT grpmember_id FROM rows),
   (SELECT phenotype_cvterm_id FROM phenotype_cvterm
           WHERE type_id = (SELECT cvterm_id FROM cvterm 
                            WHERE name='primary entity 1' 
                                  AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
   'phenotype_cvterm');

WITH rows AS (
  INSERT INTO grpmember 
    (rank, type_id, grp_id, linking_table) 
  VALUES
    (2,
     (SELECT cvterm_id FROM cvterm 
      WHERE name='Primary entity' 
            AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
     (SELECT grp_id FROM grp WHERE uniquename='grp2'),
     'phenotype_cvterm')
   RETURNING grpmember_id
)
INSERT INTO phenotype_cvterm_grpmember
  (grpmember_id, phenotype_cvterm_id, linking_table)
VALUES
  ((SELECT grpmember_id FROM rows),
   (SELECT phenotype_cvterm_id FROM phenotype_cvterm
           WHERE type_id = (SELECT cvterm_id FROM cvterm 
                            WHERE name='primary entity relationship' 
                                  AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
   'phenotype_cvterm');
       
WITH rows AS (
  INSERT INTO grpmember 
    (rank, type_id, grp_id, linking_table) 
  VALUES
    (3,
     (SELECT cvterm_id FROM cvterm 
      WHERE name='Primary entity' 
            AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
     (SELECT grp_id FROM grp WHERE uniquename='grp2'),
     'phenotype_cvterm')
   RETURNING grpmember_id
)
INSERT INTO phenotype_cvterm_grpmember
  (grpmember_id, phenotype_cvterm_id, linking_table)
VALUES
  ((SELECT grpmember_id FROM rows),
   (SELECT phenotype_cvterm_id FROM phenotype_cvterm
           WHERE type_id = (SELECT cvterm_id FROM cvterm 
                            WHERE name='primary entity 2' 
                                  AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
   'phenotype_cvterm');

WITH rows AS (
  INSERT INTO grpmember 
    (rank, type_id, grp_id, linking_table) 
  VALUES
    (4,
     (SELECT cvterm_id FROM cvterm 
      WHERE name='Quality-qualifier' 
            AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
     (SELECT grp_id FROM grp WHERE uniquename='grp2'),
     'phenotype_cvterm')
   RETURNING grpmember_id
)
INSERT INTO phenotype_cvterm_grpmember
  (grpmember_id, phenotype_cvterm_id, linking_table)
VALUES
  ((SELECT grpmember_id FROM rows),
   (SELECT phenotype_cvterm_id FROM phenotype_cvterm
           WHERE type_id = (SELECT cvterm_id FROM cvterm 
                            WHERE name='quality' 
                                  AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
   'phenotype_cvterm');

WITH rows AS (
  INSERT INTO grpmember 
    (rank, type_id, grp_id, linking_table) 
  VALUES
    (5,
     (SELECT cvterm_id FROM cvterm 
      WHERE name='Quality-qualifier' 
            AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
     (SELECT grp_id FROM grp WHERE uniquename='grp2'),
     'phenotype_cvterm')
   RETURNING grpmember_id
)
INSERT INTO phenotype_cvterm_grpmember
  (grpmember_id, phenotype_cvterm_id, linking_table)
VALUES
  ((SELECT grpmember_id FROM rows),
   (SELECT phenotype_cvterm_id FROM phenotype_cvterm
           WHERE type_id = (SELECT cvterm_id FROM cvterm 
                            WHERE name='qualifier' 
                                  AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
   'phenotype_cvterm');

WITH rows AS (
  INSERT INTO grpmember 
    (rank, type_id, grp_id, linking_table) 
  VALUES
    (6,
     (SELECT cvterm_id FROM cvterm 
      WHERE name='Condition' 
            AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms')),
     (SELECT grp_id FROM grp WHERE uniquename='grp2'),
     'phenotype_cvterm')
   RETURNING grpmember_id
)
INSERT INTO phenotype_cvterm_grpmember
  (grpmember_id, phenotype_cvterm_id, linking_table)
VALUES
  ((SELECT grpmember_id FROM rows),
   (SELECT phenotype_cvterm_id FROM phenotype_cvterm
           WHERE type_id = (SELECT cvterm_id FROM cvterm 
                            WHERE name='environment' 
                                  AND cv_id = (SELECT cv_id FROM cv WHERE name='postcomposed_terms'))),
   'phenotype_cvterm');


-- Sample queries
SELECT t.name AS term, p.name AS part FROM phenotype_cvterm pc
  INNER JOIN cvterm t ON t.cvterm_id = pc.cvterm_id
  INNER JOIN cvterm p ON p.cvterm_id = pc.type_id
WHERE phenotype_id=(SELECT phenotype_id FROM phenotype WHERE uniquename='phene1') 
ORDER BY rank;  

SELECT t.name AS term, p.name AS part FROM phenotype_cvterm pc
  INNER JOIN cvterm t ON t.cvterm_id = pc.cvterm_id
  INNER JOIN cvterm p ON p.cvterm_id = pc.type_id
  INNER JOIN phenotype_cvterm_grpmember pcg ON pcg.phenotype_cvterm_id = pc.phenotype_cvterm_id
  INNER JOIN grpmember gm ON gm.grpmember_id = pcg.grpmember_id
  INNER JOIN grp g ON g.grp_id=gm.grp_id
WHERE g.uniquename = 'grp2'
ORDER BY pc.rank;

