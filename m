Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5949BCA0FF0
	for <ath11k@archiver.kernel.org>; Wed, 27 Aug 2025 01:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyZ5iLGjMEfr8zWA8TqBNrggJ/o46idkE8iV1Fg6GHU=; b=iZfIC8IyZGcnW3Y8wHYqAlffor
	BnYj2KKIKAgb6aR6Q8GpTBR0+aX0Wi4/qD9PR5AIR2JH/CGV9Zp4VdWuWywvhrvLrkNpt888KH/Nn
	YwDJ+QkFBqVcYnFZRPqCe5Osnq9lwxofMV+drW9wz9rnqADKcQW50KgyJJZWeq9/Ylm3QZ1VB+ELJ
	xRKU7cdBIStYfGFyACYohh7QO5FDIS2hWfkxtet1Xfw5+B/IfzWlq0t8a9l6Yswv+Ypb3UoAAbw4T
	FrtX4F5ssCdTUo/j9rU3e0iuhvDIfo7a27o+m8oHOeABNgUhhM6jV763sYoW5jJhXgd2PhsJZsZo6
	KHCJYNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5Ns-0000000Db6S-49ok;
	Wed, 27 Aug 2025 01:55:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5Nq-0000000Db5u-0FJ4
	for ath11k@lists.infradead.org;
	Wed, 27 Aug 2025 01:55:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QGGmqB019633
	for <ath11k@lists.infradead.org>; Wed, 27 Aug 2025 01:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyZ5iLGjMEfr8zWA8TqBNrggJ/o46idkE8iV1Fg6GHU=; b=ETjfHBI8Qn8OTsO+
	LquT8vZTyxHCAsBfmtP94C9F/AqUCa05eBfEf3bXw2cuz5pCbYF3u/FfQ/yKzzEM
	eGRRPlEZLmwx0urzVzGaZGuWwiCPUmzhwT2lvc2fCqy0YJvQEkiALgJBw2bkbE1J
	wCB14okLSEbLNgEc7frsGu4wgEsKKcjoFJ9w0Irb8/TBZKt68mPkTuA/KghCTw+j
	OyIINNc2/gFbNiOb5/rsGBc2qQ4RhQlPgHoJP8+n1wZYv6tvlQANCeW4IfMVgEtf
	aVmPs/eplCykldzk7tjAQYPqqjPQ1jrnebTK+MTPG6gtHed/VI6AtvYYbEvOR4bi
	rac9+w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5jtfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 27 Aug 2025 01:55:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4c409a09a8so854208a12.2
        for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 18:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259728; x=1756864528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyZ5iLGjMEfr8zWA8TqBNrggJ/o46idkE8iV1Fg6GHU=;
        b=hlHfmS0qPV4OBK1xwdEvg38BKGjlLSCGzMzeLyv5MGiq/sQnv35mjYGWW+kgzjrQjX
         IIal2ulyEgCfNpzVXwaVgNXGTUiAbn3F34gFuuVcQrXlD91+IvAkICIk2v5z46XZzF6T
         WybU5Xt8k8ztr2zIRUMzAaY6tUvgTTomn4cW/vNJrmKP5+tqG7SsjH5hH0kj7/x5RqhY
         ANUpRXJ9rSdFyCY2nZ09gb8DclQFqutIK+zGq5mOsznpkIjHUE/VT2N22W7xEr8/4vhx
         XndWaXiy+QggZgBGos/TcZuUm6jKO1zrOqU+8lQoik0Zh8YUbQf+SRcLu9UFduljhjyf
         8hDw==
X-Forwarded-Encrypted: i=1; AJvYcCUhWFi4S1NQ9N5JWTkrJu9k2OWWWWYu0O6DrOsG1Q3I7mfM2TV22zkbX10BQtrv08bjV//lLoE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxKFzUjYtlGV/Ngcs7ACFk/ySoZOtHvyvxhab3jtzI4W1YNHAL
	2Us5XNg51SNQAaBVGi4Fk8J2iyq+T0GmxF9GkMxTmIgt4VxtGNshQrEXX3XNNHPIJwZYRfKzug4
	N35j0LsY2eFv6eUaOMji397WF8i5AsYD7ZMz27AWCWjXt2YmX+aom1KXwA20Z/DFv
X-Gm-Gg: ASbGnct46HlpqhWriLJblvmu9TJ/f9cf4uEsDI0mPTcXkbD/4pm0VR/MvzE/L9ir2dV
	kP8/IEGOME73KGUW6WnjqeT8OCKs32LWHE8rn45U/XnUokXWin93u+uYxH4ESqT7s+mGCNDvIf9
	YY5bOYQnCzgnhSSO90DaKMtZWLRWq9BI70CNM8em5cBTkGbIOfMeTaPa/KhX6m4nN3eNkzqeHvb
	QQtaHoDEWNwNOQnPsBIyyG6aTMIZkB2MS9MUHssClV1Cp4R9DkxQLIahv4dHRH8GvIGG2r3PYy6
	KBWU8/ekjSY5ijJ6QGCqjqzz18/rIITc1BiaOUNvRRoDKTDDNuVcWcqI8P8WDJ1bdamFQVbbCyd
	B+473ZxYtmwBv10+d1xoEwzbW8nps79SqhjLr2w==
X-Received: by 2002:a17:903:2f44:b0:240:a222:2312 with SMTP id d9443c01a7336-2462eeeca94mr229747295ad.44.1756259727683;
        Tue, 26 Aug 2025 18:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2i5XtdpRUbO/urKMakMgXLRO2eBfmK/dMCP7CKXewUgYFm/OlcVeTpLpdrPdXjPdZowBzJw==
X-Received: by 2002:a17:903:2f44:b0:240:a222:2312 with SMTP id d9443c01a7336-2462eeeca94mr229747085ad.44.1756259727126;
        Tue, 26 Aug 2025 18:55:27 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b521bsm108143455ad.60.2025.08.26.18.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 18:55:26 -0700 (PDT)
Message-ID: <b679c1ec-be21-458e-a650-1aa14e2366a1@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 09:55:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: is dma_mapping_error() check necessary for
 dma_alloc_noncoherent()?
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: iommu@lists.linux.dev,
        "linux-kernel@vger.kernel.org >> linux-kernel"
 <linux-kernel@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <CGME20250826094453eucas1p178ff4a39db0c655f3505128a5cfb0a6a@eucas1p1.samsung.com>
 <ff6c1fe6-820f-4e58-8395-df06aa91706c@oss.qualcomm.com>
 <89954593-8236-464e-8848-e7cdcf639c0a@samsung.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <89954593-8236-464e-8848-e7cdcf639c0a@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxBLR3ON2Bq+c
 9leJcVXapTns3KVhnXZsZ/6Kuy+LgSP8yzAVkYc78Kp32yKhfUgeUmFPC03IqKNkQrqS8ragabF
 UEb19R99W3PIlZqgXPUs//0Y6KHMylNIn3t/DBZlKIJpuw7WsUNv4IDz1iiWVdSebZHBI37V+/4
 KkzeEK/bskvtOaNoFzMBtA8ZSC9r2bXJ8Pgm4epvmIyA4AdFgFjpIZHsHHRi/zkc9nmwl9VTJXm
 KlpC0GA8rsdlwJ8chYFQnxx1d9mWzj2IRLdgGvdGg+btKSpsiF3U1+5+sMxSN7VnAUCrl7bLOaM
 hdRdNj7vZuBAY0s3M0ehq4lja/oQQmTcr+UDF0oNyTxy6kUl408ibDdGuZAuwpR4CNkk0mLMgDV
 h6sO2iy4
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ae6591 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=v1NiFcvVahR_jOWWQrIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Q27ZIkOR2LoUK1qM9h7JUfjnE0wcnRAU
X-Proofpoint-ORIG-GUID: Q27ZIkOR2LoUK1qM9h7JUfjnE0wcnRAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_185530_225078_5A965AD7 
X-CRM114-Status: GOOD (  15.32  )
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



On 8/26/2025 10:09 PM, Marek Szyprowski wrote:
> On 26.08.2025 11:44, Baochen Qiang wrote:
>> Hi guys,
>>
>> I have a driver which allocate noncoherent DMA buffer and get the returned CPU addr tested:
>>
>> 	vaddr_unaligned = dma_alloc_noncoherent(ab->dev, rx_tid->unaligned_size, &paddr,
>> 						DMA_BIDIRECTIONAL, GFP_ATOMIC);
>> 	if (!vaddr_unaligned) {
>> 		spin_unlock_bh(&ab->base_lock);
>> 		return -ENOMEM;
>> 	}
>>
>> while free the buffer
>>
>> 	dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
>> 			     rx_tid->vaddr_unaligned,
>> 			     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
>>
>> I get below warnings:
>>
>>   DMA-API: ath11k_pci 0000:03:00.0: device driver failed to check map error[device
>> address=0x00000000f3ad7000] [size=639 bytes] [mapped as single]
>>   WARNING: CPU: 15 PID: 64303 at kernel/dma/debug.c:1036 check_unmap+0x7e2/0x950
>>   RIP: 0010:check_unmap+0x7e2/0x950
>>   Call Trace:
>>    <TASK>
>>    ? free_to_partial_list+0x9d/0x350
>>    debug_dma_unmap_page+0xac/0xc0
>>    ? debug_smp_processor_id+0x17/0x20
>>    ? rcu_is_watching+0x13/0x70
>>    dma_free_pages+0x56/0x180
>>    [...]
>>    </TASK>
>>   ---[ end trace 0000000000000000 ]---
>>   DMA-API: Mapped at:
>>    debug_dma_map_page+0x7c/0x140
>>    dma_alloc_pages+0x74/0x220
>>    [...]
>>
>> Checking code gives me the impression that I should do dma_mapping_error() check as well.
>> And indeed with below diff the warning is gone:
>>
>> +       dma_mapping_error(ab->dev, paddr);
>>
>> However this does not make sense to me since IMO testing the CPU address is good enough, I
>> can not imagine a valid case where DMA alloc/map fails while returning a valid CPU
>> address, no?
>>
>> If I was right, should we remove invocation to debug_dma_map_page() in dma_alloc_pages()?
> 
> Simply replace "if (!vaddr_unaligned)" with "if 
> dma_mapping_error(ab->dev, paddr)" and the debug code will be happy.

Thanks, much better!

But I am wondering if the debug code is worrying too much? isn't the CPU addr test already
good enough?

> 
> Best regards


