#import <AudioToolbox/AudioToolbox.h>

typedef enum {
	AudioFileTypeMp3,
	AudioFileTypeWav,
//	AudioFileTypeWma,
} AudioFileType;

typedef enum {
	ConversionFormatAdpcm = kAudioFormatAppleIMA4,
	ConversionFormatPcm = kAudioFormatLinearPCM,
//	ConversionFormatWindowsMedia,
//	ConversionFormatXma,
} ConversionFormat;

typedef enum {
	ConversionQualityLow,
	ConversionQualityMedium,
	ConversionQualityBest,
} ConversionQuality;