p Venue.where("REPLACE(name, 'The American Express Community', 'AMEX') ILIKE ?",
              "AMEX Stadium").or(Venue.where("REPLACE(name, '.', '') ILIKE ?",
              "St James' Park"))
