Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97FCCA0FF2
	for <ath11k@archiver.kernel.org>; Thu, 28 Aug 2025 06:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTj1+Lvk1yn7ZHBLETS3UVFva4Pjn5rnBY/gKCJ4AmA=; b=gOec8qyQ6boTKh+OtFFN1+7OvC
	lE3l9NKG9G/rlSSUmxMTGfeCFgAx69SyAxEABPHxM1qvolQBdjeHuw/5eIAl9K8hVVZHl92ynaSQ+
	FwSMpX2YoA5+gSJpVjA9hGuMivC9efbM+MF8PG9WmgisEs15yjwQdG5swM0eUQLtd1Wy6h+eQnV3f
	5NhM6ELrccKNVSWb+n+T6X4ssFAI2KwhGWuUlPfmy/p9jnHkAjdpnBavDqAVe/LetDp1qFK4YLvG8
	U9K3lYp2lp9Mxl4Z05AhJdLj4q6Kh/FIUvhMKh7+gXQBaDH3De2zILWUnJE5l4OyfzUkkiqzLGDme
	Lva7JErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urWBK-00000000RFL-1R88;
	Thu, 28 Aug 2025 06:32:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urWBI-00000000REC-170h
	for ath11k@lists.infradead.org;
	Thu, 28 Aug 2025 06:32:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5OADF016167
	for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 06:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTj1+Lvk1yn7ZHBLETS3UVFva4Pjn5rnBY/gKCJ4AmA=; b=SqmU7GkQ91YJIPT7
	FinQAMTtWqPHkC19SvuTZDsfCeDlJqvHUKpyvkzqrHkI8lJ4MoMjwJx5yMu1aGGM
	XIWitkwKvEj7ACIhewAAv6iv9Oky0OSeWZPCTCgMP8HKxQYryXNuTvsbvWNCDkB1
	MgCme5Lhba4cm94HCt8Zhsjkh7PQVVZPVIQkm9+PwqeUKazzuHvSBgtcP7Wu6COA
	ga0E/igxbnDiSVHbqovEERKIspBIG9jE7t9ywvIandIgNGZ32XdW/ul7alQCfMVo
	xczpNuV+ahkVqT883jKV6bkpEiOz7CVFGceABSrFRx/xLtMofvD4TfR9qdMydzMu
	6XTh/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf1g12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 06:32:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-327b016a1f3so386356a91.1
        for <ath11k@lists.infradead.org>; Wed, 27 Aug 2025 23:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756362737; x=1756967537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTj1+Lvk1yn7ZHBLETS3UVFva4Pjn5rnBY/gKCJ4AmA=;
        b=HlupCFlIJyddBQQ0IjC04zbk5Hmhy8HO+A3WTpOq9IPN/m8WEQUuhEsWvWs2HyGGmk
         aDU2hyrGNrGnNfONZIWDKmNAPdc7UqwreF+g4nqStm+9g0MfC+gwdwF1qfhNaeawCOE2
         MLzW7RKWZ1WeaIaJCTth8zuAJSBimliQ+QjpGl3iSwdOhJPRykvIGDgX44DuCo6kNwoZ
         s3oQ+UzW/sxWJzjYNqQqY7tQLvjzp3ji2hPV0OK8t7UjjX0yBK8SOb/HrCzrIab6EoSX
         MmlCSGjXu9rQFW2ihk7LNHgzKxPJZuth6zLNbH1oyqsEPPzSG8HR0EkAlzi6bjUhelRa
         OvzA==
X-Forwarded-Encrypted: i=1; AJvYcCWnqri8V8bL1Gvd35FI6PeylnippoOQzw/5+7CzIYLXLe2pNkXPp+r1EC2tPpK58LC9oSkZrzo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyphv3HHAyoNYcaBgB7KOlsZ8uESoVR/zCwgySoVISagALyXBx3
	GELyRdPcXAfa5GzM64HHGyLU8c7umWQ6EArWvyNjd2/n0lTxOUALdFtOmlLX8mGRW5a2FEGqh2V
	9mfQNcz4xG3XJW/rS1XI1hqYvzxIRS8lq5T/7SkUCnBoc8xBbxa8O72E5CXBJC4oKyhQmS7fy
X-Gm-Gg: ASbGncveR8MWlq+Wi8NZUavCeNBW+DgkkT2F5lRwKX/tMrtZAxWLPXy22khIgCUmU0g
	WrMKz5MOJl2D/mSFlSdxp1oofQEjSkPvcbnoXo8WQJhOdlQLuZN+uu3FikP8l0IfDPmcTWkCL53
	7GTV+xgivwvjFqEDYxd1C/nI5DSzo+Tm8u0MT+A69U9ayygKYK92S+fYdtbOlYcqoHZY58k9L0s
	mMXcjvJUQQtwJPtnPeNWg/N3NodTra1OdtSQc3VZjrt96b+OlffjrK/ZZpQe8qOVlgJ8VI/xIcU
	zPKTkw65+ye7tJqAAnRRJE6gNroxJ1rWPMWkcUQLHWaDe8C4IlRasoWAh8gKYvYGrddacILgLDD
	gNehsePhZIGjLvJnBL/NeCpTgPQs5DMPlJqlcPA==
X-Received: by 2002:a17:90b:5246:b0:321:82a0:fe50 with SMTP id 98e67ed59e1d1-3275085dabemr10058703a91.5.1756362737237;
        Wed, 27 Aug 2025 23:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzi0sS96jT+LA7Vd4RQyv9GmttL0b1pHYtJpEfUGzXSzx0mdrwZTiyymIqRanTlSNCHIuSdg==
X-Received: by 2002:a17:90b:5246:b0:321:82a0:fe50 with SMTP id 98e67ed59e1d1-3275085dabemr10058660a91.5.1756362736751;
        Wed, 27 Aug 2025 23:32:16 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f59e29csm4065656a91.12.2025.08.27.23.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 23:32:16 -0700 (PDT)
Message-ID: <ceee4a15-b31b-4c8c-9a8f-7093b85f99cf@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 14:32:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: is dma_mapping_error() check necessary for
 dma_alloc_noncoherent()?
To: Christoph Hellwig <hch@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jeff Johnson <jjohnson@kernel.org>, iommu@lists.linux.dev,
        "linux-kernel@vger.kernel.org >> linux-kernel"
 <linux-kernel@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <ff6c1fe6-820f-4e58-8395-df06aa91706c@oss.qualcomm.com>
 <aK60Py3r25U43k1E@infradead.org>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <aK60Py3r25U43k1E@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mCChJ6sJMcgraGpC0-1QyexR4fC_BgVw
X-Proofpoint-ORIG-GUID: mCChJ6sJMcgraGpC0-1QyexR4fC_BgVw
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68aff7f2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=d_vTzFHel96VW_NBT_kA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX+rjkxKVfj3v/
 Ek8pOQN9zhVeC010fbxZvbS4whLpts3NQATb/npyYaHK2it7mh8A34KD8PH7pOIzvXs96hzY78I
 Xul8TgrgagLiVKyNGukMqiwR2GC6WQ97+EvG2nxliiNUpfvQc9iTU1XkrkcW6KYK60/rnnGU70g
 Izm8BAGL/rAevsYZ/8hUwdgH+1B+8aYDZei6yfwjozBBLAe+vbJwj7RtZaGnp1BvIVDcrWkvlPL
 s8LXsA2CfMwVY2LaG1Zjg6ns33mX154KFpKF5AF0cMWLMGKQVTcf5e/k+NnRWHMtUhD3Hr2M8wc
 AT9OW8MZPy1UhXVIQJWPrd9cwo/jJkmGgdRCvRzMQvKjZeJtktgWOGj6a2rVDkTUGCwtoy6pooZ
 4SxTC90u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_233220_414191_39F0A103 
X-CRM114-Status: GOOD (  20.43  )
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



On 8/27/2025 3:31 PM, Christoph Hellwig wrote:
> On Tue, Aug 26, 2025 at 05:44:42PM +0800, Baochen Qiang wrote:
>> Checking code gives me the impression that I should do dma_mapping_error() check as well.
>> And indeed with below diff the warning is gone:
>>
>> +       dma_mapping_error(ab->dev, paddr);
>>
>> However this does not make sense to me since IMO testing the CPU address is good enough, I
>> can not imagine a valid case where DMA alloc/map fails while returning a valid CPU
>> address, no?
> 
> Yes, this doesn't make sense.  dma_mapping_error exists to provide a
> error handling path for dma_map_*, which return the dma address only.
> 
> For the dma_alloc_* interfaces that return a pointer and can signal
> with a NULL return it should not be needed and dma-debug needs to
> be fixed.
> 
>> If I was right, should we remove invocation to debug_dma_map_page() in dma_alloc_pages()?
>>
> 
> That allocation still needs to be tracked, so it can't just be removed
> but needs to be changed to record the kind of allocation.

Thanks, I will submit a patch to fix this.


