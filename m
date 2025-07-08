Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CA8C83030
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 01:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yl777uk8TYoa7yrfsLRZl56fRfsxTMHbE+ZHD3LEddY=; b=kklavJYSkSE+emoUiWuwREmVIS
	tbjqxjDKzNif+T6FP3HoTGnEO0EuhCs5u4AvIgcbhSqDD4iJFqWjztPnNbZnt4qeBnFVDzEt6nHuS
	Ui02vyCt/1OGpAJ7hafuBQYaie5vXM1vK4A0qJLQzLN9vWCcpyn7c3E7tumVIl+4u2ndmBtB7UDoX
	616BBYCI6TN4krXZpaJD/u6f2R//ryJ0vZdvbwaDAcFPliOnxckpI1ogcmG/loAN1Sw++f6Q85LX0
	7XTkttk9C9qfm6efPV6nN1VTLEGe2I7ClZVWgODhWHtYfR4aDt/VMYjZN4RTNc+f7wTWw5gPtTY6v
	qg4V4m7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxNJ-0000000401u-0OmS;
	Tue, 08 Jul 2025 01:44:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxNG-0000000401V-1FZO
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 01:43:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567IL1hm011518
	for <ath11k@lists.infradead.org>; Tue, 8 Jul 2025 01:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl777uk8TYoa7yrfsLRZl56fRfsxTMHbE+ZHD3LEddY=; b=kgFVotnK2ssORDpg
	gLmjlCNYd4OFkuzOzbKRe8qqIBJLkn0j1WXGhNafywS1pWNGb5KE7DBoxfB1wnFW
	qjJByEcVos5+h05YWtLnduwG3JTKiOt6iJd/KYDNiER5Cce2+vgMhbuEFHUAPmYH
	Ix/kilkpPjssem6CaACpmD22o4+1ipsjZe9tjF9m61Ml7cBl2qzNsvYSu99HC6Tv
	eHuQ40rqmsVnD8PlvlvNKircE5KhWBjsJJbgEFJsxzGracJK5JihALuIkN2XTpgm
	69UmRXZceNIpswksCsWYk0veDSaTs8SFlouKfjgcs4yGQqXZTC8Ji1c+2y54G0UM
	HB9MkQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qhc7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 08 Jul 2025 01:43:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3122368d82bso5783028a91.0
        for <ath11k@lists.infradead.org>; Mon, 07 Jul 2025 18:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751939037; x=1752543837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yl777uk8TYoa7yrfsLRZl56fRfsxTMHbE+ZHD3LEddY=;
        b=p81g0a6BLZTq1oTATYayZiMA5m5YPa0sMsPWsg+yCl6o3UwKAa9yy9IwF3UA3Zlwpc
         MeyM1Dev+GtmdFAsgtKkdC384vDnSKylJSYMbv5iNmO9YEqYW8r53RLN0GtrIrQ2tqpI
         e95tFm8an+B2FjMUDCEzEgpwTSI5NDby3DyL7d5ZLUUyd3oVH8D8CupGquFevIp48rPx
         v9B+mdQdxvwKb6nsdjX5044UFxaOmYzKRGPQDWZC4GjqyT+I2uF9+69mLwMx5UjwugeB
         Fp6KT0D6FZ7enxaZJWpHDhayK7nzVnkEmH6MEZYsSdRRPyeSuwchQWPYfGIqu4Z0jhle
         9hFg==
X-Forwarded-Encrypted: i=1; AJvYcCWpExNNZd9ApZAfOfs62pBBxRJJJYbyKquO11HtHkVx1S+RLeJBHbJZaZ29SXdxOFky4VLw11k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fd9GFF4eCq3LBFDFkFSFIZ8/Lkqt2YoBE27coFsI2az8BMKG
	a0NpR1d1PGUNtylDlzVEUiToZf/fgkUOAq5tKPmLB8mA4y6WJsJLP7TFzayom0QD5A11JapgQp6
	oJNf+dV64oC2zkNuzh2ofWF100dbiDSBuPamuezRCevE42qE9R6eYy6NbPLOdFLTN
X-Gm-Gg: ASbGncue1qR2eVJEo5tDBWJqzECJBL6Grdl7HGgt5gaoPJdfZJ0Dqxx7nN6AnmXsBxn
	mribD7BUutzu1P6Us+rcIxMRUri7DQXrjiTEqQGUyi4sJYl5dy02bS6Ach9zOLM4MLKFd65bN1H
	GJcUIirzqlfvh/Hvh7Rv5SH+VLKL1H1YaR2986RnwEGSebyUauOcEO7DyyWr80ohqGRXFtanIZZ
	P3q6seMzUjpOZ4AzW+gQbkxszBBt3CZh1ZxVRy+bYFvWewpM1HcwdleALg0mCEez1T8mHsJSUJh
	Yj2EFcgIo8HxMLo+fplnY6nNXFliA12DUaRH0C/aEBPwxxUm/c8wrznUCBk8KER1BEn/THYNU02
	S9FPoncq1uItmPiY=
X-Received: by 2002:a17:90b:1f83:b0:311:df4b:4b94 with SMTP id 98e67ed59e1d1-31aac432a89mr19916276a91.4.1751939036589;
        Mon, 07 Jul 2025 18:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhKVpmGrrRXQtES7O9YfBq82/o7OuEhVZMyofryc6rLrPXsT448ckzR8EZfAtTqPI4xY9GZg==
X-Received: by 2002:a17:90b:1f83:b0:311:df4b:4b94 with SMTP id 98e67ed59e1d1-31aac432a89mr19916248a91.4.1751939036125;
        Mon, 07 Jul 2025 18:43:56 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c220bc5basm642199a91.42.2025.07.07.18.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 18:43:55 -0700 (PDT)
Message-ID: <fdb9f1e7-bf8f-4018-b0ac-ac8a70d9b8ec@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 09:43:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <5f2a900a-3c8e-4b16-bd91-500af7d0315e@oss.qualcomm.com>
 <29ba0afa-9a1b-40f9-a174-d03902ea5d3f@collabora.com>
 <8b9eb6f4-6f0c-458d-b1e6-a1893c35b81d@oss.qualcomm.com>
 <a92b3d96-0c19-49c2-ad8b-ad31dec973c3@collabora.com>
 <7b8ea9ba-02ef-4676-a4d3-d088920283c3@oss.qualcomm.com>
 <9eba0149-290d-4010-8791-d4d8d8be3786@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <9eba0149-290d-4010-8791-d4d8d8be3786@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAxMyBTYWx0ZWRfX1QK9CiHUwivz
 AWT+Eh6+hRJnTbkKxSS/eBB7b1zON8huORywKdVhuW/w8bLjDAK4G1xS7M4UwPSGn+T89Ok77ti
 vAjfHpgpVwnGmDekuN0pU3PCnkLDR2d7peZ6lWc/fYCVQ5nPhxKK5ZlIZ7AeaFLjZRwH+y88ZjD
 u/oBw5kjbXtobb5pCxDIALWduwnr7evxbIQYjRnVFkxGXcRHeKyv1D4VvGbIhcm1UvSduaRv03V
 hDynJq6m+yhsEtltNo97ypXZUY9iiIJRuLvvRys5TtlqLNYgjox35bk0tgI/n2xLj/yUfYZnnGS
 ZSf/qgwj7aMN/FrnVaf5XAGOK0Z2SPfvq4jh3iOKPfQx/7zIoNoXvDDhoDkTb5NYVFnqLIbiYr1
 WWDQj2vE5qcdcrotXQSdVaHXVqAOB8sqxFjAqi/bGwiZN5qqPXQtmFV7taYeuzxWXK9IWJiP
X-Proofpoint-GUID: eMThJHlmS7zUsHRqFGiGB-cqNQq3zamb
X-Proofpoint-ORIG-GUID: eMThJHlmS7zUsHRqFGiGB-cqNQq3zamb
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686c77dd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7V90euPs39zsmW6lzs8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_184358_366467_DCBD57E0 
X-CRM114-Status: GOOD (  21.88  )
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



On 7/7/2025 9:11 PM, Muhammad Usama Anjum wrote:
>>>>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>>>>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>>>>>  	mutex_unlock(&ab->core_lock);
>>>>>>>  
>>>>>>>  	ath11k_dp_free(ab);
>>>>>>> -	ath11k_hal_srng_deinit(ab);
>>>>>>>  
>>>>>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>>>>>  
>>>>>>> -	ret = ath11k_hal_srng_init(ab);
>>>>>>> -	if (ret)
>>>>>>> -		return ret;
>>>>>>> -
>>>>>> while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
>>>>>> _deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
>>>>> Why do is it being done in the resume handler? Shouldn't those parameters be cleaned up
>>>>> in resume handler? So when device wakes up, its state is already correct.
>>>>>
>>>> Hmm... not quite understand your question. Can you elaborate?
>>> I'm trying to understand the possibility of cleanup of hal in suspend handler. For example:
>>> * The driver has been loaded and has been working fine.
>>> * The user called suspend. So all devices would be suspended.
>>> * In suspend handler of the ath11k, we should do the necessary cleanups of the states
>>>   like hal.
>>> * When the device would resume after long time, the hal would have the correct state
>>>   already. So we'll not need to deinit and init again.
>> The hal cleanup is not only needed by suspend/resume, but also a step of reset/recover
>> process. So If we are moving the cleanup to suspend handler, similar stuff needs to be
>> done for reset/recover as well.
> It makes sense.
> 
> So clearing the hal structure completely other than ab->hal.srn_config doesn't seem
> right. I've also tested it and it crashes the whole system.
> 
> On contrary, with only the current patch applied, there is no abnormality.
> 
> num_shadow_reg_configured and avail_blk_resource are non-zero. If I make them 0,
> driver still keeps on working.
> 
> 	ab->hal.num_shadow_reg_configured = 0;
> 	ab->hal.avail_blk_resource = 0;
> 	ab->hal.current_blk_index = 0;
> 
> As you have suggested setting these 3 to zero, is there any other variable in hal
> structure which should be set to zero?

IMO srng_config, rdp, wrp and srng_key may keep unchanged through suspend/reset, all other
fields should be cleared/reinitialized.


