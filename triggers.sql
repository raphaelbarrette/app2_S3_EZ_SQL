CREATE OR REPLACE FUNCTION procedure_reserv_update() RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF EXISTS (
            SELECT 1
            FROM reservation res
            WHERE res.idLocal = NEW.idLocal
              AND res.date_debut < NEW.date_fin
              AND res.date_fin > NEW.date_debut
              AND res.reservationid <> NEW.reservationid
              AND res.pavillonid = NEW.pavillonid
        )
        THEN
            RAISE EXCEPTION 'Conflit dans la reservation : L interval de temps choisi chevauche une reservation existante.';
        END IF;
        IF (NEW.date_fin - NEW.date_debut) > INTERVAL '4 hours' THEN
            RAISE EXCEPTION 'La durée de réservation doit être inférieure ou égale à 4 heures.';
        END IF;

        INSERT INTO log(idlog, description, date, reservationid, cip)
        VALUES(DEFAULT, 'Reservation creee', current_timestamp, new.reservationid, new.cip);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        IF EXISTS (
            SELECT 1
            FROM reservation res
            WHERE res.idLocal = NEW.idLocal
              AND res.pavillonid = NEW.pavillonid
              AND res.date_debut < NEW.date_fin
              AND res.date_fin > NEW.date_debut
              AND res.reservationid <> NEW.reservationid
        )
        THEN
            RAISE EXCEPTION 'Conflit dans la reservation : L interval de temps choisi chevauche une reservation existante.';
        END IF;
        IF (NEW.date_fin - NEW.date_debut) > INTERVAL '4 hours' THEN
            RAISE EXCEPTION 'La durée de réservation doit être inférieure ou égale à 4 heures.';
        END IF;

        INSERT INTO log(idlog, description, date, reservationid, cip)
        VALUES(DEFAULT, 'Update de la reservation', current_timestamp, new.reservationid, new.cip);

        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_reservation_update ON reservation;
DROP TRIGGER IF EXISTS trigger_reservation_soft_delete ON reservation;

CREATE OR REPLACE FUNCTION trigger_reservation_soft_delete()
    RETURNS TRIGGER AS $$
BEGIN
    -- Instead of deleting the row, mark it as deleted
    NEW.is_deleted := TRUE;

    -- Insert a log entry for the deleted reservation
    INSERT INTO log(idlog, description, date, cip, reservationid)
    VALUES(DEFAULT, 'Reservation annule', CURRENT_TIMESTAMP, OLD.cip, OLD.reservationid);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_reservation_update
    AFTER INSERT OR UPDATE ON reservation
    FOR EACH ROW
EXECUTE PROCEDURE procedure_reserv_update();

CREATE TRIGGER trigger_reservation_soft_delete
    BEFORE UPDATE ON reservation
    FOR EACH ROW
    WHEN (OLD.is_deleted IS DISTINCT FROM NEW.is_deleted)
EXECUTE PROCEDURE trigger_reservation_soft_delete();