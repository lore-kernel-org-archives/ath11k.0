Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9183EC19F32
	for <ath11k@archiver.kernel.org>; Wed,  5 Mar 2025 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW4c3i4J3mlPr+rYfyKkb0xfrDke8TBiM4daJ0wdc20=; b=Levk2Tn6zWKWMSWWtLdNWUdfiZ
	BOqr/ne/ZNc1mHawfonV4T6QpebYOQPD+N7/zBeMpaYhZEvWKmuS+oTTfUbGbC6I+d6lIHecFZSFl
	OhNoXzSnjYSBfG3EWnMKx8q5jBkfMkPGdxgmZgxf2PADayQ4FMj+CUoNeyhXdOR2+w1Y2Qeav788l
	8Eozm3UPDSVMt8ATpmArFIvqmwJy1CpVmxrGIH57+62icVDNChFeXlf6V2kwwhHfaFL8JS63BvDTO
	hGlM/5ACL0/yh4o7VyuKvEfv339nKUhiJJi4OTzIbgECxlh0RzR5be6KzNw1W7ZiRdyytxahVz/ST
	Jv8qHqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsmA-00000008pGW-3B7y;
	Wed, 05 Mar 2025 17:43:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsl8-00000008pAx-2AqQ
	for ath11k@bombadil.infradead.org;
	Wed, 05 Mar 2025 17:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cW4c3i4J3mlPr+rYfyKkb0xfrDke8TBiM4daJ0wdc20=; b=KeGgDqS71AOGxGqo29fbToBVoF
	tcQ+viX3LNA48ZldeGcQUNnNcki/cPUvS2WHCAY5c0yCtw1PCgtDE6D6GhJZMU1M8luCIuiEcjO29
	wWa5J4uAtPPoENNDEHaPD10qxwMVbc4U3hIrT4RI8wcfowtZoNIIdUT2O7J1qqef90Dp+gmByhC3d
	ctpF3lkKEovomvoUSBmDVcGs9pqd06LAcbKFEjAxZakogFntctWlvlYRrSZyxlmNysWwGFmgJF3yT
	DMDZsbKQ1UU1KP53btPCIWhM5QpcQ8kKr1MfDOIEAtIqfKzzNWc4UgMsMkQ0EoqW7B9zS6/YLMZMZ
	CsVEvcKw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsl4-00000000fOS-482a
	for ath11k@lists.infradead.org;
	Wed, 05 Mar 2025 17:42:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525B12pa005523
	for <ath11k@lists.infradead.org>; Wed, 5 Mar 2025 17:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cW4c3i4J3mlPr+rYfyKkb0xfrDke8TBiM4daJ0wdc20=; b=UYHqu1MjjB0gsgFJ
	n36Q8i7fXiGHeg67CXM52zLzntcgLr98PnNfNWXlAeiTjr4wmdYdn05FVNstDMsV
	p1YcDfh9k6N98JfSfQUfvYetvl3f7QKuv+4YdMaIf6hS9dOpLyXuDJ6OWEnQB6w8
	gQ0E+pHLCS5uOvhGJ4K4ppRckb9l4icRPcpTdMSXHHE4ocr0Bm81jMMNqfjnDcDZ
	S0EQVf3OuBq9VZl5AB04cpTBN/K3bU+7LZoj7+8fbb7b70FEHO1/NZb1QZJKJHOR
	efW0692mfIDuocz0kQhXqY5CRt15wiSSi6nVNoICrUx11kd2P61bPBmX1nDgt4Mb
	TGrMoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v65t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Mar 2025 17:42:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223f3357064so17254205ad.3
        for <ath11k@lists.infradead.org>; Wed, 05 Mar 2025 09:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741196527; x=1741801327;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cW4c3i4J3mlPr+rYfyKkb0xfrDke8TBiM4daJ0wdc20=;
        b=exI3690l9MqD6ldYT2Nz7QyICIZbW1F8mNzgsL95j97if94mfRvTK0DW6YzYIypeam
         01NQi1BjefzG4CZoGsiXVKuPqnQbfM1/uUlmOUJucIkxQeCHGKAw+X/1IHvP3my30bwV
         xQ+k4UuQ3X6QQYRqWVPXt42zXxiFaXYD//KLrWb4eRZxH8WOjLdRNtQso8UsezYU0nOz
         mizAqxEaLREJ8mPp8aDCiFadFy4NzN+U+W5pH9GZlDlJz7SJ1t2pbKwbCCXnHiCOJmwh
         FTjbKOF8CelqYvo4KTvN5bXKrpGy5MWD4II4x7UdNJtMSK+wI4cYtHYdwmg7QN/8gpbV
         EvaA==
X-Gm-Message-State: AOJu0YwoU4U2zY0eQWWi0unIj1dARQYIJUiuXEXcWSl53Hqv0jHl1Xcl
	80dvjd83l40ATJ8ufIze1jq33KZJijaHlzxtgfoVPZBe5IwdA1WBRL6/dhLgFhc16tJTTyAd5fz
	mrXYk57u+wkN2gNLIk1IU8mY5hNVjrOi18/dtLONa1KEtuQdpDRick4wV7wsd
X-Gm-Gg: ASbGnctKP3PPuK0ou/0iXrWtadiPApPh3EPntc4VPBjBi+zwFZ+rgfaHl1nkoL4n4K7
	SgzNdBRw7EcFtDdNgxtqlnYMWjm2ypzjPk0OyvavyO0PhOUvuNsdx2d5r6f52ZvM5iEq8kF2rC2
	JKDzDdY6FU7aWr3C5LnVT0v5UV/Qfx+f3YPWTAzKMFeBvDrcYJbCNmVqGBUplV/bgXTCuVcK83I
	vNXmMKa8zRzAE3dcfRsqZJ23CsEzRmtWCwvKWHUZu7nx9mPXjd4MrCFm5FnVTO7ViZnm2cdtXIB
	GDFYMQtvPwR/bw90hi1TWBrJnynklyX1rb8vNTFHyTe3lXr12Gojq1a7BPkzDyWKEFW0yls=
X-Received: by 2002:a05:6a00:2303:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-73682bea834mr6032882b3a.12.1741196527407;
        Wed, 05 Mar 2025 09:42:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjmbCYLlh6OKP/aJo2EZp8bB7f5NVOCgf9md+RM9XMbm3yCdHm8vq8WD2+/r+MsZL538v/bw==
X-Received: by 2002:a05:6a00:2303:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-73682bea834mr6032858b3a.12.1741196527043;
        Wed, 05 Mar 2025 09:42:07 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734aed45c21sm11521080b3a.176.2025.03.05.09.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:42:06 -0800 (PST)
Message-ID: <5bd6c864-018b-4401-8c1b-7bad023de75b@oss.qualcomm.com>
Date: Wed, 5 Mar 2025 09:42:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] wifi: ath11k: pcic: make memory access more readable
To: Ziyang Huang <hzyitc@outlook.com>, Steev Klimaszewski <steev@kali.org>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org, johannes@sipsolutions.net,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <TYZPR01MB55566065525ADA7F71F516D4C9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <20250304063328.33762-1-steev@kali.org>
 <TYZPR01MB5556A389846BF8E8A49831CDC9CB2@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <TYZPR01MB5556A389846BF8E8A49831CDC9CB2@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gyyuE_1gckj1PQ5b8aNqDV-f3XmxTtNf
X-Proofpoint-ORIG-GUID: gyyuE_1gckj1PQ5b8aNqDV-f3XmxTtNf
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c88cf0 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=JUnQ2HaaVozFeyLivG4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_07,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_174215_376814_E75C7C92 
X-CRM114-Status: GOOD (  11.86  )
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

On 3/5/2025 6:41 AM, Ziyang Huang wrote:
> 在 2025/3/4 14:33, Steev Klimaszewski 写道:
>> Hi Ziyang,
>>
>> With this patch applied, on the Thinkpad X13s which has an ath11k, I am seeing
>> the following:
>>
>>   ath11k_pci 0006:01:00.0: chip_id 0x2 chip_family 0xb board_id 0x8c soc_id 0x400c0210
>>   ath11k_pci 0006:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>>   ath11k_pci 0006:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>>   ath11k_pci 0006:01:00.0: ignore reset dev flags 0xc800
>>   ath11k_pci 0006:01:00.0: failed to receive control response completion, polling..
>>   ath11k_pci 0006:01:00.0: ctl_resp never came in (-110)
>>   ath11k_pci 0006:01:00.0: failed to connect to HTC: -110
>>   ath11k_pci 0006:01:00.0: failed to start core: -110
>>   failed to send QMI message
>>   ath11k_pci 0006:01:00.0: failed to send wlan mode request (mode 4): -5
>>   ath11k_pci 0006:01:00.0: qmi failed to send wlan mode off: -5
>>
>> I'm pretty sure this isn't supposed to happen?
>>
>> --steev
> 
> Oh, give me some time to check what happen.

I suggest you not spend time on this unless you can test this on all hardware
supported by ath11k.

/jeff

