Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD95CAC597
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxLEQ1yAcsKflfwl/4WqUC9+qcQ3v/8QuoGR2gXv2U0=; b=j51kYZmgn4+USct4bH2Kjkl9OK
	YJ8iucGPwSwW0wtUy9l8Ej7gaM/HHSbDhdT7LGSBJhbW6DpY2/7MEltqbDFaos2N1NEq+3KmDwPZl
	sH/RmzPVojlDFJUCTlbQ/4Wc3sApITn8lH0a6UWDimr0p/jaF8i/MDNnX0iDgTHlYY9F3nTh4GcZM
	c/bP7aAnv5D8wv/GWO7x2KJvIO7h+N3yupKMoylB6JO/aJ74h6Jy6O9ETo4OTxKMx2eztF8sWT+Qq
	busj3JT7ZojSZBFQKAS93Fy9eEcndcJ9SH5d54dnG/+z+2lpIMXAKAsbO4tog0FHaB8MLxGy1Af0U
	+URsTg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz79l-0000000GJpd-0xpK;
	Thu, 18 Sep 2025 05:26:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz79h-0000000GJoV-48Rb
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 05:26:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HLAK1r027113
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 05:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxLEQ1yAcsKflfwl/4WqUC9+qcQ3v/8QuoGR2gXv2U0=; b=WL9KdHv7HW9HW90u
	d+7MCah+mYm9FJJHBOJ4+Nra6vgICv7wWVTvka5SuO6C6vzuEvjpQEH7NJSGv+vZ
	0DMSF6G47Xc8nYoQ9k1rw5eW6+onbyyzU0zJXeZQpRNhZeETgp0T3DTwOrFl4HA1
	4FhiON6lHwfCP5vjmk4uDxAE5eLPTkQUznyNhtL3PMeAY7lDUJoK8v+eWa568lGp
	Cx8pAJBOIbyCTsX0+/ru2BNGm1gjlmHLIPTB2vU4XaLtmWUJrHAXvc9pE1eRD7nc
	Zu6gNNeoWBZ656GGX1TEVJxipOH7N+7WAMqgUKC9sh3ssOLgtfgvnJ3mr8AQqgi6
	h2W38g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jayjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 05:26:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2681642efd9so5059015ad.2
        for <ath11k@lists.infradead.org>; Wed, 17 Sep 2025 22:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173163; x=1758777963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxLEQ1yAcsKflfwl/4WqUC9+qcQ3v/8QuoGR2gXv2U0=;
        b=pRSlcyU2Ks8qb60uMT9Gt8ew3ngSRTCEmg7ugzbX3M9WiPaO/T/jZl19oIM4WuJxkn
         ahC22AvFKyV0AVMEsCMdY//0oZVbyInCMPxavITpNlD3wKKQOlZ6ZWKbZBAWaiKfAO09
         a6KXTKgMO39XdsWTuMgZwWrZiNShh7CIIRb4L0X7UzsVifB6fQcJdYOHzUKvm/FYbxxc
         KiCmwE13YwNFb9Wnj6DNN05VnDpek1E7TWnOLRFwLRtfiIM/Rh+/E6rG+Ev90T/59tbS
         Qv5iqocpZkXGuh3wtZYxyuNI5FwQ4swLVPqvm+ai1j/X8GHuNhkFyALIZ8Q56WU5aKBN
         oTZg==
X-Forwarded-Encrypted: i=1; AJvYcCXp9cmKl/Y0ZK7uwy4DIxuh96M4piQZ6qDYdfcNNz0zCspIuDpJyP1yrAnv29y5KfSGwPvHH4c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUBFiy6dQmwn4WMvbsxV8IR0ZxqNnPEOx3Ro9yOIq5EcvR1UTV
	ge6aIzziM9QrMcfGtuPPupU1jAi24ljBK2XIxcgSEPwfaLpI0PU8hNOtMWAebwaw+WpihruohQo
	62sJLygSBjy7CBlq4+7svTeEKkqvkMOzD34KhA+V2YssomhU3GXxRCnsKl5nFIHnC
X-Gm-Gg: ASbGncsKN8gPaji5elCAwBp2ULykfCy690X3NTwe4+muhnvEZ+rmRmqQiIh7LvhiKV9
	P8XU31CiGhLsCuJeI+LI9IhDATax8tFq9LVQeGDfU0oesAn5Ln03Vs9o3OxXA/feyFQPVDA+ycS
	+2SxIiotoU2FjPzbl7nF6EXI3R5XUu3mUFJIZhCf2/uwq42jsXtHyXZsgLrhN/pTSQy3KUrU2af
	NFD5L4cz6NVaM9/m9kAGwOTD+oHe1GUpfnyWEcmZG4YQc1AQeOGn6+9K5lOEoBpt+qsmRIh4hfd
	H1HTQ/CUfOKaB5WW758XgJ8l+ftBGuXCCiG1QEOHMTknZyPUBB/osw9zdA9KPh+3UB1W2X223hb
	oBjMzAQ==
X-Received: by 2002:a17:902:d2ca:b0:250:b622:c750 with SMTP id d9443c01a7336-26812382744mr59356175ad.27.1758173163189;
        Wed, 17 Sep 2025 22:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2eKaVeUCfIArMi6p8GZxEhLIWooff9a8Rntl8i99RgFCyRT1yLmP+U1U71pJsFcKLBylAJg==
X-Received: by 2002:a17:902:d2ca:b0:250:b622:c750 with SMTP id d9443c01a7336-26812382744mr59355985ad.27.1758173162768;
        Wed, 17 Sep 2025 22:26:02 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de963sm12704935ad.77.2025.09.17.22.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 22:26:02 -0700 (PDT)
Message-ID: <36e9b150-fcf4-db45-54d8-a157201e516a@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 10:55:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: fix NULL derefence in ath11k_qmi_m3_load()
Content-Language: en-US
To: Matvey Kovalev <matvey.kovalev@ispras.ru>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        stable@vger.kernel.org
References: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LPRiqtFBUOdFIUpaSdjxhF_SN6ATCKas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX5Jd4QSh1npU5
 /D9/Pdf1Thnzr/alRfiKrwGM/uX4TB+nm7RfjoiZXO3KFOZt9lxq4k2R2OY11rqh1qQvbitazof
 23fMxh3itXeymQe6SIBXeqEr6inu/lgMwojY0/sZw18AeRJZZ1keWLBvoAMFuArk8/Rv/TcbH9+
 k29OQGPjy1JLtjBNXdnGLkepv+tDJDBpOc/HirPZVsWJ9zdVDR+9jsqOGMD3Ut3yZCgrT1d15Pr
 upwBwbUfNh4E5WiMaH9b8HxzH0CPwxKv5zDfIoK/XtiKSfOJXGa34tnxnG/zc8jpkBQw16TEJ3a
 zKu9pvzQkfNUDYpaGzeKKr/3T4KEjKoMnBMgzqAK3H5A59MJiKPcGuSx4R5LjNXpMMkko1AF40X
 KHqWwKl7
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cb97ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=HH5vDtPzAAAA:8 a=VwQbUJbxAAAA:8
 a=xjQjg--fAAAA:8 a=EUspDBNiAAAA:8 a=nfJR6hy_ZLdhEb8FW4cA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22 a=QM_-zKB-Ew0MsOlNKMB5:22
 a=L4vkcYpMSA5nFlNZ2tk3:22
X-Proofpoint-GUID: LPRiqtFBUOdFIUpaSdjxhF_SN6ATCKas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_222606_152352_F53E5B67 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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



On 9/18/2025 12:50 AM, Matvey Kovalev wrote:
> If ab->fw.m3_data points to data, then fw pointer remains null.
> Further, if m3_mem is not allocated, then fw is dereferenced to be
> passed to ath11k_err function.
> 
> Replace fw->size by m3_len.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 7db88b962f06 ("wifi: ath11k: add firmware-2.bin support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matvey Kovalev <matvey.kovalev@ispras.ru>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

