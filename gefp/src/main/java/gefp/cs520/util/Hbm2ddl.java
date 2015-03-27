package gefp.cs520.util;

import java.util.HashMap;

import org.hibernate.cfg.Configuration;
import org.hibernate.ejb.Ejb3Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

@SuppressWarnings("deprecation")
public class Hbm2ddl {

    public static void main( String args[] )
    {
        if( args.length == 0 )
        {
            System.err.println( "java Hbm2ddl <outputFile>" );
            return;
        }
        
        System.out.print( "Export DDL to " + args[0] + " ... " );

        Configuration cfg = (new Ejb3Configuration()).configure(
            "gefp", new HashMap<String, Object>() )
            .getHibernateConfiguration();

        SchemaExport schemaExport = new SchemaExport( cfg );
        schemaExport.setOutputFile( args[0] )
            .setDelimiter( ";" )
            .setFormat( true )
            .setHaltOnError( true );

        // . output script to console (and file if outputFile is set): true
        // . export to database: false
        // . only drop the tables: false
        // . only create the tables: true
        schemaExport.execute( true, false, false, true );

        System.out.println( "Done." );
    }
}