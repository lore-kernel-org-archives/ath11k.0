Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB24AC02192
	for <ath11k@archiver.kernel.org>; Wed,  5 Feb 2025 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sj6F6ZKeHJ6Mw/TnnxhIcej0HEyhyfkLEbgVCSDldek=; b=v+x2CXJwE8YjmfVn+OYn3dVezl
	Y8xUkPQrI/i4krvCVvA3T0rf3hTnoiNaHQECZu/qNRQm4oGslry3yLx/6LTtQC+SXr+TMEoCF4/4N
	LnSvZZaIWzV8tTiREiWs+mSpegcY/aWbdPGC5kt25b2C3fJvHFAwqApse4uIF3sb7m7wXOXrnc83w
	Oxdatl+VVbibxOwOWvKZoP+52vUxXxakr7ZKHGDljNME3we7nPr/EsXpBYr7SRuRMrtKabT00EJjR
	lyC9RlVcuoofaA+FTjmJBc9CsSuDDHXKWVgednzkxFxLHS5x8Z87VuvMp65stcDcg1nrJdlSxjkax
	gdtgfwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkQM-00000004JNr-1VXw;
	Wed, 05 Feb 2025 18:46:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkQI-00000004JMu-1Ydz
	for ath11k@lists.infradead.org;
	Wed, 05 Feb 2025 18:46:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVmb1025922
	for <ath11k@lists.infradead.org>; Wed, 5 Feb 2025 18:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sj6F6ZKeHJ6Mw/TnnxhIcej0HEyhyfkLEbgVCSDldek=; b=TD0Gr5fuE47Dvwb0
	L4QE6XzMn2Zi3Wxl2FJl3VZ6wyi5nBKabiHap/NpwmRuM8AN0d2fJc6US9EbRccp
	ok8ALioyexoRExxhKAGrRIuM83d28dwPzZzoscYsLthKIBOsHdbIoNcXJkIAmkxW
	S5fW0X+IofURjgNJ864IvEb74/qJsnvrkCrsjXjOCSLt0FyPT5qpOYYTgV9q3DDk
	XhMDiPZA++L47oPap9N50xvKM9omDQKuxit+kEElia8nIa7Ke9AznS8ZyDgecRZ2
	7fFRiQ6tvlh5wCSrOZHC9PrI0+hCQHLpYlTrZU+CUNcwv4qdD+u5vxKTvLPsHGlS
	xJdFMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m9txgnwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 18:46:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21661949f23so4041625ad.3
        for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 10:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781213; x=1739386013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj6F6ZKeHJ6Mw/TnnxhIcej0HEyhyfkLEbgVCSDldek=;
        b=BDobA9CEeDCw+lc5a3jwlvKE2DLOYuAZDEgY14rIarEZziHxGE208KAUSUV/FD9RvI
         2KQbA/g4Em3VR80+sY68NTehl8ktSXJBPJyjEYSZZOw5AD0YtHGVxbmltU0T9kbqsvMN
         zVIA45qV+OWzJMyJL+xwbxd7tAn6Z+W6U+swCKPCnBddOA4qBo/HJjyCdXrwqaT5sq75
         Tp87dbSrYMBl4g2tgjqn1zUVwgOzlGrp1EsvMbsk6R7ARNyBucn4ZRgUFPCzOVWRtNTS
         HBCpL7dPlb7+nk6GALNGBIQn7bASCuf8QSzMm1lIfVhqn8e9ycQnriL3H6u6iqEwSfg/
         PEYw==
X-Forwarded-Encrypted: i=1; AJvYcCVsMxQpG1nJVezE/b/luetMtoKM+y9WYUXeEF8C+zA7EMNoVu4KVxfitaq2a05zBO2isA418xM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeahEgBEJv+t4hcclOdyAhCL07tz0Ci2+Nm/R564tsTgAfK7wl
	5HXfmeV4GClZe9pWq3RDuck/ULafxRGHixlrIa1cE0bJbWResxtiTfSFgUVcAEOWumLCQGlYWSr
	DugmfnsD6gerhEYxEosdipWfZ41sWA6wFdawervJ7RHMyVrx/jWD0I3H0PWgc
X-Gm-Gg: ASbGncstxmQ02LOrK0W0HWCs2eAgUIdd8XqPTCAqyMbH9xn2eZTIyJe6ldoKD5zPxlo
	bV55XHdT2LvFzLy28SWsFckqD/4GZFH9ZmnCg5brwDe9lgSyckbhSfIS0A7DX4t2pKlNOsxwkzL
	oUF+zR9sWhBdwMsNzSU9qiElDxWWZTpmYmP/fjPw3stu0w0FpbtHUVLh/qoY1rEeT+zw3clRh8O
	T1TkgvAYpJT/ew/rHFaNflZTvBRMcdSpjebYU29m40tKxbSXJHj/Ds8HAxY5GHsiecXDEiqpNvT
	q5gjq3f7+pGIqpvptQR9oV+Ru9mCrE723dmdqfpMWb24sbP+doi2F/mdVl4L
X-Received: by 2002:a17:902:e54c:b0:21f:baa:80be with SMTP id d9443c01a7336-21f17f1169amr56628905ad.46.1738781212817;
        Wed, 05 Feb 2025 10:46:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwRK2NsYyM2JwSr4IHxg7W6Lo0NOBwpVwZ0wesGLqvrA2lJK8DZBsuuWlgLMZJNcdh4vSsdg==
X-Received: by 2002:a17:902:e54c:b0:21f:baa:80be with SMTP id d9443c01a7336-21f17f1169amr56628595ad.46.1738781212421;
        Wed, 05 Feb 2025 10:46:52 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad4fdb4bb86sm3530031a12.43.2025.02.05.10.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 10:46:52 -0800 (PST)
Message-ID: <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 10:46:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF,
 v2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2dXB2QVFTf1PHa5dmJ9unx1ji8IO15vA
X-Proofpoint-GUID: 2dXB2QVFTf1PHa5dmJ9unx1ji8IO15vA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=915 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_104654_418348_08DDDA14 
X-CRM114-Status: GOOD (  14.87  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
> Hello,
> 
> With the hopes of getting this into the February linux-firmware release:
> Please add the following BDF file to the archive.
> 
> Changes since v1: added regdb from the same archive
> 
> * description for what hardware this is
>   - Qualcomm Robotics RB3 gen2 platform
>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> * origin of the board file
>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> release, licenced under LICENSE.qcom
> * ids to be used with the board file
>   - WCN6750 / hw 1.0
>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> * md5sum of each new board file to add
> 
> 39b270f43cb6d733cde607bf2b23e2be
> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> bfbd247fe961dffc4e7fb413703fb284
> regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> 
> 

staged...
https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b

