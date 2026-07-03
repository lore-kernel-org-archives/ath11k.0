Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A2C43458
	for <ath11k@archiver.kernel.org>; Fri,  3 Jul 2026 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=; b=ze4jJ6x4zhdOrnFYuAqBm9rW7p
	8LOHWfrIVW4MpFx0Xj9Cs57hxD+nxg6AQyLhw10gkAzGzrRr0Xa9R1tfO7dDe6e3Q5DOOZHOuzR6v
	lkC6kTz09CvfQhdP7ERFX064n9e0pQlz8AXMFW0A+w/dN3T07gkOenS0bZ8N3jZ9RvWjdK9hsCU9P
	iJ8Z8xBt1bR6H/TkRcdwdcVOVl9KouDkV8vWUdNNwhMY0fQEMtOvTUgfls1B3hh2sQ+yKa8P8jbXR
	CQICVSsLbwMZN6Y6ehM0p5ahD86lJsR8ozfuR2nYoKsw+vSy/AoRopQ6RK74B/u+YuneNoZ5Ribro
	5e94kzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXw3-00000006Eic-19se;
	Fri, 03 Jul 2026 07:03:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXvw-00000006Efd-2g0P
	for ath11k@lists.infradead.org;
	Fri, 03 Jul 2026 07:03:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfBr2994880
	for <ath11k@lists.infradead.org>; Fri, 3 Jul 2026 07:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=; b=WWd0i0kcRIEyUsuH
	fPgilMcZpwwOfIGNiDt87MQFpBKCEpo/lImkJM4J6gZPt0GlxSrVCrF7FkWnW9Pa
	Wt1FYhYNi2UklCr/Y8DFS6gXyG0tvKes9JX3ATrjOpsD+81N7YiRey8HokFutCfG
	yVMkaw3qgdx0KSS2sIZzyFHmD7TqPYhS1WNUpn5QOlEAu9GO5lj1AgrqL0KXOhRe
	r2y6YBnLKivfsb3D6qFac3xvH882B0oAyVmJDEueMWS5fyGOWl4XQ5xpaPlsRuBo
	jdhOm20hv4YUm2wLOYXbhWd4r3mzjSpOdgLBaBlYEcYaHXW/QewYS0yZBiry19RS
	6/8KHQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n14jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Jul 2026 07:03:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso563248a12.3
        for <ath11k@lists.infradead.org>; Fri, 03 Jul 2026 00:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062211; x=1783667011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=;
        b=HFX5neoIEAMhdhihj5Zkidt0uoxJ6NB1qS3ViJV8/YCJ5Xrcq07n3T96fly79a+dYM
         JbAOHwAvvmF6xQiK3cKrf6zvGkx7bh/Rp32iwoVvfVQHlPuSrJJPdXq3usmNYggGwLCY
         PRN2BbF64Pmp3GomTGyQKFQWXpfu4imLiZNbuKQ4SNZrWHsYVSSj0As/4Vr91+WMRoNG
         DLZQEwmh3Dm/tzIoeB+AYAAG1zXllhMksYFPg2C+TPPOuhjXbtsAY9ReK7UPgQl8K9I2
         IrYybHQPXee7EXBtqQW17Tr0U7vYHWWVzOcjWuBQLgN9HrN5NR5+uTpCX5u9c+dShcsT
         qD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062211; x=1783667011;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=;
        b=jBmHjWv0dQUv7gegyld4k0sP8MPNryH1FLs1jvKfdAhVLtA0FVF+/4FSrm2wbTQckn
         x5ymkyNJVC8oMIn1F8l63NHD2S0sPkTymB0Eih4yhD1xCr8s3tgQN7V355lWtc7p2VeU
         LlbHpyzowiqNuwhHaoDDo6EpEsjt4x++VvV/jdxthL1AUDYol0IqnmpGY8o9tP67q5mo
         iR3CQFBpl3mCqOqJOxkQAhOx95dFFtMgYTC5CpONoasFCkCR9fYCDc3VSJvwlqRwMK+L
         c5RTV86lFXyw8QRyVZ1zTE87VSZRwz647b8OWMzrbmfhwSU3z5LqxnAw1CIwSXSWsIin
         m7GA==
X-Forwarded-Encrypted: i=1; AFNElJ9oXVz5I1F3OCddgs+QYpU1CitESpf3qRL0rJTJ6oeVbP+aFSpxqrjD4U+xD+ZF+w1Hhoi2Ki8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6jslu4v82aXqIe32EPd3hr2c3oW32PUqTqiGKNlOlKw2kiByl
	3Gdhv7c+XRpO5p6fTbs2iQ1db5yFzBbhjAU8oqTPUnZkVCIJhERcSXdbAciUZIoCdRq0EO1Hgbu
	o2gHUileNjQYGBHm6B76Z37JFUvqO449JGuV7a4aDZn640hq2ZgcY8HfvZEyYe+pC
X-Gm-Gg: AfdE7clcmW4R4EsNZOnqIMBmhQ+LHgTuWdILN2p92G46h8a6MxfNokVHOmIawxFpphV
	3py0arhHALpJ8M5Ehhy0s+GHF54UQ14OMwBipwU4+DGHE5Xh/DUNFF8dkvB4oFW4bEY4HUm8iHR
	AFXPoTLp5q5yLdW4H1tdNAg8Q+ruzRTgsgi56ebUwJFHZl8hiWsaAvcpmxq+Od9gH6vvO/3/xV6
	TNd+2Y2DHsnskRjT9EQ1sJIBas9dbRh0n2RjLcVFy2JfQLOHsKZIyZIPxSC+HV5SxVd+TvdpXFr
	NhTCbtcd8j/Rz9n4ENE46nPWeg0gcfgLVpg+rzM3NSffiGsPLYVoA48T9jdACSJHjq871i+YStv
	XC3BHRztzttCeYCvfyH0lZRzJmysM89KcYc9qzQ1WPl10c+guPRfzvrHnR0r+p7XK36o7Oghqn2
	HOgwfnv8T7
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr12363082637.19.1783062210541;
        Fri, 03 Jul 2026 00:03:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr12363045637.19.1783062210031;
        Fri, 03 Jul 2026 00:03:30 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm2384087a12.6.2026.07.03.00.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:03:29 -0700 (PDT)
Message-ID: <454222c5-53e1-4be7-b925-8a9c2bd04fb3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:03:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX2HEljJoMw8GE
 PFDOgQ0wmRoYFD1EZ0EGfxOpUlabmKH+QnBvfLzdrVX1NNJCobtBWQPWf/GTkC9ZD7QvVa8oagE
 BrwmOBZes2nca+/eK8qUgSaC80lKZV8=
X-Proofpoint-ORIG-GUID: YKqZmj48F6maDNCRbaagHugmxiU0xjrs
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a475ec3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-GUID: YKqZmj48F6maDNCRbaagHugmxiU0xjrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfXysgKkbYdxyhd
 A6Q7EKSnFhwlDSyoCFmdDFvhnqq0ogWcishccNZkDroQOgsW5QrxkIpkO+skJnPMSNAcC5zsuXz
 +hudYD38Y2+8G8WL2VCRDmWjjoLOLJQ5ecSABIY6f8KzJPsuC2kWMTl6YyG7D0XNhlPCQVddEen
 ZA3CMYc5HrRKX8Dze3V3A8i4LD9FE6CO0Un4i/266sk9MBbe65I/S3rSj+B9UBkHcz7gEfGNOOM
 7QYFYNiCfRogooI0tSQGrvAkzBbmiEZMOKrfiNlKsxikhtUEoST8xdUTV8YH1g8Z+NbSowZvWRw
 eDUUmJolZcL3XAec/q3baKYPrYn3HvvV5Y2i0tzrcPWveH+uzW0qrBj4vrtnbgVlOjn7JBhYTmL
 z4CZXUWsjmF9uORXIrT0fwffRNdo5VMTtHZnQO3EVPOShNVG1QxAv1LeI7DjO2wXMlcbCJDD7ln
 ihaFDd0oN+sFJ9fYOzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_000332_800671_019454A7 
X-CRM114-Status: GOOD (  10.88  )
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



On 6/23/2026 10:16 PM, Manivannan Sadhasivam wrote:
> ath12k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Reported-by: Alex Williamson <alex@shazbot.org>
> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

