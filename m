Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86282CFA466
	for <ath11k@archiver.kernel.org>; Mon, 24 Nov 2025 04:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbevJm9Pl3kJnjnGfCoLXbP0BZc5/opBkecns7ZWoDg=; b=XBjajiZu6sP4bO9Ri/VW3tzQ0T
	5OwVNnrp4IO2M3ut26gR9KgAgLphT127wltdEQo3RCpfBl0Xlux6L+VH3JVmA1TyWMNRubsLGY9SV
	xVnt0L5d2bCpFlP1M1q6xJ+XfDnRprtMBBzzgHXfjLK4oEgRf/+q0cuvfa5TsrzFPnvDNuNCmPK8l
	3U41IbTofwJCvt5wAm3J4juDFPp3NETXMHJ3iGrP/LjY/7HPVnMM41s4X37hT7/QZ9Xi8588vddTE
	gt18NjVgV80oNuP1BrNF+xeSKZ059bLzQQQDN9FDzDGlhvRnlYjmZnbAjX1sdoJ664YN/hFrkq3BC
	OtbIJceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOIg-0000000B4bD-3402;
	Mon, 24 Nov 2025 04:35:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOIb-0000000B4aR-0p0F
	for ath11k@lists.infradead.org;
	Mon, 24 Nov 2025 04:35:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO0CnHp2577473
	for <ath11k@lists.infradead.org>; Mon, 24 Nov 2025 04:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbevJm9Pl3kJnjnGfCoLXbP0BZc5/opBkecns7ZWoDg=; b=VtcruqT7GUhmrvhY
	d+hQQ36kDUhN4Sk1qVJh9M5UWbvI+YyFyH1dIraDHmbVfObeTWWn3e4WTH64j+B4
	ALwtKWEf9HvcGf9TkCTwYZO64rXhEmnM7WS9Z0yI6tswyIisf/FW+x/KixUFvkR4
	Vw+QVQtyUMi0IoMnAMjwZM3OIRY9ISDpVArWSZx2i3afBT7hVUV+eTcJCen9j158
	8oTlRAyvR2aqrUQKUV2X2Hn/lNPh0Paltbz3eKLgZrz/H62ms7AJtQqS9gmQY1OZ
	GQD3i9EUtmm+yWaKMilkXS8Hud2nCQTiggTpfax246kvtoxKJ5NbOUY+k8GyAolK
	EECnFg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69eujsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 24 Nov 2025 04:35:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so3952678b3a.3
        for <ath11k@lists.infradead.org>; Sun, 23 Nov 2025 20:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763958933; x=1764563733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbevJm9Pl3kJnjnGfCoLXbP0BZc5/opBkecns7ZWoDg=;
        b=frbmjfEYDwVWV3ip8hi9KP32J1wsQtER67gZ+RItst0o5/P5r44ji6fNZ0K2k5dSCt
         F7MlZAJdlN67NbMIGHh24C5cqdd4uclM3cLItp8okLcnn95OaAQCILvCd5voj63NnbFf
         KaiU+4lyb+pRFZwpYVanBk4KwrQfAA4YAdhqbzx5Qhw+1DtlM+RhMkw9BGE/XETv4OCE
         2IazXCeDGCk/3MNBWfI8U6c96NRY+FWlX5BW9xEsldRiRMV3hVFH5OOThL3Yl9b+Z6cC
         MNu44h46Xykb4vS43mk8IkSpIbn8tpcadTyAsd6y7dUFM3V8KewAQkI/dSCsO+99rbzW
         O00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763958933; x=1764563733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbevJm9Pl3kJnjnGfCoLXbP0BZc5/opBkecns7ZWoDg=;
        b=PXJmIKchTvgm0D+CQHk5sXrFGBLA0h1iVm2f7rG1qs2N0pKOgJN6Z+Y4jgQq93xTFk
         Isyqo1lVuNVBrQEAgGx/7ZmBQ53YEBiuYTcK2rAC5ifxxjz5jJS9xbepb4s337OdMt2L
         pm8+7XNmU3KOPt4s62vfSjBov90vNWlSHNVFsu3BVYeeMfh08IwBMsDuQG9swcjlOHjE
         xWGZealMoQ0u79Dwk1g5xseyUyE8L+FKJLy9iHWH+4VFMnauA60pX/RalpD+n+CkXy3t
         xc7IQ/RgEV0dEn21UTJw3dvl/B6nM5+NdmQQ81Tbl2xQ/G86FFBCcqRTOcpLAMI1Bw58
         puag==
X-Gm-Message-State: AOJu0Yw35s3yyHlYeFG+nM7dlDqvx57oNjQ30ptcVqYUeUq3DVTMdU8U
	DzYYuIkxcZMT7QhylZnvSL1Sa0KrQSIqVfbFXtKZ0secIDCpcgPeDgL9fZOGPnKA6IEuG05yBK2
	gCr1giKkPpxKtrnhhfvRPq2lw/Q4YOoqLk4NTZ/sVOYPFV5hE9nGy8G+Ohq54Ra/4
X-Gm-Gg: ASbGncs3jQHzQof4UP4LvPC4JihUMK+3C387a3wMUMiAd9/tVa3MRp+7WFk87QhFwyM
	6kwhO0qk/8N4Th+fhMR3BK7pXW9vP7qlbT5pwWM73Y+krV/7d0GoFEHC+mURxaHyMy4ONX0kOWq
	3UKfhk/P6pDsOro7Lbs15pw1+i2p09dKKFoebIcHpGCpypW19Z7S59L/s4LHbmJyxY4L4lkMBO0
	Sr37dxCR8NJQKX9lCObf2FytlmXkNI+dF0m039kV9J82wucR7O8500REfifmztentbtY8UPVcLH
	y42kHwR9g044S8Z8XdzRRx9NgrmK8hLwUs9TEYRrbzsoAnNO2oX3GZpp4a4vFsHTg22/t28hxY5
	4TUkJe6z1LqyjXao3cGZkyOJiilEaLMfVrdsatDd0j8peNfuKlHHACVI=
X-Received: by 2002:a05:6a00:17a0:b0:7a4:f552:b522 with SMTP id d2e1a72fcca58-7c58e7faec0mr10370149b3a.27.1763958933419;
        Sun, 23 Nov 2025 20:35:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1TK3dBRe8KyaC2l7J9pUqlzawaSjUB3R3uVMfDfBbRZBBa0WJwB4JlBuZvCe41gv63ZDpNA==
X-Received: by 2002:a05:6a00:17a0:b0:7a4:f552:b522 with SMTP id d2e1a72fcca58-7c58e7faec0mr10370125b3a.27.1763958932900;
        Sun, 23 Nov 2025 20:35:32 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed0751dfsm12921765b3a.6.2025.11.23.20.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 20:35:32 -0800 (PST)
Message-ID: <cf3ff4c8-7884-5c07-11ae-29f169be76a2@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 10:05:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
Content-Language: en-US
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Sebastian Gottschall <s.gottschall@dd-wrt.com>,
        =?UTF-8?Q?Pawe=c5=82_Owoc?= <frut3k7@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        quic_yuzha@quicinc.com
References: <3f355c8a-5bf2-4a74-9b35-daa8ae479736@oss.qualcomm.com>
 <CAKEyCaD4=qeQZYYOv4BTrqUJkZa+jnea1b3BL434X1iGMA-_xg@mail.gmail.com>
 <35c554a3-efdd-425c-ac34-858a927bbe15@oss.qualcomm.com>
 <e7e4058e-6f95-444f-b843-d942496dcf07@dd-wrt.com>
 <4a91f85b-12cd-42b6-854f-6e9574392791@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <4a91f85b-12cd-42b6-854f-6e9574392791@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDAzOCBTYWx0ZWRfX4my04+8civzg
 Q6hAKi2lMJPiwHds0SHvMDIuFlFqnXUT4iHBjEWCDTkIrDqmeT81E0aP7/gkQNfiedTMOq6jWyr
 UMkLpCD3tB/dhlHUBAaAjXVRAq6xTKyolGVzb7ns5JhgWTEDV/2lLnXjpvCQCUI97EPbwppNhGr
 q+iEsA0o/lk7VxkjLxkEpFuQLrHuMVQ75IH1p3lzPPBcLuL+1zwnSXZqntuu6Ad1SG51wdtmcIl
 jJf3XbUWzxOYC7P45JQAVWbjzovvJhGMuUMS/cYdDOBN6op1eqdhZpSFI1RARNUCRdtrZMdg1go
 BMZz3woT2lvhaJul518aZDO7aeac9DYNCoEitl3dwsjn5RjPn+0qYJvzRMlo+/UPEBjiR3x/yoV
 or/axyLP5CgYiFDZDlrAs7yn8l7Zvw==
X-Authority-Analysis: v=2.4 cv=cMjtc1eN c=1 sm=1 tr=0 ts=6923e096 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=KjjK3oRhKhDB2nV3eXUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 99OodlzH69_S6FQk12GA4rPKhljNhF7d
X-Proofpoint-GUID: 99OodlzH69_S6FQk12GA4rPKhljNhF7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_02,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_203537_253851_9A7BEACC 
X-CRM114-Status: GOOD (  13.77  )
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



On 11/24/2025 6:39 AM, Yu Zhang(Yuriy) wrote:
> 
> 
> On 11/22/2025 6:17 PM, Sebastian Gottschall wrote:
>> Am 22.11.2025 um 08:55 schrieb Yu Zhang(Yuriy):
>>
>>>
>>>
>>> On 11/21/2025 4:41 PM, Paweł Owoc wrote:
>>>> On Fri, Nov 21, 2025 at 6:00 AM Yu Zhang(Yuriy)
>>>> <yu.zhang@oss.qualcomm.com> wrote:
>>>>>
>>>>> hi,
>>>>>
>>>>>   From your log/calltrace, I didn’t see any errors related to MU EDCA;
>>>>> what I saw were related to SMPS. Did you also add changes related to SMPS?
>>>>>
>>>>> Yuriy
>>>>
>>>> Hi Yuriy,
>>>>
>>>> Thanks for your reply. The ath11k driver is version 6.14.12.
>>>> Everything works if I remove the mu_edca setting without any other changes.
>>>>
>>>> The problem doesn't occur with the newer IPQ8074 firmware, version 2.12-01460,
>>>> which hasn't been publicly released.
>>>
>>> So the newer IPQ8074 firmware fixed this issue, great.
>>>
>>>>
>>>> More details: https://github.com/openwrt/openwrt/issues/20702
>>>>
>>>> Regards,
>> the point is what he mentions that these newer firmwares arent available public. i 
>> provided openwrt these images for testing
>> so he is asking if or when qualcomm does release newer firmwares to the public repositories
>>
>> Sebastian
>>
>>>
>>>
>>>
> 
> hi, Jeff and Vasanthakumar
> 
> When will release the newer IPQ8074 firmware 2.12-01460?

I guess the issue has to be addressed with the current firmware binaries as well.

@Pawel, can you pls share the debug log with debug_mask=0x73 (AHB|WMI|MAC|BOOT|QMI)?

Vasanth

