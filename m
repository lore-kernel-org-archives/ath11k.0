Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE5CD4F3E
	for <ath11k@archiver.kernel.org>; Mon, 17 Nov 2025 02:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39pbJS3KgdysbLKFSIpTFsRIixBoour3yJy497186+I=; b=wATEUvwdiTBf0o3O2kSRkdnqnX
	sgrvHqx3jmYyk+zS01H+YOfI0lVMduFRPp40/ZTrrOPHCijpmu8QVxqc+9au59RiwKHnmBy4dX8Wo
	mNhB7bTBb7nDMzC2xWuw9pSizKDqAC68zTJUivjpldXAXB9SodTDzYlJjdrBpIfOp/Tl/YplzpOw4
	vfQa9wdgr95s0VCG5wahk7M9zKChPjx8UhlA9CMxZxwwnE2qS96WjWMnZNt/elQooBcZwx0CR7SQL
	zLBiPT+QsmyNRM4h0zXE0kAdprJnLuw2Id0V51kVBryy92/u4RJYEC5rB4eb/axQKSeLRR6NnsklI
	Pd/hrfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKp6r-0000000FJSY-0gTF;
	Mon, 17 Nov 2025 02:36:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKp6o-0000000FJRW-0NQR
	for ath11k@lists.infradead.org;
	Mon, 17 Nov 2025 02:36:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGLjF0X2446065
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 02:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39pbJS3KgdysbLKFSIpTFsRIixBoour3yJy497186+I=; b=YuSLJsFdOr3BcJNh
	Gj5MugWKswwVd+rbaw1i6qWOK1Bl3HgyKx7UJC4Y8M3tE/xEwX0o5UqFsawE+xc1
	vzFwgTtgDvDYUBd6FChY4pX/Gli7EGaQQlbWgr4RTj7E36Focd+p/d/b4HvXKdrr
	DbUyIh4hq551V4XfpJonhVmQT/LTX6WdmsIgrRncEC/66enyz7mbvtoH4OjTk5kP
	pdV5+dVBMaeB10vGXG1vaozmzZ9XBCD/+md0nWwIHhiXqndxmA5TMSlCnxC/KQbz
	uofUdCsg7rE1GKP5Es17kQW1613Jk2hjbIYFvMPmT0rEsA0ZaRE+SNLXp+C6DpKq
	yb03Vg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5b3k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 02:36:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dfae179bso97602315ad.1
        for <ath11k@lists.infradead.org>; Sun, 16 Nov 2025 18:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763347007; x=1763951807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39pbJS3KgdysbLKFSIpTFsRIixBoour3yJy497186+I=;
        b=hl4Eu98NLnwSdfea3uXJ3xdo5MRoT1lDPm0jCRvO3oDw62WCPyKlROyOu99/GdtvR9
         RLOSebmDT9ysPAjcZw6bnoiimYA8YVvUk/Hgt6YDSqt3x4tW3KqKEfEyvT/+8K0wugIP
         tJibFsvAqTnozQ381nOTFUFLhXjrrbJU4QzCJhiVbY2bDoMEisfH+hJ4NBB9fUviC/hj
         kpL+SoWppjGd3dk0Vo0MPpcM/TiYtlxxfO8l4Mr2X8Kxv1DfegePP2979Xygf2N9xIY0
         tRC9dCeRgSolb2Ih9TTbgFBUIjEauV/ELSBgJByHm56amfoJyirFi7mJOvtwrUxT0Dtr
         Ghrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763347007; x=1763951807;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39pbJS3KgdysbLKFSIpTFsRIixBoour3yJy497186+I=;
        b=TqbzOMw3Pex8pjncYq3rKN3NEry0pdflLbo3RNEoVJHDwlZ+bY/wvBYOJgQGvhtNTK
         Mq4m68DDRylB26SiXUhzo+KuZS1D3ml2/drnyWjXr+t4k1wgoFwV4IwccJ5uhky/3Ugg
         gSkaCw+S/JAQjEnZ8jnKovGBmO0uGCKe7dTMtqT7cE1Vk//txYg561wYhsZggnZtgAIs
         3HYzGxX0u96J3BhSHv5aWWiJFTvAz3r/0M9c+E28RgY/B//cWJK7EPUFdcKDR1EeFylu
         p6YJJdlEyApSzebksCNXDCT/qJxUl33AcpktDQtwS8ikI9I/5RqiYolne0Qdx3Vep5cq
         c/4w==
X-Forwarded-Encrypted: i=1; AJvYcCU28B31LLyZ7bYmPHTWKiZZh4JPgPQyZjtwr113xsJkulAJVhgQN3wnFUXGjjogJch52CoLDig=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhKmSiWwTcoMxIs1oidB024LrBG91hcOf4FyxH4GftRLFn5Cpq
	U4rYcJlVJvqJ+KQfcaqXIT22eyOAvnxe0uOimT8QD7VYaoK/t2P4yKRHBQW9P0glkcgc2bwVgA7
	kSWMTSP8awP/C0lKhu77goeX7zJLZqvd4s6oQGHn+GtCQBJv4oFzGl1JDAY4U/2HY
X-Gm-Gg: ASbGncuL4PtSrPZV5KIXI5nR1bs2MJyYSa9xXFZz77vUlU+Rbjr1fjvmm7+egADYNFY
	BO4BDV/pc4LAVI0JN08jD1SNIl7bOWYPd/hYeFWT7yBv1/kxIVPd+dSaHr7+H/pf9v6avfogHi+
	yxq64k2lvEMtxwy61SSY8VJXVipRB0/5eG8e+iZR02yGA8/3dE5G73+DGZm2IJBdWkUQqs5oCqP
	w4veR6z01+E/XatJBXQzT4NsNEmKFEkqdtfRNWJhCA90XTeoD641/oo9wpQVoAx9tLGHvt1TfoG
	yAIoL7wIJnKqQl1PX5WuPYcJyASXSsbk/82f7lOjJGYMe+GcWVM0grxnTbVtBCdVlboSoGw4W23
	SoeAr28x4yzUR8ps+e/XskPtSblM4VlvqwHA9h4XJAGGue3F5rcvQcJMbeSgFheCrjXm7vCuE
X-Received: by 2002:a17:902:ec83:b0:297:fec4:1557 with SMTP id d9443c01a7336-2986a7598abmr116773875ad.60.1763347007448;
        Sun, 16 Nov 2025 18:36:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8W+0BgPJEYbjw4FrKmofDfdMKM3fYG9H5M16t+BNUAdPhrbs9j8JpXvNtQsZA+wy9bjNFIg==
X-Received: by 2002:a17:902:ec83:b0:297:fec4:1557 with SMTP id d9443c01a7336-2986a7598abmr116773605ad.60.1763347006931;
        Sun, 16 Nov 2025 18:36:46 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf11asm121402975ad.90.2025.11.16.18.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 18:36:46 -0800 (PST)
Message-ID: <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:36:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAyMCBTYWx0ZWRfX2sJuE07CbFuN
 hRaCIqKZwSHojDt2zr34Pc3CaGosz3LacJ25cEa15bP1PJ1lrjJyEaMSj6XMI16kjRmL6q1Ce8N
 +vN9TWx7IJ3c6NPJJLtGztGG9sjcVIUWjQ1oYjZcn6SFRhof0Lu7vy/ot1FpMl3/lqDEdrMXObH
 xbwm+HlNtfsvSWm0m5KW1ZYRVsQ4rmmb5evAbfS9LmXNxCypbYlzV+M2CQi5ygLpk+baj16koYZ
 ePuV6fYFkzcjlQx5jxRG6dpb14HbZ/dJfttztnm50OIyKZWw7eGcDQBkCqV0ZZziEJodsgk0wS0
 HWeq0pqLy0Moxa+4enVVoSmCahlNX0setXcR/pHSM2z5aX9ybtSDDTbeQpdaRaTYzwNQaBiL36Q
 aUYpvERDPsS/XRIfNbysPEAdHi1cYw==
X-Proofpoint-GUID: e6LSPE-CwtLwzjEdxLJyXUg4ih9Wcp4n
X-Proofpoint-ORIG-GUID: e6LSPE-CwtLwzjEdxLJyXUg4ih9Wcp4n
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691a8a40 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oboMlcojp0BuSSWQvFAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_183650_283872_F1CBC83C 
X-CRM114-Status: GOOD (  20.51  )
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



On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series aims to deprecate the usage of "qcom,*calibration-variant"
> devicetree property to select the calibration variant for the WLAN devices. This
> is necessary for WLAN devices connected using PCI bus, as hardcoding the device
> specific information in PCI devicetree node causes the node to be updated every
> time when a new device variant is attached to the PCI slot. This approach is not
> scalable and causes bad user experience.

I am not very clear about the problem here: is calibration variant device/module specific,
or platform specific? If it is module specific, why the lookup is based on the machine
'model' property? While if it is platform specific, why do we need to update devicetree
node whenever a new device is attached?

> 
> So to avoid relying on the "qcom,*calibration-variant" property, this series
> introduces a new static calibration variant table based lookup. The newly
> introduced helper, ath_get_calib_variant() will parse the model name from
> devicetree and use it to do the variant lookup during runtime. The
> ath_calib_variant_table[] will hold all the model and calibration variant
> entries for the supported devices.
> 
> Going forward, new entries will be added to this table to support calibration
> variants.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Manivannan Sadhasivam (2):
>       wifi: ath: Use static calibration variant table for devicetree platforms
>       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
> 
>  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
>  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
>  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
>  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
>  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
>  8 files changed, 115 insertions(+), 8 deletions(-)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251114-ath-variant-tbl-22865456a527
> 
> Best regards,


