Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07C9D116F9
	for <ath11k@archiver.kernel.org>; Tue,  2 Dec 2025 05:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=; b=vJLLXcxuUlvPPGgqDj8V+VIZbp
	vePiHuC4xRDX7XeOiwpqC/v6DTBBEoEKF2u4MmM/FCiAU3gVLIiDynRblFtrBzMGJUOnGjvos3C/E
	wSXouUqZpYvqMKtkR4YpMr4lqpNQHdAro4oxgdCs6yplrbz6ukNXTDiYGdHGt378s8r82U+UZalae
	3By4jarIbYvfi9crm+bB6t/3rWBrhaET6w+g+WARP3eIFQNOYK23K8ajzIjOuN9bJU2OGBvS3N7gX
	PWKoHliTLmtISLTReOYbt9tlV8ri1Mo0N0y8iRYZo2ZiW1H6/mdmzgH9p91/PtsbSEciJ6Eo0ihI8
	eb5w0bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQIuQ-00000004ppi-3zDq;
	Tue, 02 Dec 2025 05:26:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQIuN-00000004poo-3IAL
	for ath11k@lists.infradead.org;
	Tue, 02 Dec 2025 05:26:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1Ls7xV1491741
	for <ath11k@lists.infradead.org>; Tue, 2 Dec 2025 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=; b=T1vmKpx1qt28b7mS
	q1DPM1OTWbvoA0mFF6oGC3Xg/GjbhjTfOhdAOltrK8o2loaxLFhO7ossFlW99Biy
	CEzLwMz1FQ9dWks4nR2+AXt+81641ANw22RQjpLbXxAsBMuDksvcELOebkDLucis
	L/NSFgCdVAs5eA3sBTuIV0Uhlm9NdcBfxMt6JU0UPFXf9KUkcOQ4UpjaYB5QkX/V
	HYcbC5vK0+zunpJXxvJXbwUm1oQHItVDe3ZqVbYEwJRLk+S74E5+drk7m+swgh/J
	lPo19hwtfME66VHZg1GjtrNFk2564U79IXosavvXGoUW5ukFgjUtOPMafAL+eN2L
	2ks14w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4askbd11af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 02 Dec 2025 05:26:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bd74e95f05aso3093240a12.1
        for <ath11k@lists.infradead.org>; Mon, 01 Dec 2025 21:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764653198; x=1765257998; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=;
        b=BSzgXVJnCjxSSTC9YA6x11PrlIULRPYggB6TAxI2PMD3cDKdwpiXC1mzJcKfTigXDU
         MP1yNOV1cbArULb7dgGyk2yHxbbG5N1V8lAvcc7f+ng0tUf0MSfhP1j5uhHQRwt9nMbm
         yzz2uMwvxwdm9QEAUSbfRz0ZMFevb9yjqV6I2XviOUimUvHziXsKjtMlpGkXtDl2qHku
         0fqJwsXnplVoDIFEpg805EZegx6YjYQK5yXIHO4VNzgDX+nVZ9b0ds/fBEyu1v78mfB0
         j8t0cFsIdPHNeZVIunMpEFfz53qdFIcSdjbM5OQ0oJpDXf8pzYaFoWYHRhMA3/qL2H0M
         nHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764653198; x=1765257998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=;
        b=D1zVQJFNOhtwa7aMwPPOwoFCXYE/n5yovEnzICmj+v3X5t3n7Z4R6AlQh/hH05+DFt
         zbTGvXFAHZ0xgSYcUsyMUnFC3fgS+AFJsg4UfQ31wOXt3JzoNBlfCctwYbEJ9RVoxpw7
         nTWRA5Fr/3+Q2LHaDqGN88Rrl2FTK0hMnOAdB4hnAPqdTHi8/RON/ZDs8zSVRkxm/hNl
         bXXUEBe8Ra2D5DSftKG561njeoGbzaRKFhx84s17U9Fr/9ZBSFc8U0dNiO/+RwJT5EoC
         0AtWQqcgIqfL/jKYNMyZ2Hs1dftxbGx+KSGMnD0XmF1A2E2an95x+T078gZD8RYt9X+g
         UPew==
X-Forwarded-Encrypted: i=1; AJvYcCUlF83lPYWSgx459SB+zP8WoHFdOg22klv8JpIsroasZCzD1h4k5BAJ1/zhj8OX6c5tLnU9Ino=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpDIwINEdnn6+n6lOPslXvFY7nIzczNTX8gGsXOWxjjGDSS/Vq
	eAm1adFTRPepQCZ0Wo2eOuXrsjr7r4GkcLAKw3bpNJI1VCmmI3a8ZTjct0sBIr9wN1XSNwekRqV
	1oANMA2p4Xe/WLrpV6BHE4SqkfZyPuvJ7V5wcfg9E+Ji5TdMp3fca/33pJDv7EXVP
X-Gm-Gg: ASbGncvH6wZGElTKLmXH7ZPaKw6qzOSA5AyPkNI6w2N8x9ACuMfhFf/TLKt2CKztjsa
	ZR5GjgDya50800EA5PHbB7ovFl7OP15UcIE0P/A4muA3cjL3Uya6xA75uB7EiyVQluu9POFogC8
	mlpButF5HHhSmKCAdGgla11NySMIw2zyp/8nT2gJEvnMtN/qUjKNLsynWZcqf442T7uko5fG73/
	V4DgiUSk4ezqHW6d3K/EOPz1KESU3vgj9ApZK42JQg/jRDAjlsr8U0GFC286G5AAQbqIBoYltIg
	dcZId3niRpgARQ56w7MZy5AKNyFHmlA9kOE3uHsin3fD4jnPIDwcFc3nnRz/prAgD/eLokeSkrv
	eRRU85ok0wmBJI3aFJtcC6yHyxA/4lhbwMJV6g1VDVg==
X-Received: by 2002:a05:6a21:99a2:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-363e8d51e4amr1374000637.27.1764653198309;
        Mon, 01 Dec 2025 21:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAWZ7n/BoRt2V1SlXWIuloIGJYsPZ36/Zx7AX6eT+utP2djOCYvtjHBuiLBctSYyTFSDkcpQ==
X-Received: by 2002:a05:6a21:99a2:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-363e8d51e4amr1373981637.27.1764653197778;
        Mon, 01 Dec 2025 21:26:37 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be508a1142esm13403683a12.19.2025.12.01.21.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 21:26:37 -0800 (PST)
Message-ID: <8872ac78-38de-4b1d-a0f5-9f171cc9f42c@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:56:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] bus: mhi: Fix broken runtime PM design
To: Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-4-fab94399ca75@oss.qualcomm.com>
 <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 20hD5SkF5TkgNiEEvmGGuoUCCQ4n675N
X-Proofpoint-GUID: 20hD5SkF5TkgNiEEvmGGuoUCCQ4n675N
X-Authority-Analysis: v=2.4 cv=fLg0HJae c=1 sm=1 tr=0 ts=692e788f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gkVCCi9o0YoM2wVKOhMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0MSBTYWx0ZWRfX6qqYrn/93q2b
 fSS/MVWipiIVwXVB2YGIkWVlH+wyqhSpQ4r+bQ4r7cU9NKeTReccNuS08Jx8uR9IPjps5E3wwTn
 7Vbu7EU6uAduombWge5Y/z8BwfRy0iROyNEDfS8gaM1RHfXp/dAhQFQAqLVQYlRbOy77CQKOM/m
 3eJp/+wp8z9v6A/MqsaGv3p78dgTZhPwojcDfCLHFxYwjVo2+1vjdzSRDuOuKwDVz5T/blXvwkS
 5OotxxOOD8BCxSwEVGr2WMBrVbgS5o4oS59NXGcZcMR5WpEvnmYxpVI9vqBHT6o8+RhxjiUgqjM
 Pa/bfNwMSUGijJhSOs1F6tSZBaETtYY4wc5ywLxwXKYIiwfGpnJ8uFZSeaGdouxB1Eqd0SIlFgf
 KHLsyNqrxw6FI8lh9F4E6I44UEX97w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_212639_834637_CB5EA664 
X-CRM114-Status: GOOD (  27.60  )
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



On 12/2/2025 12:03 AM, Mayank Rana wrote:
> Hi Krishna
>
> On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
>> The current MHI runtime PM design is flawed, as the MHI core attempts to
>> manage power references internally via mhi_queue() and related paths.
>> This is problematic because the controller drivers do not have the
>> knowledge of the client PM status due to the broken PM topology. So when
>> they runtime suspend the controller, the client drivers could no longer
>> function.
>>
>> To address this, in the new design, the client drivers reports their own
>> runtime PM status now and the PM framework makes sure that the parent
>> (controller driver) and other components up in the chain remain active.
>> This leverages the standard parent-child PM relationship.
>>
>> Since MHI creates a mhi_dev device without an associated driver, we
>> explicitly enable runtime PM on it and mark it with
>> pm_runtime_no_callbacks() to indicate the PM core that no callbacks
>> exist for this device. This is only needed for MHI controller, since
>> the controller driver uses the bus device just like PCI device.
>>
>> Also Update the MHI core to explicitly manage runtime PM references in
>> __mhi_device_get_sync() and mhi_device_put() to ensure the controller
>> does not enter suspend while a client device is active.
> Why does this needed here ?
> Isn't it MHI client driver take care of allowing suspend ?
> Do you think we should remove mhi_device_get_sync() and 
> mhi_device_put() API interfaces as well ? And let controller/client 
> driver takes care of calling get/sync directly ?
These API's not only  do runtime_get & put but as also do wake_get & 
wake_put which make sure endpoint also doesn't go M1 state.
>
> How are you handling cases for M0 and M3 suspend ?
> Do we need to tie runtime usage with M0 (pm_runtime_get) and M3 
> (pm_runtime_put) ?
M3 are controlled by the controller driver, they usually do it as part 
of their runtime suspend
and M0 as part of runtime resume.
once the mhi driver gives pm_runtime_put() then only controller can go 
keep MHI in M3.
So we can't tie MHI states pm_runtime_get/put.

- Krishna Chaitanya.
>
> Regards,
> Mayank
>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/internal.h |  6 +++---
>>   drivers/bus/mhi/host/main.c     | 28 ++++------------------------
>>   drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
>>   3 files changed, 15 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/internal.h 
>> b/drivers/bus/mhi/host/internal.h
>> index 
>> 61e03298e898e6dd02d2a977cddc4c87b21e3a6c..d6a3168bb3ecc34eab1036c0e74f8d70cf422fed 
>> 100644
>> --- a/drivers/bus/mhi/host/internal.h
>> +++ b/drivers/bus/mhi/host/internal.h
>> @@ -355,9 +355,9 @@ static inline bool mhi_is_active(struct 
>> mhi_controller *mhi_cntrl)
>>   static inline void mhi_trigger_resume(struct mhi_controller 
>> *mhi_cntrl)
>>   {
>>       pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>> +    pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
>> + pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>   }
>>     /* Register access methods */
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index 
>> 7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1..85a9a5a62a6d3f92b0e9dc35b13fd867db89dd95 
>> 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -427,6 +427,8 @@ void mhi_create_devices(struct mhi_controller 
>> *mhi_cntrl)
>>           if (ret)
>>               put_device(&mhi_dev->dev);
>>       }
>> + pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
>> + devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
>>   }
>>     irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>> @@ -658,12 +660,8 @@ static int parse_xfer_event(struct 
>> mhi_controller *mhi_cntrl,
>>               /* notify client */
>>               mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>   -            if (mhi_chan->dir == DMA_TO_DEVICE) {
>> +            if (mhi_chan->dir == DMA_TO_DEVICE)
>>                   atomic_dec(&mhi_cntrl->pending_pkts);
>> -                /* Release the reference got from mhi_queue() */
>> - pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -                pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -            }
>>                 /*
>>                * Recycle the buffer if buffer is pre-allocated,
>> @@ -1152,12 +1150,6 @@ static int mhi_queue(struct mhi_device 
>> *mhi_dev, struct mhi_buf_info *buf_info,
>>         read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>>   -    /* Packet is queued, take a usage ref to exit M3 if necessary
>> -     * for host->device buffer, balanced put is done on buffer 
>> completion
>> -     * for device->host buffer, balanced put is after ringing the DB
>> -     */
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>> -
>>       /* Assert dev_wake (to exit/prevent M1/M2)*/
>>       mhi_cntrl->wake_toggle(mhi_cntrl);
>>   @@ -1167,11 +1159,6 @@ static int mhi_queue(struct mhi_device 
>> *mhi_dev, struct mhi_buf_info *buf_info,
>>       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>>           mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>   -    if (dir == DMA_FROM_DEVICE) {
>> -        pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -        pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -    }
>> -
>>       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>         return ret;
>> @@ -1377,7 +1364,6 @@ static int mhi_update_channel_state(struct 
>> mhi_controller *mhi_cntrl,
>>       ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
>>       if (ret)
>>           return ret;
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>         reinit_completion(&mhi_chan->completion);
>>       ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
>> @@ -1408,8 +1394,6 @@ static int mhi_update_channel_state(struct 
>> mhi_controller *mhi_cntrl,
>>         trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, 
>> TPS("Updated"));
>>   exit_channel_update:
>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>>       mhi_device_put(mhi_cntrl->mhi_dev);
>>         return ret;
>> @@ -1592,12 +1576,8 @@ static void mhi_reset_data_chan(struct 
>> mhi_controller *mhi_cntrl,
>>       while (tre_ring->rp != tre_ring->wp) {
>>           struct mhi_buf_info *buf_info = buf_ring->rp;
>>   -        if (mhi_chan->dir == DMA_TO_DEVICE) {
>> +        if (mhi_chan->dir == DMA_TO_DEVICE)
>>               atomic_dec(&mhi_cntrl->pending_pkts);
>> -            /* Release the reference got from mhi_queue() */
>> -            pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -            pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -        }
>>             if (!buf_info->pre_mapped)
>>               mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index 
>> b4ef115189b505c3450ff0949ad2d09f3ed53386..fd690e8af693109ed8c55248db0ea153f9e69423 
>> 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct 
>> mhi_controller *mhi_cntrl)
>>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>           ret = -EIO;
>> +        read_unlock_bh(&mhi_cntrl->pm_lock);
>>           goto error_mission_mode;
>>       }
>>   @@ -459,11 +460,9 @@ static int 
>> mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>>        */
>>       mhi_create_devices(mhi_cntrl);
>>   -    read_lock_bh(&mhi_cntrl->pm_lock);
>>     error_mission_mode:
>> -    mhi_cntrl->wake_put(mhi_cntrl, false);
>> -    read_unlock_bh(&mhi_cntrl->pm_lock);
>> +    mhi_device_put(mhi_cntrl->mhi_dev);
>>         return ret;
>>   }
>> @@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct 
>> mhi_controller *mhi_cntrl)
>>           read_unlock_bh(&mhi_cntrl->pm_lock);
>>           return -EIO;
>>       }
>> +    read_unlock_bh(&mhi_cntrl->pm_lock);
>> +
>> +    pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
>> +    read_lock_bh(&mhi_cntrl->pm_lock);
>>       mhi_cntrl->wake_get(mhi_cntrl, true);
>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> -        mhi_trigger_resume(mhi_cntrl);
>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>>         ret = wait_event_timeout(mhi_cntrl->state_event,
>> @@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller 
>> *mhi_cntrl)
>>                    msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>         if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>> -        read_lock_bh(&mhi_cntrl->pm_lock);
>> -        mhi_cntrl->wake_put(mhi_cntrl, false);
>> -        read_unlock_bh(&mhi_cntrl->pm_lock);
>> +        mhi_device_put(mhi_cntrl->mhi_dev);
>>           return -EIO;
>>       }
>>   @@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device 
>> *mhi_dev)
>>         mhi_dev->dev_wake--;
>>       read_lock_bh(&mhi_cntrl->pm_lock);
>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> -        mhi_trigger_resume(mhi_cntrl);
>>         mhi_cntrl->wake_put(mhi_cntrl, false);
>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>   }
>>   EXPORT_SYMBOL_GPL(mhi_device_put);
>>
>


