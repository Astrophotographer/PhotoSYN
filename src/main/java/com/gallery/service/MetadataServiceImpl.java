package com.gallery.service;

import com.gallery.domain.MetadataDTO;
import com.gallery.mapper.GalleryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.*;


import com.drew.metadata.iptc.IptcReader;
import lombok.extern.log4j.Log4j;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;

@Service
@Log4j
public class MetadataServiceImpl implements MetadataService {

    @Autowired
    private GalleryMapper galleryMapper;


    @Override
    public MetadataDTO checkMetadata(String imgpath) {
        log.info(imgpath);
        //MetadataService metadataService = new MetadataServiceImpl();
        MetadataDTO metadataDTO = new MetadataDTO();
        //String imgPath = imgpath;
        File file = new File(imgpath);

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
            log.info("---------------1----------------");

            if (Directory != null) {
                log.info("---------------2----------------");
                Double Aperture = Directory.getDoubleObject(Directory.TAG_FNUMBER);
                Date date = Directory.getDate(ExifSubIFDDirectory.TAG_DATETIME_ORIGINAL);

                Double ISO = Directory.getDoubleObject(Directory.TAG_ISO_EQUIVALENT);
                Double FocalLength = Directory.getDoubleObject(Directory.TAG_FOCAL_LENGTH);
                Double ShutterSpeed = Directory.getDoubleObject(Directory.TAG_SHUTTER_SPEED);
                Double ShutterSpeed2 = Directory.getDoubleObject(Directory.TAG_EXPOSURE_TIME);
                Double Width = Directory.getDoubleObject(Directory.TAG_EXIF_IMAGE_WIDTH);
                Double Height = Directory.getDoubleObject(Directory.TAG_EXIF_IMAGE_HEIGHT);
                String LensModel = Directory.getString(Directory.TAG_LENS_MODEL);
                log.info("---------------3----------------");

                String CameraModel = Directory2.getString(Directory2.TAG_MODEL);

                // 값 DTO에 저장
                metadataDTO.setM_APERTURE(Aperture);
                metadataDTO.setM_DATE(date);
                metadataDTO.setM_ISO(ISO);
                metadataDTO.setM_FLENGTH(FocalLength);
                metadataDTO.setM_SHUTTERSPEED(ShutterSpeed2);
                if(Width > 3000){
                    metadataDTO.setM_IMGHQLY(Width);
                }else metadataDTO.setM_IMGLQLY(Width);

                metadataDTO.setM_IMGCAMERA(CameraModel);
                metadataDTO.setM_IMGLENS(LensModel);

                log.info(metadataDTO + "metadataDTO");

                //todo DB에 저장 (이거아니고, 나중에 사용자가 저장버튼 누르면 그때 디비에 저장 )
                //int MetadataUploadResult = galleryMapper.insertMetadata(metadataDTO);
                log.info("------------------------------------------------------------------------------");
                //log.info("MetadataUploadResult:" + MetadataUploadResult);   //성공시 1 출력
                log.info("---------------4----------------");

                log.info("Aperture: " + Aperture + "  Date: " + date + "     ISO: " + ISO +
                        " Modle: " + CameraModel   + "     FocalLength: " + FocalLength +  " lens: " + LensModel + "ExposureTime: " + ShutterSpeed2 +
                        " ShutterSpeed: " + ShutterSpeed + "     Width: " + Width + " Height: " + Height);
            }

            log.info(metadata.getDirectories() + "Using ImageMetadataReader");

        } catch (ImageProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        log.info("---------------5---------------");

        try {
            Metadata metadata = JpegMetadataReader.readMetadata(file);
            log.info("---------------6----------------");
            log.info(metadata + "Using JpegMetadataReader");
        } catch (JpegProcessingException e) {
            e.printStackTrace();
            log.info("---------------7----------------");
        } catch (IOException e) {
            e.printStackTrace();
        }


        try {
            // We are only interested in handling
            Iterable<JpegSegmentMetadataReader> readers = Arrays.asList(new ExifReader(), new IptcReader());

            Metadata metadata = JpegMetadataReader.readMetadata(file, readers);

            log.info(metadata + "Using JpegMetadataReader for Exif and IPTC only");
        } catch (JpegProcessingException e) {
            log.info("---------------8----------------");
            e.printStackTrace();
        } catch (IOException e) {
            log.info("---------------9----------------");
            e.printStackTrace();
        }
        log.info("---------------10----------------");
        return metadataDTO;
    }



    @Override
    public int insertMetadata(MetadataDTO metadataDTO) {return galleryMapper.insertMetadata(metadataDTO);}

    @Override
    public void getMetadata(Long G_NO) {

    }

    @Override
    public boolean updateMetadata(MetadataDTO metadataDTO) {
        return false;
    }
}

