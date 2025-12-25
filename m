Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B14E7AD42
	for <ath11k@archiver.kernel.org>; Thu, 25 Dec 2025 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpQR5MhthxNYS5X1B4rXC7O41ZaJ8gH+dbtsDtAc7Lg=; b=BThC8PMgd7kG5zj29jaPhItx7Q
	LLp9k0UvDdhhfzTNnT0ojxXJ4DMK5zWokvfKKCcZxiO1M2Nd/3hDyMDERfvIH7LTMTmbHMszil4c4
	+UtpRZt+LGC1vvV41RLbbYLQDxCpU1U70i/wt6c0+ZK3w51xPwKo5cAuJt4S196GHN7nw5t3A4asl
	zFojlbDs5iKUDv7zwjsPPE0hiCI4PvOixEa/O7w7YEalPmkuQ2Yo4gkNGiLExbgXLFh/Q5nwCWVr8
	fE7xqrULZrFfeAPnMSCfJyxQFa+UCMJrWjC+xYb0dwllv41/PKm9aX7js4USjFhl0fGA2FGnqn8mc
	dyeZt16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYiE9-00000000JEO-0nkZ;
	Thu, 25 Dec 2025 10:05:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYiE5-00000000JDz-1laL
	for ath11k@lists.infradead.org;
	Thu, 25 Dec 2025 10:05:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP8bTr11455187
	for <ath11k@lists.infradead.org>; Thu, 25 Dec 2025 10:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpQR5MhthxNYS5X1B4rXC7O41ZaJ8gH+dbtsDtAc7Lg=; b=eHokdcIF4YJP56la
	BGteIpjyXQKlQ4e57sPQq4hY1McvZPSnAynfqqmT70dudKiQtaqPV4/8xRmnh77n
	XDmZX3Hfh/i45/KPE+nJwIcLcvd639eRQnRYuQY2zyuhhOSSnOzabChDvKJ7KA43
	f9TiqL/fi9nnFN98uZEnpEmILEkILc6X+k5VfcKO2OQ3aMD6hS0JPnYvsmIUHvXz
	0s1+mQLipd9bqVhSxwmeY5Xik8LMFHsqZgWBZoD5NoOIhBS5kZGFHLmUrnTcisj9
	wjxxEVyJjzrs43sYqqacBlRgaLWIjjFdHiVsFasLAoBHHX6owU+Dux0M8yzPpEmx
	t/idiQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xn28fnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 25 Dec 2025 10:05:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f21951c317so5544708b3a.2
        for <ath11k@lists.infradead.org>; Thu, 25 Dec 2025 02:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766657144; x=1767261944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpQR5MhthxNYS5X1B4rXC7O41ZaJ8gH+dbtsDtAc7Lg=;
        b=Y4RtzhoHCad2Yz4AAG+Pp73okbytpcQJ61BiGEJXJeIUck8ZeEwZinpSZnqGUcm/N3
         e/N7aEd9TNKyTC3ih2/tmf8m/N8ECwUSQRntw/FQmKBRky/WwlJCpHdO4YJGvC080gPQ
         bdPfQc5ym2D5rYSa4rkKLU0rewxQdc9Hol/HuLJFm1yx/tZHWD3JRuhpaVwJ+iU4bpZ8
         aelFnuLgppFiwL9DMVOnBlJ+yOquLDTWuWcHUJpzCjC1mYu4qBMGNmlpS4nqt8R4Qffa
         vJfPcfb+OWkoPj3FvJtq+2HM6B4ZLfhLVPwjcOyGNbjDLPcyyBEj5fkaEmTUgX2sb1Ko
         5dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766657144; x=1767261944;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpQR5MhthxNYS5X1B4rXC7O41ZaJ8gH+dbtsDtAc7Lg=;
        b=sLB2V2yT4EXkw0Xsqw48wnnxTtWNOus5y2hTUU0aIt+QZ5VpcddIVupREJj9255A2y
         aF8kCnH/KeHdY4ZPudJ96PhC/V2rDVb/jhvjtVp4UHAtHCnGDixnVWYWkqtkoVfNGhqr
         ilChgl5iW9Sg4ghj1YDTXpPkN4wiGgadjDXSHyzeRmuKhY88jILSq/1XRXukbcTkjy7m
         Bj7l8aTpRZdamdA/J1NmtUMLF72oAz/q8uvJCVx4xzs4LLc1LaObQVaKYXh16svQCar7
         v/VrUStWf+pV+Km1Qr7wlxncF+BgpPL7eyfv+ACxtDu9mmBUF7Jg2/+oaBp8RGu0STMG
         vG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMPHydPL5GGA6Qc7ozPH5cDGblOpTPP/puS4+OPss4O75AhbwwJfuxEa7UTDuiIe+MzHSIIOg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAZrtBdRfI7RExmIjgihK+WBv3k16HNxKMIPtSx9Kxnq0HAPmP
	9g996VnW1pihX28ULV+gEiCKUYHVWt81FL+Nj24Puiq/2DBX+YAxyzyxRKnhAzn0pb8mHw9nogM
	JmzoWA8wnLWUWYnHUZ73ar/VXvIiRtrergews72IEO2qXTysiykp5OnL4OHJKLISs
X-Gm-Gg: AY/fxX7DDIRgs6WRDqaxmK6w+X43Z801jy1vyQt/6c3k5ehNgXdhhXiqIy7yL1Tko/m
	0axSoCescd2bHNmLxW6blg60ty2uFooP9dpWchWtycQFrPL3WnBfdloqUncA5taK1RnMnouG68q
	UtGv+DjIsgUW4SzFNKqkUvRrgNJ0DkuWHjjkZ2XAfIlyy0fpNvHMX1+6dsZqq7t1QnOmf6znt45
	78R2ZMpvMxyS4G8/wYnaMj57+P4g6X7y59/+Bp5/NCaKdFZmhFRFl2lEPyc7+zTcs7SBZUi1F4x
	qWskCbMoKVwxnaLORyhJc32wIPtVMpv8RigTgGRfrdhfjeLNHOF9qUrkLzOwzsM4lA9bNoghDJM
	2dp3wiR2DCW5VLOLo4E+4KcVBgtQAQ76W7Y+TRzPC14a5KL5i/cwgz3yKXp1Qy2ZurwXUZ15pmP
	553Ic4Og==
X-Received: by 2002:a05:6a00:1f06:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ff641193d9mr18300397b3a.4.1766657143930;
        Thu, 25 Dec 2025 02:05:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHAFIEoFagy2scNUKwIjJ20L5wmLpWPL/hZajeM9dLT/f6lWLYsRJMfgEduMnI8hA2d3pDWw==
X-Received: by 2002:a05:6a00:1f06:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ff641193d9mr18300372b3a.4.1766657143406;
        Thu, 25 Dec 2025 02:05:43 -0800 (PST)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cffesm18764071b3a.49.2025.12.25.02.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 02:05:42 -0800 (PST)
Message-ID: <e63d61c6-a35b-421a-820c-91262f3b11a4@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 18:05:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix qmi memory allocation logic for CALDB
 region
To: "Alex G." <mr.nuke.me@gmail.com>, jjohnson@kernel.org,
        ath11k@lists.infradead.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
 <7ef46837-7799-4ede-9f5e-88a010d5d1d4@oss.qualcomm.com>
 <884758381.0ifERbkFSE@nukework.gtech>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <884758381.0ifERbkFSE@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA5NSBTYWx0ZWRfX+VTLU9BQLTIP
 +hFwe5EntoG7y4TWBeqjWfALDpnW5Y1YbTh1+OOxQIsfXYi8zn+sLuiKs5UwzQcPTpCxvK3pf0g
 EuvQ80VNx6ARebSuWTINJL2INJT8x9aSPNQ1MfoqJ0Y9yOfbcEA6mt2fBQwxqeKfd6oqxqDbsTC
 8djnmgvOOPU794Gi7JoQxO+Lwq67BEcK5naCH1xAw44d9TykmqgGelZsmq9ad6FGJueEUNqxPR5
 h5nIkr+1f2w/15HZ5BI4ejPM2JStd6bKnnqIUuvjK5+xEK3osCkNPdz7KmkNyKDbg2D6yVJQypM
 Q4tLXR4iKrwSlb2T9aGIfEAKS3Y4msstd2MUhWVd3hfI9L9Ko2mTB2Wfm7BuwtO6LaUd9YWr5iG
 XUlD2K359ou+Vd7KYsvxSE3Zi1meiM/4cYR3Rr4dGpTckcbOXG8Ksv2fbbvDvrBq5S5ncOGe0pz
 fMIhxoLPGomq2BZ5Ceg==
X-Proofpoint-GUID: vxl4klqsvlbv_y0RBYD2_zdoZq5juxor
X-Authority-Analysis: v=2.4 cv=Cp+ys34D c=1 sm=1 tr=0 ts=694d0c78 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yXKDi3_BjhFrakrclucA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: vxl4klqsvlbv_y0RBYD2_zdoZq5juxor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_020545_520459_F8B8450C 
X-CRM114-Status: GOOD (  19.67  )
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



On 12/25/2025 5:47 AM, Alex G. wrote:
> On Monday, December 8, 2025 4:23:46 AM CST Baochen Qiang wrote:
>> On 12/7/2025 1:58 AM, Alexandru Gagniuc wrote:
>>> Memory region assignment in ath11k_qmi_assign_target_mem_chunk()
>>>
>>> assumes that:
>>>   1. firmware will make a HOST_DDR_REGION_TYPE request, and
>>>   2. this request is processed before CALDB_MEM_REGION_TYPE
>>>
>>> In this case CALDB_MEM_REGION_TYPE, can safely be assigned immediately
>>> after the host region.
>>>
>>> However, if the HOST_DDR_REGION_TYPE request is not made, or the
>>> reserved-memory node is not present, then res.start and res.end are 0,
>>> and host_ddr_sz remains uninitialized. The physical address should
>>> fall back to ATH11K_QMI_CALDB_ADDRESS. That doesn't happen:
>>>
>>> resource_size(&res) returns 1 for an empty resource, and thus the if
>>> clause never takes the fallback path. ab->qmi.target_mem[idx].paddr
>>> is assigned the uninitialized value of host_ddr_sz + 0 (res.start).
>>>
>>> Use "if (res.end > res.start)" for the predicate, which correctly
>>> falls back to ATH11K_QMI_CALDB_ADDRESS.
> 
> I am ready to submit the IPQ9574 support. This patch is a dependency. Should I 
> include this change in the series that adds IPQ9574?

Better not, first reason is for track purpose. And the second, since the patch is fixing a
broken commit, IMO being standalone makes it easy for stable team to do backport work.

> 
>> In addition, does it make sense to do of_reserved_mem_region_to_resource()
>> before the loop, which may give CALDB_MEM_REGION_TYPE a chance even
>> HOST_DDR_REGION_TYPE request is not made?
> 
> I'm sorry that I initially missed this question. I don't think we should move 
> &res initialization outside the loop. We also need host_ddr_sz to be 
> initialized by a HOST_DDR_REGION_TYPE (1) request. On IPQ9574, the firmware 
> doesn't make that request, so host_ddr_sz remains uninitialized. Since &res 
> and host_ddr_sz are used together, I think it's better to initialize them, 
> together.

fine then

> 
> 
> Without patch:
> 
>     ath11k c000000.wifi: qmi firmware request memory request
>     ath11k c000000.wifi: qmi mem seg type 4 size 409600
>     ath11k c000000.wifi: qmi mem seg type 2 size 262144
>     ath11k c000000.wifi: qmi mem seg type 3 size 1048576
>     ...
>     ath11k c000000.wifi: failed to assign qmi target memory: -5
> 
> 
> 
> With patch:
> 
>     ath11k c000000.wifi: qmi firmware request memory request
>     ath11k c000000.wifi: qmi mem seg type 4 size 409600
>     ath11k c000000.wifi: qmi mem seg type 2 size 262144
>     ath11k c000000.wifi: qmi mem seg type 3 size 1048576
>     ath11k c000000.wifi: qmi ignore invalid mem req type 3
>     ath11k c000000.wifi: qmi req mem_seg[0] 0x000000004ba00000 409600 4
>     ath11k c000000.wifi: qmi req mem_seg[1] 0x000000004b700000 262144 2
> 
> 
> Tested on : WLAN.HK.2.9.0.1-01890-QCAHKSWPL_SILICONZ-1
> 
> Alex
> 
> 
> 
> 


