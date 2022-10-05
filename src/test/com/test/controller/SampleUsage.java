package com.test.controller;
/*
 * Copyright 2002-2019 Drew Noakes and contributors
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 *
 * More information about this project is available at:
 *
 *    https://drewnoakes.com/code/exif/
 *    https://github.com/drewnoakes/metadata-extractor
 */


import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.*;

import com.drew.metadata.iptc.IptcReader;
import org.junit.Test;
import lombok.extern.log4j.Log4j;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;

/**
 * Showcases the most popular ways of using the metadata-extractor library.
 * <p>
 * For more information, see the project wiki: https://github.com/drewnoakes/metadata-extractor/wiki/GettingStarted
 *
 * @author Drew Noakes https://drewnoakes.com
 */
@Log4j
public class SampleUsage {


    @Test
    public void test(){
        File file = new File("src/main/resources/TestImg/TEST.JPG");

        // There are multiple ways to get a Metadata object for a file

        //
        // SCENARIO 1: UNKNOWN FILE TYPE
        //
        // This is the most generic approach.  It will transparently determine the file type and invoke the appropriate
        // readers.  In most cases, this is the most appropriate usage.  This will handle JPEG, TIFF, GIF, BMP and RAW
        // (CRW/CR2/NEF/RW2/ORF) files and extract whatever metadata is available and understood.
        //


        try {
            Metadata metadata = ImageMetadataReader.readMetadata(file);
            ExifSubIFDDirectory Directory = metadata.getFirstDirectoryOfType(ExifSubIFDDirectory.class);
            ExifIFD0Directory Directory2 = metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);


            if (Directory != null) {

                Double Aperture = Directory.getDoubleObject(Directory.TAG_FNUMBER);
                //Double longitude = Directory.getDoubleObject(Directory.TAG_LONGITUDE);
                Date date = Directory.getDate(ExifSubIFDDirectory.TAG_DATETIME_ORIGINAL);
                Double ISO = Directory.getDoubleObject(Directory.TAG_ISO_EQUIVALENT);
                Double ExposureTime = Directory.getDoubleObject(Directory.TAG_EXPOSURE_TIME);
                Double FocalLength = Directory.getDoubleObject(Directory.TAG_FOCAL_LENGTH);
                Double ShutterSpeed = Directory.getDoubleObject(Directory.TAG_SHUTTER_SPEED);
                Double Width = Directory.getDoubleObject(Directory.TAG_EXIF_IMAGE_WIDTH);
                Double Height = Directory.getDoubleObject(Directory.TAG_EXIF_IMAGE_HEIGHT);
                String Model = Directory2.getString(Directory2.TAG_MODEL);

                log.info("Aperture: " + Aperture + "     Date: " + date  + "     ISO: " + ISO +
                        " Modle: " + Model + "     ExposureTime: " + ExposureTime + "     FocalLength: " + FocalLength +
                        " ShutterSpeed: " + ShutterSpeed + "     Width: " + Width + "     Height: " + Height);
            }

           log.info(metadata.getDirectories() + "Using ImageMetadataReader");

        } catch (ImageProcessingException e) {
            //print(e);
        } catch (IOException e) {
            //print(e);
        }

        //
        // SCENARIO 2: SPECIFIC FILE TYPE
        //
        // If you know the file to be a JPEG, you may invoke the JpegMetadataReader, rather than the generic reader
        // used in approach 1.  Similarly, if you knew the file to be a TIFF/RAW image you might use TiffMetadataReader,
        // PngMetadataReader for PNG files, BmpMetadataReader for BMP files, or GifMetadataReader for GIF files.
        //
        // Using the specific reader offers a very, very slight performance improvement.
        //
        try {
            Metadata metadata = JpegMetadataReader.readMetadata(file);

            log.info(metadata + "Using JpegMetadataReader");
        } catch (JpegProcessingException e) {
            //print(e);
        } catch (IOException e) {
            //print(e);
        }

        //
        // APPROACH 3: SPECIFIC METADATA TYPE
        //
        // If you only wish to read a subset of the supported metadata types, you can do this by
        // passing the set of readers to use.
        //
        // This currently only applies to JPEG file processing.
        //
        try {
            // We are only interested in handling
            Iterable<JpegSegmentMetadataReader> readers = Arrays.asList(new ExifReader(), new IptcReader());

            Metadata metadata = JpegMetadataReader.readMetadata(file, readers);

            log.info(metadata + "Using JpegMetadataReader for Exif and IPTC only");
        } catch (JpegProcessingException e) {
            //print(e);
        } catch (IOException e) {
            //print(e);
        }
    }

    /**
     * Write all extracted values to stdout.
     */
}