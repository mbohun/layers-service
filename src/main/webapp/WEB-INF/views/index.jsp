<%-- 
    Document   : index
    Created on : Aug 25, 2011, 10:33:50 AM
    Author     : ajay
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %><%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@
taglib uri="/tld/ala.tld" prefix="ala" %>
<%@include file="common/top.jsp" %>


<div id="content">



        <div class="inner">
            <section id="content-search">
                <h1>Spatial Web Services</h1>
                <p style="color:red">Warning: Some of these services return OK status 200 when an error occurs. This is an issue we will be fixing soon. Please email <strong>support 'AT' ala.org.au </strong> if you receive unexpected output from a OK return status.</p>
                <p>Following are a list of ALA Spatial web services.</p>
            </section>
        </div><!--inner-->


    <div class="inner">
        <div class="col-wide last" style="width:100%">


        <h3>Layers Web Services</h3>

        <p>
            These webservices provide spatial search capabilities. These services are in addition to occurrence searching
            services available at <a href="http://biocache.ala.org.au/ws">http://biocache.ala.org.au/ws</a>
            <br/>
            Please send any bug reports, suggestions for improvements or new services to:
            <strong>developers 'AT' ala.org.au</strong>
        </p>

            <ul>
                <li>Layers<ul>
                        <li><strong>Get a list of all layers:</strong> <a href="/ws/layers">/ws/layers</a></li>
                        <li><strong>Get a list of all environmental/gridded layers:</strong> <a href="/ws/layers/grids">/ws/layers/grids</a></li>
                        <li><strong>Get a list of all contextual layers:</strong> <a href="/ws/layers/shapes">/ws/layers/shapes</a></li>
                    </ul></li>

                <li>Fields<ul>
                        <li><strong>Get a list of all fields:</strong> <a href="/ws/fields">/ws/fields</a></li>
                        <li><strong>Get information about a specific field, given a field id:</strong> /ws/field/{id} e.g. <a href="/ws/field/cl22">/ws/field/cl22</a></li>
                    </ul></li>

                <li>Objects<ul>
                        <li><strong>Get a list of objects, given the field id:</strong> /ws/objects/{id} e.g. <a href="/ws/objects/cl22">/ws/objects/cl22</a></li>
                        <li><strong>Get information about an object, given its pid</strong> /ws/object/{pid} e.g. <a href="/ws/object/3742602">/ws/object/3742602</a></li>
                        <li><strong>Download a shape object as KML, given its pid:</strong> /ws/shape/kml/{pid} e.g. <a href="/ws/shape/kml/3742602">/ws/shape/kml/3742602</a></li>
                        <li><strong>Download a shape object as WKT, given its pid:</strong> /ws/shape/wkt/{pid} <a href="/ws/shape/wkt/3742602">/ws/shape/wkt/3742602</a></li>
                        <li><strong>Download a shape object as GeoJSON, given its pid:</strong> /ws/shape/geojson/{pid} <a href="/ws/shape/geojson/3742602">/ws/shape/geojson/3742602</a></li>
                        <li><strong>Download a shape object as a zipped ESRI shape (.shp) file, given its pid:</strong> /ws/shape/shp/{pid} <a href="/ws/shape/shp/3742602">/ws/shape/shp/3742602</a></li>
                        <li><strong>Get the nearest objects to a coordinate</strong> /ws/objects/{id}/{lat}/{lng}?limit=40 e.g. <a href="/ws/objects/cl915/-22.465864536394/124.419921875?limit=10">/ws/objects/cl915/-22.465864536394/124.419921875?limit=10</a></li>
             		    <li><strong>Upload geometry as WKT:</strong> POST request to /ws/shape/upload/wkt. POST data must be a json object containing the following fields:
							<ul>
							    <li><strong>wkt:</strong> a WKT string describing the geometry</li>
							    <li><strong>name:</strong> the name of the geometry (string)</li>
							    <li><strong>description:</strong> description of the geometry (string)</li>
							    <li><strong>user_id:</strong> user id associated with api key (see below) (number)</li>
							    <li><strong>api_key:</strong> spatial portal api key - see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
						    </ul>
						    <strong>Example:</strong> {"wkt": "POLYGON((125.5185546875 -21.446934836644,128.2431640625 -21.446934836644,128.2431640625 -19.138942324356,125.5185546875 -19.138942324356,125.5185546875 -21.446934836644))", "name": "test", "description": "test description", "userid": "user1"}
						    <strong>Return value:</strong> a JSON object containing the pid for the newly uploaded geometry e.g. {"pid":3742602}
						</li>
						<li><strong>Upload geometry as geojson:</strong> POST request to /ws/shape/upload/geojson. POST data must be a json object containing the following fields:
							<ul>
						    	<li><strong>geojson:</strong> a geojson string describing the geometry</li>
						    	<li><strong>name:</strong> the name of the geometry (string)</li>
						    	<li><strong>description:</strong> description of the geometry (string)</li>
 							    <li><strong>user_id:</strong> user id associated with api key (see below) (string)</li>
							    <li><strong>api_key:</strong> spatial portal api key (string) - see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
						    </ul>
						    <strong>Example:</strong> {"geojson": "{\"type\":\"Polygon\",\"coordinates\":[[[125.5185546875,-21.446934836644001],[128.2431640625,-21.446934836644001],[128.2431640625,-19.138942324356002],[125.5185546875,-19.138942324356002],[125.5185546875,-21.446934836644001]]]}", "name": "test", "description": "test", "userid": "user1"}
						    <strong>Return value:</strong> a JSON object containing the ID for the newly uploaded geometry e.g. {"id":3742602}
						</li>
						<li><strong>Upload geometry as point and radius</strong> POST request to /ws/shape/upload/{latitude}/{longitude}/{radius}. POST data must be a json object containing the following fields:
							<ul>
						    	<li><strong>name:</strong> the name of the geometry (string)</li>
						    	<li><strong>description:</strong> description of the geometry (string)</li>
 							    <li><strong>user_id:</strong> user id associated with api key (see below) (string)</li>
							    <li><strong>api_key:</strong> spatial portal api key (string)- see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
						    </ul>
						    <strong>Return value:</strong> a JSON object containing the ID for the newly uploaded geometry e.g. {"id":3742602}
						</li>
						<li>
							<strong>Upload geometry from shape file feature.</strong>This is a two step process:
							<ol>
								<li><strong>Upload zipped shape file:</strong> A shape file must first be uploaded in a zip archive before its features can be used to create objects. A shape file can be uploaded by one of two methods:
									<ul>
										<li><strong>Multipart POST:</strong> Multipart POST to /ws/shape/upload/shp?user_id={user_id}&api_key={api_key}, with the zipped shape file in the multipart form data.</li>
										<li><strong>Regular POST:</strong> Regular POST to /ws/shape/upload/shp with. The POST data must be a json object containing the following fields:	
										<ul>
									    	<li><strong>shp_file_url:</strong> description of the geometry (string)</li>
			 							    <li><strong>user_id:</strong> user id associated with api key (see below) (String)</li>
										    <li><strong>api_key:</strong> spatial portal api key (string) - see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
									    </ul>							
									</ul>
									<strong>Return value:</strong> Both methods return a json object with a field "shp_id" whose value is an id for the uploaded shape. In addition, the object contains numbered fields for each feature whose values are
									the attribute values for each feature. E.g. {"shp_id":"1376461253025-0","0":{"id":15,"name":"Snow and ice"}} 
								</li>
							    <li>
							    <strong>Create object from shape file feature:</strong> Once a shape file has been uploaded, its features can be used to create objects. Send a POST request to: /shape/upload/shp/{shapeId}/{featureIndex}, where {shapeId} is the id of the uploaded shape file, and {featureIndex}
							     is the numeric index of the desired feature, both returned in the response of the shape file upload method (see above). POST data must be a JSON object containing the following fields:
	     							<ul>
								    	<li><strong>name:</strong> the name of the geometry (string)</li>
								    	<li><strong>description:</strong> description of the geometry (string)</li>
		 							    <li><strong>user_id:</strong> user id associated with api key (see below) (string)</li>
									    <li><strong>api_key:</strong> spatial portal api key (string)- see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
							    	</ul>
							    	<strong>Return value:</strong> a JSON object containing the ID for the newly created object e.g. {"id":3742602}
								</li>
							</ol>
						</li>	
						<li>
							<strong>Update geometry from shape file feature.</strong> POST request to: /shape/upload/shp/{objectPid}/{shapeId}/{featureIndex}, where {objectPid} is the id of the object to update, {shapeId} is the
							 id of the uploaded shape file and {featureIndex} is the numeric index of the desired feature, as returned in the response of the shape file upload method (see above). POST data must be a JSON object containing the following fields:
   							<ul>
						    	<li><strong>name:</strong> the name of the geometry (string)</li>
						    	<li><strong>description:</strong> description of the geometry (string)</li>
 							    <li><strong>user_id:</strong> user id associated with api key (see below) (string)</li>
							    <li><strong>api_key:</strong> spatial portal api key (string)- see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
					    	</ul>
					    	<strong>Return value:</strong> a JSON object containing a boolean field "updated" which indicates whether or not the object was successfully updated e.g. {"updated":true}
						</li>					
                    </ul></li>

				<li>Points Of Interest<ul>
             		    <li><strong>Create point of interest</strong> POST request to /ws/poi. POST data must be a json object containing the following fields:
							<ul>
							    <li><strong>name:</strong> name of the point of interest (string)</li>
							    <li><strong>type:</strong> the type of point of interest e.g. "photo point"</li>
							    <li><strong>description:</strong> description of the point of interest (string) - optional</li>
							    <li><strong>latitude:</strong> latitude (number)</li>
							    <li><strong>longitude:</strong> longitude (number)</li>
							    <li><strong>user_id:</strong> user id associated with api key (see below) (number)</li>
							    <li><strong>api_key:</strong> spatial portal api key - see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
							    <li><strong>object_id:</strong> id of the object associated with this point of interest (string) - optional</li>
							    <li><strong>bearing:</strong> compass bearing in degrees (number) - optional</li>
							    <li><strong>focal_length:</strong> focal length in millimetres (number) - optional</li>
							    
						    </ul>
						    <strong>Return value:</strong> a JSON object containing the id for the newly created point of interest e.g. {"id":1234}
						</li>
						<li><strong>Update point of interest</strong> POST request to /ws/poi/{id}, where {id} is the point of interest id.
						 POST data must be a json object containing the following fields:             		    		
							<ul>
							    <li><strong>name:</strong> name of the point of interest (string)</li>
							    <li><strong>type:</strong> the type of point of interest e.g. "photo point"</li>
							    <li><strong>description:</strong> description of the point of interest (string) - optional</li>
							    <li><strong>latitude:</strong> latitude (number)</li>
							    <li><strong>longitude:</strong> longitude (number)</li>
							    <li><strong>user_id:</strong> user id associated with api key (see below) (number)</li>
							    <li><strong>api_key:</strong> spatial portal api key - see <a href="http://auth.ala.org.au/apikey/">http://auth.ala.org.au/apikey/</a></li>
							    <li><strong>object_id:</strong> id of the object associated with this point of interest (string) - optional</li>
							    <li><strong>bearing:</strong> compass bearing in degrees (number) - optional</li>
							    <li><strong>focal_length:</strong> focal length in millimetres (number) - optional</li>
						    </ul>
						    Not supplying values for optional fields will have the effect of nulling any previously set values for such fields.
						    <strong>Return value:</strong> a JSON object containing a boolean field "updated" which indicates whether or not the point of interest was successfully updated e.g. {"updated":true}
						</li>
						<li><strong>Get point of interest details</strong> GET request to /ws/poi/{id}, where {id} is the point of interest id.
						<strong>Return value:</strong> a JSON object containing the following fields:
							<ul>
								<li><strong>name:</strong> id of the point of interest (string)</li>
							    <li><strong>name:</strong> id of the point of interest (string)</li>
							    <li><strong>type:</strong> the type of point of interest e.g. "photo point"</li>
							    <li><strong>description:</strong> description of the point of interest (string)</li>
							    <li><strong>latitude:</strong> latitude (number)</li>
							    <li><strong>longitude:</strong> longitude (number)</li>
							    <li><strong>user_id:</strong> user id of the user who created the point of interest</li>
							    <li><strong>object_id:</strong> id of the object associated with this point of interest (string)</li>
							    <li><strong>bearing:</strong> compass bearing in degrees (number)</li>
							    <li><strong>focal_length_millimetres:</strong> focal length in millimetres (number)</li>
						    </ul>
					    </li>
						<li><strong>Delete point of interest</strong> DELETE request to /ws/poi/{id}?user_id={user id}&api_key={api key}, where {id} is the point of interest id, and the user id and api key are
						supplied as url arguments.
							<strong>Return value:</strong> a JSON object containing a boolean field "deleted" which indicates whether or not the point of interest was successfully deleted e.g. {"deleted":true}
					    </li>
					    
					    <li><strong>Retrieve details of all points of interest within a specified radius of a point:</strong> GET request to /intersect/poi/pointradius/{latitude}/{longitude}/{radius} - radius is in kilometres e.g. <a href="/ws/intersect/poi/pointradius/-35.30821/149.12444/5">/ws/intersect/poi/pointradius/-35.30821/149.12444/5</a></li>
                        <li><strong>Retrieve details of all points of interest that intersect with a geometry specified using wkt:</strong> GET or POST request to /intersect/poi/wkt with request parameter "wkt" containing the wkt geometry to intersect e.g. <a href="/ws/intersect/poi/wkt?wkt=POLYGON((149.09641919556 -35.320882015603,149.15598569337 -35.320882015603,149.15598569337 -35.271424614118,149.09641919556 -35.271424614118,149.09641919556 -35.320882015603))">/ws/intersect/poi/wkt?wkt=POLYGON((149.09641919556 -35.320882015603,149.15598569337 -35.320882015603,149.15598569337 -35.271424614118,149.09641919556 -35.271424614118,149.09641919556 -35.320882015603))</a></li>
                        <li><strong>Retrieve details of all points of interest that intersect with a geometry specified using geojson:</strong> GET or POST request to /intersect/poi/geojson with request parameter "geojson" containing the geojson geometry to intersect e.g. {"type":"Polygon","coordinates":[[[125.5185546875,-21.446934836644001],[128.2431640625,-21.446934836644001],[128.2431640625,-19.138942324356002],[125.5185546875,-19.138942324356002],[125.5185546875,-21.446934836644001]]]}</li>
                        <li><strong>Retrieve details of all points of interest that intersect an object:</strong> GET request to /intersect/poi/object/{id} - where "id" is the object id e.g. <a href="/ws/intersect/poi/object/3742602">/ws/intersect/poi/object/3742602</a></li>					    
				</ul></li>

                <li>Search<ul>
                        <li><strong>Search for gazetteer localities:</strong> /search?q={free text} e.g. <a href="/ws/search?q=canberra">/ws/search?q=canberra</a></li>
                    </ul></li>

                <li>Intersect<ul>
                        <li><strong>Intersect a layer(s) at a given set of coordinates. Multiple field ids or layer names can be specified separated by a comma (e.g. cl22,cl23):</strong> /ws/intersect/{id}/{latitude}/{longitude} e.g. <a href="/ws/intersect/cl22/-29.911/132.769">/ws/intersect/cl22/-29.911/132.769</a></li>
                        <li><strong>Batch intersect a layer(s) at given coordinates. Multiple field ids or layer names can be specified separated by a comma (e.g. cl22,cl23).  Limited to 1000 coordinates.:</strong> /ws/intersect/batch e.g. <a href="/ws/intersect/batch?fids=cl22&points=-29.911,132.769,-20.911,122.769">/ws/intersect/batch?fids=cl22&amp;points=-29.911,132.769,-20.911,122.769</a></li>
                        <li><strong>Check batch intersect status with a batchId:</strong> /ws/intersect/batch/{batchId} e.g. /ws/intersect/batch/1234</li>
                        <li><strong>Download a finished batch intersect with a batchId as zipped file 'sample.csv':</strong> /ws/intersect/batch/download/{batchId} e.g. /ws/intersect/batch/download/1234</li>
                    </ul></li>

                <li>Distributions<ul>
                    <li><strong>Get a list of all distributions:</strong> <a href="/ws/distributions">/ws/distributions</a>
                        <ul>
                            <li><strong>min_depth</strong> - min depth in metres</li>
                            <li><strong>max_depth</strong> - max depth in metres</li>
                            <li><strong>wkt</strong> - well known text string to use to intersect distributions</li>
                            <li><strong>fid</strong> - the id for the alayer</li>
                            <li><strong>objectName</strong> - the name of the object in the layer used to intersect distributions</li>
                            <li><strong>coastal</strong> - Values are true/false or null (= not entered); false = non-estuarine, true = coastal </li>
                            <li><strong>desmersal</strong> - Values are true/false or null (= not entered); false = non-estuarine, true = desmersal </li>
                            <li><strong>estuarine</strong> - Values are true/false or null (= not entered); false = non-estuarine, true = estuarine </li>
                            <li><strong>pelagic</strong> - Values are true/false or null</li>
                            <li><strong>groupName</strong> - e.g. "sharks", "rays", "chimaeras"</li>
                            <li><strong>family</strong> - e.g. "Alopiidae". For multiple families add multiple "&family=?" params to URL</li>
                            <li><strong>familyLsid</strong> - e.g. "urn:lsid:biodiversity.org.au:afd.taxon:7cb7f40d-143f-49cc-839d-613259786a42"</li>
                            <li><strong>genus</strong> - e.g. "Alopias" For multiple genera add multiple "&genus=?" params to URL</li>
                            <li><strong>genusLsid</strong> - e.g. "urn:lsid:biodiversity.org.au:afd.taxon:557d7f85-a430-4424-a7ae-7fca52b8b443"</li>
                            <li><strong>dataResourceUid</strong> - e.g. "dr803" to only retrieve distributions supplied by a specific resource
                                e.g. <a href="http://collections.ala.org.au/public/show/dr803">ANFC (dr803)</a>
                            </li>
                        </ul>
                    </li>
                    <li><strong>Get a count of all distributions by family:</strong> <a href="/ws/distributions/counts">/ws/distributions/counts</a>
                    	<p>
                    		Same supported parameters as <a href="/ws/distributions/counts">/ws/distributions/</a>.
                    	</p>	
                   </li> 	                    
                    <li><strong>Get a list of all distributions for radius:</strong> <a href="/ws/distributions/radius">/ws/distributions/radius</a>
                        <ul>
                            <li><strong>lat</strong> - latitude</li>
                            <li><strong>lon</strong> - longitude</li>
                            <li><strong>radius</strong> - radius in metres</li>
                            <li><strong>min_depth</strong> - min depth in metres</li>
                            <li><strong>max_depth</strong> - max depth in metres</li>
                            <li><strong>coastal</strong> - Values are true/false or null (= not entered); false = non-estuarine, true = coastal </li>
                            <li><strong>desmersal</strong> - Values are true/false or null (= not entered); false = non-estuarine, true = desmersal </li>
                            <li><strong>estuarine</strong> - Values are true/false or null (= not entered); false = non-estuarine, true = estuarine </li>
                            <li><strong>pelagic</strong> - Values are true/false or null</li>
                            <li><strong>groupName</strong> - e.g. "sharks", "rays", "chimaeras"</li>
                            <li><strong>family</strong> - e.g. "Alopiidae". For multiple families add multiple e.g. "?family=Alopiidae&family=Rhinochimaeridae" params to URL</li>
                            <li><strong>familyLsid</strong> - e.g. "urn:lsid:biodiversity.org.au:afd.taxon:7cb7f40d-143f-49cc-839d-613259786a42"</li>
                            <li><strong>genus</strong> - e.g. "Alopias" For multiple genera add multiple "&genus=?" params to URL</li>
                            <li><strong>genusLsid</strong> - e.g. "urn:lsid:biodiversity.org.au:afd.taxon:557d7f85-a430-4424-a7ae-7fca52b8b443"</li>
                            <li><strong>dataResourceUid</strong> - e.g. "dr803" to only retrieve distributions supplied by a specific resource
                                e.g. <a href="http://collections.ala.org.au/public/show/dr803">ANFC (dr803)</a>
                            </li>
                        </ul>
                    </li>
                    <li><strong>Get a count of all distributions for radius by family:</strong> <a href="/ws/distributions/radius/counts">/ws/distributions/radius</a>
                    	<p>
                    		Same supported parameters as <a href="/ws/distributions/radius">/ws/distributions/radius</a>.
                    	</p>	
                   </li> 	                    
                    
                    <li><strong>Get information about a specific distribution, given a spcode:</strong> /ws/distribution/{spcode} e.g. <a href="/ws/distribution/37031044">/ws/distribution/37031044</a> (Arafura Skate)</li>
                    <li><strong>Get information about a specific distribution, given a LSID:</strong> /ws/distribution/lsid/{lsid} e.g. <a href="/ws/distribution/lsid/urn:lsid:biodiversity.org.au:afd.taxon:2386db84-1fdd-4c33-a2ea-66e13bfc8cf8">/ws/distribution/lsid/urn:lsid:biodiversity.org.au:afd.taxon:2386db84-1fdd-4c33-a2ea-66e13bfc8cf8</a> (Kapala Stingaree)</li>
                </ul></li>

                <li>Tabulation<ul>
                        <li><strong>Get a list of tabulations:</strong> <a href="/ws/tabulations">/ws/tabulations</a></li>
                        <!-- <li><strong>Get a list of tabulations as HTML:</strong> <a href="/ws/tabulations/html">/ws/tabulations/html</a></li> -->
                        <li><strong>Get tabulation for a single layer as HTML:</strong> /ws/tabulation/cl22/html?wkt={valid wkt polygon geometry} e.g. <a href="/ws/tabulation/cl22/html.html?wkt=POLYGON((130%20-24,138%20-24,138%20-20,130%20-20,130%20-24))">/ws/tabulation/cl22/html.html?wkt=POLYGON((130 -24,138 -24,138 -20,130 -20,130 -24))</a></li>
                        <li><strong>Get area tabulation for 2 layers, given their id's:</strong> /ws/tabulation/area/{id}/{id} e.g. <a href="/ws/tabulation/area/cl22/cl23">/ws/tabulation/area/cl22/cl23</a></li>
                        <li><strong>Get area tabulation as CSV for 2 layers, given their id's:</strong> /ws/tabulation/area/{id}/{id}/tabulation.csv e.g. <a href="/ws/tabulation/area/cl22/cl23/tabulation.csv">/ws/tabulation/area/cl22/cl23/tabulation.csv</a></li>
                        <li><strong>Get area tabulation as HTML for 2 layers, given their id's:</strong> /ws/tabulation/area/{id}/{id}/tabulation.html e.g. <a href="/ws/tabulation/area/cl22/cl23/tabulation.html">/ws/tabulation/area/cl22/cl23/tabulation.html</a></li>
                        <li><strong>Get tabulation within an area as HTML for 2 layers, given their id's:</strong> /ws/tabulation/{id}/{id}/html?wkt={valid wkt polygon geometry} e.g. <a href="/ws/tabulation/cl22/cl23/html.html?wkt=POLYGON((130%20-24,138%20-24,138%20-20,130%20-20,130%20-24))">/ws/tabulation/cl22/cl23/html.html?wkt=POLYGON((130 -24,138 -24,138 -20,130 -20,130 -24))</a></li>
                    </ul></li>
                    
               <li>RIF-CS<ul>
					<li><strong>Layer information in <a href="http://ands.org.au/guides/cpguide/cpgrifcs.html">RIF-CS</a> format:</strong> <a href="/ws/layers/rif-cs.xml">/ws/layers/rif-cs.xml</a></li>               
               </ul></li>
            </ul>

            <h3>Occurrences</h3>
            <ul>
                <li><strong>Static Species Density Heatmap </strong><a href="http://biocache.ala.org.au/ws/density/map?q=*:*">http://biocache.ala.org.au/ws/density/map?q=*:*</a> <a href="http://biocache.ala.org.au/ws/density/map?q=Sarcophilus%20harrisii">http://biocache.ala.org.au/ws/density/map?q=Sarcophilus%20harrisii</a></li> - returns heatmap image (optional param forceRefresh=true will regenerate the image)
                <li><strong>Static Species Density Legend: </strong><a href="http://biocache.ala.org.au/ws/density/legend?q=*:*">http://biocache.ala.org.au/ws/density/legend?q=*:*</a></li> - returns associated legend image (optional param forceRefresh=true will regenerate the image)
            </ul>

            <h3>Webportal Services</h3>
            <p>These Webportal services are available at <a href="http://biocache.ala.org.au/ws">http://biocache.ala.org.au/ws</a> </p>
            <ul>
                These services will include all records that satisfy the q, fq and wkt parameters.
                <ul>
                    <li>q - the initial query</li>
                    <li>fq - filters to be applied to the original query</li>
                    <li>wkt - filter polygon area to be applied to the original query</li>
                    <li>fl - a comma separated list of fields to include (contains a list of default)</li>
                    <li>pageSize - download limit (may be overridden)</li>
                </ul>

                <li><strong>Short Query Parameters:</strong>
                    <ul>
                        <li><strong>Construction:</strong> /webportal/params <br />
                            POST service.<br />
                            Stores q and wkt parameters.<br />
                            Returns a short <b>value</b> that can be used as the initial q value in other services for webportal. e.g. q=qid:<b>value</b>
                        </li>
                        <li><strong>Test: </strong> /webportal/params/<b>value</b>
                            Test if a short query parameter is valid.<br />
                            Returns true or false</li>
                    </ul>
                </li>
                <li><strong>Occurrences Bounding Box:</strong> /webportal/bbox <br />
                    Returns CSV of bounding box of occurrences eg. <a href="http://biocache.ala.org.au/ws/webportal/bbox?q=macropus">http://biocache.ala.org.au/ws/webportal/bbox?q=macropus</a></li>
                <li><strong>Data Providers</strong> /webportal/dataProviders eg. <a href="http://biocache.ala.org.au/ws/webportal/dataProviders?q=macropus">http://biocache.ala.org.au/ws/webportal/dataProviders?q=macropus</a></li>
                <li><strong>Species List:</strong>
                    <ul>
                        <li><strong>Get species list:</strong> /webportal/species eg. <a href="http://biocache.ala.org.au/ws/webportal/species?q=macropus&pageSize=100">http://biocache.ala.org.au/ws/webportal/species?q=macropus&amp;pageSize=100</a></li>
                        <li><strong>Get species list as CSV:</strong> /webportal/species.csv eg. <a href="http://biocache.ala.org.au/ws/webportal/species.csv?q=macropus&wkt=POLYGON((140:-37,151:-37,151:-26,140.1310:-26,140:-37))&pageSize=100">http://biocache.ala.org.au/ws/webportal/species.csv?q=macropus&amp;wkt=POLYGON((140:-37,151:-37,151:-26,140.1310:-26,140:-37))&amp;pageSize=100</a></li>
                    </ul>
                </li>
                <li><strong>Occurrences:</strong>
                    <ul>
                        <li><strong>Get occurrences:</strong> /webportal/occurrences eg. <a href="http://biocache.ala.org.au/ws/webportal/occurrences?q=macropus">http://biocache.ala.org.au/ws/webportal/occurrences?q=macropus</a></li>
                        <li><strong>Get occurrences as gzipped CSV:</strong> /webportal/occurrences.gz eg. <a href="http://biocache.ala.org.au/ws/webportal/occurrences.gz?q=macropus&fl=longitude,latitude">http://biocache.ala.org.au/ws/webportal/occurrences.gz?q=macropus&amp;fl=longitude,latitude</a></li>
                    </ul>
                </li>
            </ul>

            <h3>Webportal WMS Service</h3>
            <p>A working example is located <a href="http://code.google.com/p/alageospatialportal/wiki/SimpleWMSExample">here.</a></p>
            <ul>
                <li><strong>Tile:</strong> /webportal/wms/reflect
                    <ul>
                        <li>BBOX - EPSG900913 bounding box. e.g. &amp;BBOX=12523443.0512,-2504688.2032,15028131.5936,0.3392000021413</li>
                        <li>WIDTH - width in pixels</li>
                        <li>HEIGHT - height in pixels</li>
                        <li>CQL_FILTER - query parameter</li>
                        <li>ENV - additional parameters. e.g. ENV=color%3Acd3844%3Bsize%3A3%3Bopacity%3A0.8
                            <ul>
                                <li>color - hex RGB values. e.g. colour:cd3844</li>
                                <li>size - radius of points in pixels</li>
                                <li>opacity - opacity value 0 - 1</li>
                                <li>sel - fq parameter applied to CQL_FILTER.  Matching occurrences will be highlighted on the map in a Red circle</li>
                                <li>uncertainty - presence of the uncertainty parameter draws uncertainty circles to a fixed maximum of 30km</li>
                                <li>colormode - facet colouring type.  <br />
                                    <table>
                                        <tr><td>colourmode</td><td>description</td></tr>
                                        <tr><td>-1</td><td>(default) use color value</td></tr>
                                        <tr><td>grid</td><td>map as density grid.  Grid cells drawn are not restricted to within any query WKT parameters.</td></tr>
                                        <tr><td>facetname</td><td>colour as categories in a facet</td></tr>
                                        <tr><td>facetname,cutpoints</td><td>colour as range in a facet using the supplied
                                                comma separated cutpoints.  4 to 10 values are required.  Include minimum and maximum.
                                                Minimum and maximum values do not need to be accurate.
                                                e.g. colormode:year,1800,1900,1950,1970,1990,2010</td></tr>
                                    </table>
                                </li>
                            </ul>
                        </li>
                    </ul>
                <li><strong>Legend:</strong> /webportal/legend <br />
                    Get a CSV legend.<br />
                    Parameters:
                    <ul>
                        <li>q - CQL_FILTER value</li>
                        <li>cm - ENV colormode value</li>
                    </ul>
                    Contains columns:
                    <ul>
                        <li>name - legend item name</li>
                        <li>red - 0-255</li>
                        <li>green - 0-255</li>
                        <li>blue - 0-255</li>
                        <li>count - number of occurrences for this legend category in the q parameter</li>
                    </ul>
                </li>
            </ul>

            <h3>Analysis Web Services</h3>
            <p>There are three stages in using analysis web services; Start analysis, Monitor analysis, Retrieve output.</p>
            <ul>
                <li><strong>MaxEnt Prediction</strong>
                    <p>Start Maxent /alaspatial/ws/maxent, POST request.  E.g. http://spatial.ala.org.au/alaspatial/ws/maxent</p>
                    Parameters:
                    <ul>
                        <li>taxonid - this will be the name of maxent model.  E.g. “Macropus Rufus”.</li>
                        <li>taxonlsid – Life Science Identifier that is required but not currently used.  E.g. “urn:lsid:biodiversity.org.au:afd.taxon:aa745ff0-c776-4d0e-851d-369ba0e6f537”.</li>
                        <li>species – A csv file with a header record and containing all species points.  Column order is species name, longitude (decimal degrees), latitude (decimal degrees). E.g.
                            “Species,longitude,latitude
                            Macropus Rufus,122,-20
                            Macropus Rufus,123,-18”.
                        </li>
                        <li>area - bounding area in Well Known Text (WKT) format.  E.g.  “POLYGON((118 -30,146 -30,146 -11,118 -11,118 -30))”.</li>
                        <li>envlist – a list of environmental and contextual layers as colon separated short names.  E.g. “bioclim_bio1:bioclim_bio12:bioclim_bio2:landuse”.
                            <ul>
                                <li>List of analysis valid environmental layer short names <a href="http://spatial.ala.org.au/alaspatial/ws/spatial/settings/layers/environmental/string">here</a>. These are a subset of all layers <a href="http://spatial.ala.org.au/layers.">here</a></li>
                                <li>List of analysis valid contextual layers; landcover, landuse, vast, native_veg, present_veg </li>
                            </ul>
                        </li>
                        <li>txtTestPercentage - optional percentage of records dedicated to testing.  E.g. “23”.</li>
                        <li>chkJackKnife - optional parameter to enable/disable Jacknifing.  E.g. “Y”.</li>
                        <li>chkResponseCurves – optional parameter to enable/disable plots of response curves.  E.g. “Y”.</li>
                        <li>removedspecies - optional parameter to remove species from the analysis. Typically used to remove sensitive species that have been denatured.</li>
                        <li>res - optional paramter to specify the resolution for the maxent model.  Defaults to "0.01" when no value is provided.</li>
                    </ul>
                    <br />
                    <p>Returns: analysis id.  E.g. “123”.</p>
                </li>
                <li><strong>Classification (ALOC)</strong>
                    <p>Start ALOC /alaspatial/ws/aloc, POST request.  E.g. http://spatial.ala.org.au/alaspatial/ws/aloc</p>
                    Parameters:
                    <ul>
                        <li>gc - number of groups to try and produce. No guarantee that convergence to the exact number will occur. If not, it will generate as close a number of groups as possible.  E.g. “20”.</li>
                        <li>area - bounding area in Well Known Text (WKT) format.  E.g.  “POLYGON((118 -30,146 -30,146 -11,118 -11,118 -30))”.</li>
                        <li>envlist – a list of environmental layers as colon separated short names.  E.g. “bioclim_bio1:bioclim_bio12:bioclim_bio2”.
                            <ul>
                                <li>List of analysis valid environmental layer short names <a href="http://spatial.ala.org.au/alaspatial/ws/spatial/settings/layers/environmental/string">here</a>. These are a subset of all layers <a href="http://spatial.ala.org.au/layers.">here</a></li>
                                <li>List of analysis valid contextual layers; landcover, landuse, vast, native_veg, present_veg </li>
                            </ul>
                        </li>
                        <li>res - optional paramter to specify the resolution for the maxent model.  Defaults to "0.01" when no value is provided.</li>
                    </ul>
                    <br />
                    <p>Returns: analysis id.  E.g. “123”.</p>
                </li>
                <li><strong>Generalized dissimilarity modelling (GDM)</strong>
                    <p>GDM is split into 2 seperate steps. The first step generates a set of possible thresholds for site pairs. The second step takes
                    the selected threshold and finishes the process</p>
                    <p>Start GDM /alaspatial/ws/gdm/step1, POST request.  E.g. http://spatial.ala.org.au/alaspatial/ws/gdm/step1</p>
                    Parameters:
                    <ul>
                        <li>speciesdata - A comma separated set of species data. Header: Longitude, Latitude, SpeciesIndex</li>
                        <li>area - bounding area in Well Known Text (WKT) format.  E.g.  “POLYGON((118 -30,146 -30,146 -11,118 -11,118 -30))”.</li>
                        <li>envlist – a list of environmental layers as colon separated short names.  E.g. “bioclim_bio1:bioclim_bio12:bioclim_bio2”.
                            <ul>
                                <li>List of analysis valid environmental layer short names <a href="http://spatial.ala.org.au/alaspatial/ws/spatial/settings/layers/environmental/string">here</a>. These are a subset of all layers <a href="http://spatial.ala.org.au/layers.">here</a></li>
                            </ul>
                        </li>
                        <li>res - optional paramter to specify the resolution for the maxent model.  Defaults to "0.01" when no value is provided.</li>
                       <!-- <li>taxacount - collected in step 1 but never used in step 2</li> -->
                    </ul>
                    <br />
                    <p>Returns: analysis id and a threshold in a CSV format.</p>
                    <p>Step 2: /alaspatial/ws/gdm/step2, POST request.  E.g. http://spatial.ala.org.au/alaspatial/ws/gdm/step2</p>
                    Parameters:
                    <ul>
                        <li>pid - A unique ID generated in Step 1</li>
                        <li>cutpoint - The threshold value generated in Step 1 and selected by the user.</li>
                        <li>useDistance - Use geographic distance as additional predictor.</li>
                        <li>weighting - How the sites weighted (either equally (0) or by number of species (1)).</li>
                        <li>useSubSample - Sample size.</li>
                        <li>sitePairsSize - Set if 'useSubSample' is set to true .</li>
                    </ul>
                    <br />
                    <p>Returns: analysis id with which you can pull up the generated data and information.</p>
                </li>
                <li><strong>Sites by Species, Occurrence density, Species richness</strong>
                    <p>Start with /alaspatial/ws/sitesbyspecies, POST request.  E.g. http://spatial.ala.org.au/alaspatial/ws/sitesbyspecies</p>
                    Parameters, must include at least one of the optional "Types" parameters:
                    <ul>
                        <li>speciesq - The query to perform to get the species data from the biocache.  E.g. “genus:Macropus”.</li>
                        <li>qname - Data name that appears in the output.  E.g. “Macropus”.</li>
                        <li>area - Bounding area in Well Known Text (WKT) format.  E.g.  “POLYGON((118 -30,146 -30,146 -11,118 -11,118 -30))”.</li>
                        <li>bs - The URL to the biocache service. E.g "http://biocache.ala.org.au/ws"</li>
                        <li>gridsize - Size of output grid cells in decimal degrees.  E.g. "0.1"</li>
                        <li>movingaveragesize - Size of output moving average window for occurrence density and species density layers.  E.g. for a 9x9 grid cell window use "&amp;movingaveragesize=9"</li>
                        <li>areasqkm - (optional) the total squre km area represented by the WKT on the area. This param is only used in the metadata.</li>
                        <li>Types:
                        <ul>
                            <li>sitesbyspecies - (optional) Include this parameter to produce a sites by species list.  E.g. "&amp;sitesbyspecies=1"</li>
                            <li>occurrencedensity - (optional) Include this parameter to produce an occurrence density layer.  E.g. "&amp;occurrencedensity=1"</li>
                            <li>speciesdensity - (optional) Include this parameter to produce a species richness layer.  E.g. "&amp;speciesdensity=1"</li>
                        </ul>
                        </li>

                    </ul>
                    <br />
                    <p>Returns: analysis id.  E.g. “123”.</p>
                </li>
                <li><strong>Monitor Analysis</strong>
                    <ul>
                        <li>/alaspatial/ws/job?pid=&lt;analysis id&gt; - returns the status and progress of a job.
                            E.g. http://spatial.ala.org.au/alaspatial/ws/jobs/state?pid=123
                            <br />
                            state - will be either "WAITING", "RUNNING", "SUCCESSFUL", "FAILED", "CANCELLED".  When it is "SUCESSFUL" the results can be retrieved.
                        </li>
                        <!-- NQ 2013-12-06: Added these for completeness not sure if we wish to advertise the existence.
                        <li>/alaspatial/ws/jobs/listrunning - list all the running jobs</li>
                        <li>/alaspatial/ws/jobs/listfinished - list all the jobs that are finished</li>
                        <li>/alaspatial/ws/jobs/listwaiting - lists all the jobs that are waiting</li>
                        <li>/alaspatial/ws/jobs/image?pid=&lt;analysis id&gt; - returns the file path for the image associated with the supplied PID</li>
                        -->
                        <li>/alaspatial/ws/jobs/inputs?pid=&lt;analysis id&gt; - lists the inputs that have been supplied to the job</li>
                        <li>/ws/jobs/cancel?pid=&lt;analysis id&gt; - cancel a job based on the PID .  E.g. http://spatial.ala.org.au/alaspatial/ws/jobs/cancel?pid=123
                            <br />returns nothing if successful or "job does not exist"</li>
                    </ul>
                </li>
                <br />
                <li><strong>Retrieving Results</strong>
                    <ul>
                        <li>/alaspatial/ws/download/&lt;analysis id&gt;.  E.g. .  E.g. http://spatial.ala.org.au/alaspatial/ws/download/123
                            <br />downloads the zipped output of "SUCCESSFUL" analysis.</li>
                        <li>ALOC WMS service for the layer is /geoserver/wms?service=WMS&amp;version=1.1.0&amp;request=GetMap&amp;layers=ALA:aloc_&lt;analysis id&gt;&amp;styles=alastyles&amp;FORMAT=image%2Fpng.
                            <br /> E.g. http://spatial.ala.org.au/geoserver/wms/reflect?layers=ALA:aloc_123&amp;height=200&amp;width=200
                        <li>Maxent WMS service for the layer is /geoserver/wms?service=WMS&amp;version=1.1.0&amp;request=GetMap&amp;layers=ALA:species_&lt;analysis id&gt;&amp;styles=alastyles&amp;FORMAT=image%2Fpng.
                            <br />E.g. http://spatial.ala.org.au/geoserver/wms/reflect?layers=ALA:species_123&amp;height=200&amp;width=200
                        </li>
                        <li>Occurrence Density WMS service for the layer is /geoserver/wms?service=WMS&amp;version=1.1.0&amp;request=GetMap&amp;layers=ALA:odensity_&lt;analysis id&gt;&amp;styles=alastyles&amp;FORMAT=image%2Fpng.
                            <br />E.g. http://spatial.ala.org.au/geoserver/wms/reflect?layers=ALA:odensity_123&amp;height=200&amp;width=200
                        </li>
                        <li>Species Richness WMS service for the layer is /geoserver/wms?service=WMS&amp;version=1.1.0&amp;request=GetMap&amp;layers=ALA:srichness_&lt;analysis id&gt;&amp;styles=alastyles&amp;FORMAT=image%2Fpng.
                            <br />E.g. http://spatial.ala.org.au/geoserver/wms/reflect?layers=ALA:srichness_123&amp;height=200&amp;width=200
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
    </div><!--inner-->


</div> <!-- content -->

<%@include file="common/bottom.jsp" %>
