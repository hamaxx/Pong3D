//
//  XImporter.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "XImporter.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.Pipeline.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"
#import "XImporterReader.h"

@interface XImporter ()

- (void) readHeaderWithReader:(XImporterReader*)reader;
- (void) readTemplatesWithReader:(XImporterReader*)reader;
- (id) readTemplateWithReader:(XImporterReader*)reader;
- (NodeContent*) readFrameTemplateWithReader:(XImporterReader*)reader;
- (void) readFrameTransformMatrixTemplateWithReader:(XImporterReader*)reader;
- (MeshContent*) readMeshTemplateWithReader:(XImporterReader*)reader;
- (void) readMeshTextureCoordsTemplateWithReader:(XImporterReader*)reader;
- (void) readMeshMaterialListTemplateWithReader:(XImporterReader*)reader;
- (void) readMeshNormalsTemplateWithReader:(XImporterReader*)reader;
- (MaterialContent*) readMaterialTemplateWithReader:(XImporterReader*)reader;
- (void) readTextureFilenameTemplateWithReader:(XImporterReader*)reader;

- (Matrix*) readMatrix4x4TemplateWithReader:(XImporterReader*)reader;
- (Vector3*) readVectorTemplateWithReader:(XImporterReader*)reader;
- (NSArray*) readMeshFaceTemplateWithReader:(XImporterReader*)reader;
- (Vector2*) readCoords2dTemplateWithReader:(XImporterReader*)reader;
- (Vector4*) readColorRGBATemplateWithReader:(XImporterReader*)reader;
- (Vector3*) readColorRGBTemplateWithReader:(XImporterReader*)reader;

@end


@implementation XImporter

- (NodeContent *) importFile:(NSString *)filename {
	NSError *error = nil;
	NSString *input = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:&error];
	if (error) {
		NSLog(@"%@", filename);
		NSLog(@"%@", [error localizedDescription]);
		[NSException raise:@"InvalidArgumentException" format:@"Could not load file %@", filename];
	}
	
	XImporterReader *reader = [[[XImporterReader alloc] initWithInput:input] autorelease];
	reader.root.identity.sourceFilename = filename;
	
	[self readHeaderWithReader:reader];
	[reader skipWhitespace];
	[self readTemplatesWithReader:reader];
	
	NodeContent *result = [reader.root retain];
	return [result autorelease];
}

- (void) readHeaderWithReader:(XImporterReader *)reader {
	[reader skipMany:17];
}

- (void) readTemplatesWithReader:(XImporterReader *)reader {
	while ([reader isValid] && ![reader isAtClosingParanthesis]) {
		[self readTemplateWithReader:reader];
		[reader skipWhitespace];
	}
}

- (id) readTemplateWithReader:(XImporterReader *)reader {	
	id result = nil;
	NSString *name = nil;
	
	if ([reader isAtOpeningParanthesis]) {
		// We are reading a named resource.
		[reader skipNextNonWhitespace];
		name = [reader readWord];
		[reader skipToClosingParanthesis];
		result = [reader.namedData objectForKey:name];
	} else {
		// We are reading a new template.
		NSString *template = [reader readWord];
		[reader skipWhitespace];
		if (![reader isAtOpeningParanthesis]) {
			name = [reader readWord];
			[reader skipToOpeningParanthesis];
		}
		[reader skipNextNonWhitespace];
		
		// We are now at the first character of the content.
		if ([template isEqual:@"Frame"]) {
			NodeContent *frame = [self readFrameTemplateWithReader:reader];
			frame.name = name;
		} else if ([template isEqual:@"FrameTransformMatrix"]) {
			[self readFrameTransformMatrixTemplateWithReader:reader];
		} else if ([template isEqual:@"Mesh"]) {
			MeshContent *mesh = [self readMeshTemplateWithReader:reader];
			mesh.name = name;
		} else if ([template isEqual:@"MeshTextureCoords"]) {
			[self readMeshTextureCoordsTemplateWithReader:reader];
		} else if ([template isEqual:@"MeshMaterialList"]) {
			[self readMeshMaterialListTemplateWithReader:reader];
		} else if ([template isEqual:@"MeshNormals"]) {
			[self readMeshNormalsTemplateWithReader:reader];
		} else if ([template isEqual:@"Material"]) {
			MaterialContent *material = [self readMaterialTemplateWithReader:reader];
			material.name = name; 
			result = material;
		} else if ([template isEqual:@"TextureFilename"]) {
			[self readTextureFilenameTemplateWithReader:reader];
		} else {
			// Unknown template, skip to closing parenthesis.
			[reader skipToClosingParanthesisForCurrentLevel];
		}
	}
	
	[reader skipNextNonWhitespace];
	
	if (name && result) {
		[reader.namedData setObject:result forKey:name];
	}	
	
	return result;
}

/*
 template Frame {
 [...]
 }
 */
- (NodeContent *) readFrameTemplateWithReader:(XImporterReader *)reader {
	NodeContent *frame = [[[NodeContent alloc] init] autorelease];
	
	NodeContent *parent = (NodeContent*)[reader currentContent];
	[parent.children add:frame];
	[reader pushContent:frame];
	
	// Template is just a list of templates (usually FrameTransformMatrix and a Mesh)
	[self readTemplatesWithReader:reader];
	
	[reader popContent];
	return frame;
}

/*
 template FrameTransformMatrix {
 Matrix4x4 frameMatrix;
 }
 */
- (void) readFrameTransformMatrixTemplateWithReader:(XImporterReader *)reader {
	NodeContent *frame = (NodeContent*)[reader currentContent];
	
	frame.transform = [self readMatrix4x4TemplateWithReader:reader];
	[reader skipNextNonWhitespace];
}

/*
 template Mesh {
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
 }
 */
- (MeshContent *) readMeshTemplateWithReader:(XImporterReader *)reader {
	NodeContent *frame = (NodeContent*)[reader currentContent];
	
	MeshContent *mesh = [[[MeshContent alloc] init] autorelease];
	[frame.children add:mesh];
	
	[reader pushContent:mesh];
	
	GeometryContent *geometry = [[[GeometryContent alloc] initWithPositions:mesh.positions] autorelease];
	[mesh.geometry add:geometry];
	
	// Vertices
	int vertexCount = [reader readInt];
	[reader skipNextNonWhitespace];
	for (int i = 0; i < vertexCount; i++) {
		Vector3 *vertex = [self readVectorTemplateWithReader:reader];
		
		// Change from left handed to right handed system.
		//vertex.z = -vertex.z;
		
		[reader skipNextNonWhitespace];
		
		[mesh.positions add:vertex];
		[geometry.vertices add:i];
	}
	
	// Indices
	int indexCount = [reader readInt];
	[reader skipNextNonWhitespace];
	for (int i = 0; i < indexCount; i++) {
		NSMutableArray *indices = (NSMutableArray*)[self readMeshFaceTemplateWithReader:reader];
		[reader skipNextNonWhitespace];
		
		// Swap two indices to change orientation since it was destroyed with handedness change.
		/*id tmp = [indices objectAtIndex:0];
		[indices replaceObjectAtIndex:0 withObject:[indices objectAtIndex:1]];
		[indices replaceObjectAtIndex:1 withObject:tmp];
		*/
		[geometry.indices addRange:indices];
	}
	
	// Vertex channels
	[self readTemplatesWithReader:reader];
	
	[reader popContent];
	return mesh;
}

/*
 template MeshTextureCoords {
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
 }
 */
- (void) readMeshTextureCoordsTemplateWithReader:(XImporterReader *)reader {
	GeometryContent *geometry = [((MeshContent*)[reader currentContent]).geometry itemAt:0];
	
	NSString *channelName = [VertexChannelNames textureCoordinateWithUsageIndex:0];
	
	[geometry.vertices.channels addChannelWithName:channelName elementType:[Vector2 class] channelData:nil];
	VertexChannel *textureCoords = [geometry.vertices.channels itemWithName:channelName];
	
	int coordsCount = [reader readInt];
	[reader skipNextNonWhitespace];
	for (int i = 0; i < coordsCount; i++) {
		Vector2 *coords = [self readCoords2dTemplateWithReader:reader];
		[reader skipNextNonWhitespace];
		
		[textureCoords setItem:coords at:i];
	}
}

/*
 template MeshMaterialList {
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
 }
 */
- (void) readMeshMaterialListTemplateWithReader:(XImporterReader *)reader {
	GeometryContent *geometry = [((MeshContent*)[reader currentContent]).geometry itemAt:0];

	int materialCount = [reader readInt];
	[reader skipNextNonWhitespace];
	
	int faceCount = [reader readInt];
	[reader skipNextNonWhitespace];
	
	for (int i = 0; i < faceCount; i++) {
		/*int materialIndex =*/ [reader readInt];
		[reader skipNextNonWhitespace];
	}
	
	for (int i = 0; i < materialCount; i++) {
		MaterialContent *material = [self readTemplateWithReader:reader];	
		geometry.material = material;				
	}
}

/*
 template MeshNormals {
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
 }
 */
- (void) readMeshNormalsTemplateWithReader:(XImporterReader *)reader {
	GeometryContent *geometry = [((MeshContent*)[reader currentContent]).geometry itemAt:0];
	
	PositionCollection *normals = [[[PositionCollection alloc] init] autorelease];
	
	NSString *channelName = [VertexChannelNames normal];
	
	[geometry.vertices.channels addChannelWithName:channelName elementType:[Vector3 class] channelData:nil];
	VertexChannel *normalChannel = [geometry.vertices.channels itemWithName:channelName];
	
	int normalCount = [reader readInt];
	[reader skipNextNonWhitespace];
	for (int i = 0; i < normalCount; i++) {
		Vector3 *normal = [self readVectorTemplateWithReader:reader];
		[reader skipNextNonWhitespace];
		
		[normals add:normal];
	}
	
	int faceCount = [reader readInt];
	[reader skipNextNonWhitespace];
	for (int i = 0; i < faceCount; i++) {
		NSArray *indices = [self readMeshFaceTemplateWithReader:reader];
		[reader skipNextNonWhitespace];
		
		for (int j = 0; j < [indices count]; j++) {
			int vertexIndex = [((NSNumber*)[geometry.indices itemAt:i*3+j]) intValue];
			int normalIndex =  [((NSNumber*)[indices objectAtIndex:j]) intValue];
			
			[normalChannel setItem:[normals itemAt:normalIndex] at:vertexIndex];
		}
	}
}

/*
 template Material {
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
 }
 */
- (MaterialContent *) readMaterialTemplateWithReader:(XImporterReader *)reader {
	BasicMaterialContent *material = [[[BasicMaterialContent alloc] init] autorelease];
		
	[reader pushContent:material];
	
	Vector4 *faceColor = [self readColorRGBATemplateWithReader:reader];
	[reader skipNextNonWhitespace];
	float power = [reader readFloat];
	[reader skipNextNonWhitespace];
	Vector3 *specularColor = [self readColorRGBTemplateWithReader:reader];
	[reader skipNextNonWhitespace];
	Vector3 *emissiveColor = [self readColorRGBTemplateWithReader:reader];
	[reader skipNextNonWhitespace];
	
	material.diffuseColor = [Vector3 vectorWithX:faceColor.x y:faceColor.y z:faceColor.z];
	material.alpha = [NSNumber numberWithFloat:faceColor.w];
	material.specularPower = [NSNumber numberWithFloat:power];
	material.specularColor = specularColor;
	material.emissiveColor = emissiveColor;
	
	[self readTemplatesWithReader:reader];
	
	[reader popContent];
	return material;
}

/*
 template TextureFilename {
 STRING filename;
 }
 */
- (void) readTextureFilenameTemplateWithReader:(XImporterReader *)reader {
	BasicMaterialContent *material = (BasicMaterialContent*)[reader currentContent];
	
	NSString *filename = [reader readQuotedWord];
	ExternalReference *texture = [[[ExternalReference alloc] initWithFilename:filename relativeToContent:reader.root.identity] autorelease];
	
	material.texture = texture;
	
	[reader skipNextNonWhitespace];
}

/*
 template Matrix4x4 {
 array FLOAT matrix[16];
 }
 */
- (Matrix *) readMatrix4x4TemplateWithReader:(XImporterReader *)reader {
	MatrixStruct data;
	for (int i = 0; i < 16; i++) {
		((float*)&data)[i] = [reader readFloat];
		[reader skipNextNonWhitespace];
	}
	return [Matrix matrixWithStruct:&data];
}

/*
 template Vector {
 FLOAT x;
 FLOAT y;
 FLOAT z;
 }
 */
- (Vector3 *) readVectorTemplateWithReader:(XImporterReader *)reader {
	Vector3Struct data;
	for (int i = 0; i < 3; i++) {
		((float*)&data)[i] = [reader readFloat];
		[reader skipNextNonWhitespace];
	}
	return [Vector3 vectorWithStruct:&data];
}

/*
 template MeshFace {
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
 }
 */
- (NSArray*) readMeshFaceTemplateWithReader:(XImporterReader*)reader {
	NSMutableArray *indices = [NSMutableArray array];
	int count = [reader readInt];
	[reader skipNextNonWhitespace];
	for (int i = 0; i < count; i++) {
		[indices addObject:[NSNumber numberWithInt:[reader readInt]]];
		[reader skipNextNonWhitespace];
	}
	return indices;
}

/*
 template Coords2d {
 FLOAT u;
 FLOAT v;
 }
 */
- (Vector2*) readCoords2dTemplateWithReader:(XImporterReader*)reader {
	Vector2Struct data;
	for (int i = 0; i < 2; i++) {
		((float*)&data)[i] = [reader readFloat];
		[reader skipNextNonWhitespace];
	}
	return [Vector2 vectorWithStruct:&data];
	
}

/*
 template ColorRGBA {
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
 }
 */
- (Vector4 *) readColorRGBATemplateWithReader:(XImporterReader *)reader {
	Vector4Struct data;
	for (int i = 0; i < 4; i++) {
		((float*)&data)[i] = [reader readFloat];
		[reader skipNextNonWhitespace];
	}
	return [Vector4 vectorWithStruct:&data];
}

/*
 template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 }
 */
- (Vector3 *) readColorRGBTemplateWithReader:(XImporterReader *)reader {
	Vector3Struct data;
	for (int i = 0; i < 3; i++) {
		((float*)&data)[i] = [reader readFloat];
		[reader skipNextNonWhitespace];
	}
	return [Vector3 vectorWithStruct:&data];
}

@end
