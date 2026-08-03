Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D436C55162
	for <ath11k@archiver.kernel.org>; Mon,  3 Aug 2026 02:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOyUSiGvN7nEzsPVWJSjQGakz4rhGRF4AjJsOR1nUu4=; b=s/5URA8jADX1rpLVlcDVJtksrd
	raD4Qq4p8HHOlL/VsGww8SqIv6ONIIIFtq/RqB6IxbooAgZ/HQbniaItP2n/2FScq+nBHW5hV/msP
	q0cF6gOIVIR3fUiyZh/0PaIouG9lfEBLCkEITyDrR2/nPHul2MmmPkwwtLrHaZT3Mt/wEkJnop2sq
	mgcTkzcb+IkEdIHwnsLnZXK6EH7Rq18ohJIST2/n2n4ObqZm7UmCDQHIuF9KWvrhCAkmqZe5aea50
	AitWMQ5Ec2wbZiNm7OpZO4+4r/nmuwBMkThAp4mw77T1u5b2rnlTi7XiGhYvoZ6mdVsPvXKTkvmuu
	0iPScS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqiGv-0000000GBqe-0BDP;
	Mon, 03 Aug 2026 02:19:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqiGs-0000000GBqI-2hcA
	for ath11k@lists.infradead.org;
	Mon, 03 Aug 2026 02:19:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LXSCB2556276
	for <ath11k@lists.infradead.org>; Mon, 3 Aug 2026 02:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOyUSiGvN7nEzsPVWJSjQGakz4rhGRF4AjJsOR1nUu4=; b=N+vU3/daUs4krDo7
	YKtUXMEHNxmDABca4kdcaA03863OmCQX639haS8TeBNz3hw9fpqNEtNwisHjqOW2
	YM+j8ZrTIDO19t32WttUUaZOlNW3lNcoOl3Y4RzjwM2/8zcPDQqqhX7dXh5t3C7W
	wHbqkyolAs7loSWe/oZe9xC/+adxCpsTLQ1MmvtXZlV/YC32P3UEcKGsL0uctxU2
	7opFQiqSp0Stn4/yovLA3JDCSCjdAvD7hX44dmYJqM1lktxT58iBW0Kx48/rmW/6
	rhi8VZDWBftVD2Zscm1mWoWmSQ5gZ/DC7DuuIJgxWlcl9ClDbxsmAIGC1T/c4L9H
	v1gMfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa383whs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Aug 2026 02:19:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e1da97175so4845189b3a.0
        for <ath11k@lists.infradead.org>; Sun, 02 Aug 2026 19:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785723557; x=1786328357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOyUSiGvN7nEzsPVWJSjQGakz4rhGRF4AjJsOR1nUu4=;
        b=STd07Xjj2G4KdIGZJS1IB0YGe7rjkcnXTTNJZRcz8hSfTOUcKFAic8MZRu6P1JYmzC
         YrZsMRPFXS0/Bdv7cjQtdwcPhJzhVrNHW6lEmsBU4CtZSsH9zuEQTwU3wzcmDXilThpX
         pa/MPil1v5GarL2gbbxNxDg6rhk5rYqZ9tqZhxQBJoyOo2ZjYHT7mxErrIodSBFmBUvL
         guZA/i/t4PktuBtalE+YKWiR37sCHO4volsL2IpPuKE8372guQnV8Ebw8pSJXuxvRGay
         PtfbN7W1bvxLxdOMtdq6der2V2EFXoaZ/gLFrNmE1lq8VXE2Lsfylcz8Sxw2cD3fKTWW
         TumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785723557; x=1786328357;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOyUSiGvN7nEzsPVWJSjQGakz4rhGRF4AjJsOR1nUu4=;
        b=LcdN3k3DgkGZ0eb6rzE9/gckaMF8Xxcaj4kefnIqr8h3UZMWIka85tY52g6Hwf7Atw
         8XMPjvmNDJnSDq7a4jvK7l9klxZHGwwy0q7mr6mW0B2LW2stRLAoOKrRJdX23e/vxLhr
         rYoo7bWPpYplYlqhfLcqy7mySWSPj8/i0zkmTuX+gutjVLz/5t4licXYuoodrAa7luVY
         vEnq83C/qknaz63P0xyAW3uTKoqcOdG90m2VlbSLGznynGSiflIdjeVFBsQqN38fHvwx
         Dy2tagBwfCVY12N4OPBBkQRwSmcOifsKSJVuuPGraZ8RoXV39s/khoxhbyC6GJzaoIQ+
         r0dQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnslfLYkLKEtvB5jhYlzrWfMTDoNMZbQge+q99IKLvMwCEAtYB6FybdYZqcUE5EGjIlY6EWXA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzATSlgBGouQkmqDzmkoa6tBSPf3/bB0AzcUCIICPYyXyTi+dJQ
	ilyVpCSsusjGsordeQRkAWwCcC5Imk8jtNhGi/qQv4HQXekiD1U9nrpkKMxOFdPBT9WHnTaU3jK
	ehFj5J7EV4nUL68cLRlfgBrt4pyUE16YHS6RVuLQmmCD5DAsd1PyXC9PHz2imGANzBJGbcxG6
X-Gm-Gg: AR+sD103M8cwtdIXlY0iJlaLWmrWUSjLPf5bIZmIi8sE4zC7Ns+zPqmi1rrGM0D/j0D
	tZhbyc1qUrV27FZmYJpC5Olck1gdhNNfNluKma2C1lA0yBgoXQIUSFqAE7ZLAxXqH1XRA4AQSBX
	f5YHaOdYZSg7GOTmK/XWXEDrfHorn2ELpatNEiq6LxEYvxN8nlVE7br5BaCRu8qh5vJG3FLLOhp
	lvlGGzfL8ub9mLAAuSl6nTVVKrKmc6v62nk/iBZ7ZD6mFXtXF/8tt0hFqWQWSsRBAK4rMDzTah9
	1+BRlG9b2sZJaJs7BgTWdL5kaJYHJKl0wvImMrE/a/DCkFteTuUSvWzacs/t8sEmmTYu+Io68Ai
	moEAacfyY2R/9OZdVBYbb0ojbJdjR2558m2p87j4N9cO/fTObYBUGakiDZ8HBrjVxGq9pfAmTyQ
	==
X-Received: by 2002:a05:6a00:3e1e:b0:848:6720:6fee with SMTP id d2e1a72fcca58-84ee4909218mr7113927b3a.40.1785723556987;
        Sun, 02 Aug 2026 19:19:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1e:b0:848:6720:6fee with SMTP id d2e1a72fcca58-84ee4909218mr7113905b3a.40.1785723556566;
        Sun, 02 Aug 2026 19:19:16 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963dc08sm2914848a12.6.2026.08.02.19.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 19:19:16 -0700 (PDT)
Message-ID: <fbf43d4e-9e59-4bbd-b1ac-aa3a9e2fc123@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 10:19:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: reset ar->num_station on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140306.133718-1-nico.escande@gmail.com>
 <4160b5e1-c82f-4083-aa36-18e4a42f909a@oss.qualcomm.com>
 <DKCTQGTORU5H.H4ANSP32B0PU@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DKCTQGTORU5H.H4ANSP32B0PU@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6ffaa5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=uyKc_MerV7-7T7EwjgEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAxNiBTYWx0ZWRfXxwrETi9F9cFb
 gACpbQ4cUdSOh37cA1hFd6nIgXwG/dv0p8XRuR/dKzG1Ool+dNoMxLAbAQUAMlIFUFbdywmfEP6
 zvuAYMflUGyKWNR82BlLV3CXgRA4jXc=
X-Proofpoint-ORIG-GUID: b2SWakuZsim-fx2ydUGecB9TtbldwWX-
X-Proofpoint-GUID: b2SWakuZsim-fx2ydUGecB9TtbldwWX-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAxNiBTYWx0ZWRfX2c02f2Xld4Vq
 CFhdQldO6L2pNc3v9AcQQJhs4IJe3xkABmC+n3xC093oNDBno5xJ5TMDBQWK47uU0Tv/mlmDpVU
 G1QsjqT4SxUa2eZY5pLiCXv+3GUq2XRcSOJCT8JcwByqDytp9oarI8jd9+i+vXt7sh+aoufl/TN
 ddPS6yeO8jtTdh1vTqOFl46aurLLewxHt/cvGUhfToA/fEx2FWdQ3VaT/1EL3anIg3w0ipPqalV
 C92WK/KDQYfDTe80np9nSrruHQrmTp9mkNUOagO35Vl3o+nfbXy0Wzf74CCCzOQSnRyS9qhRl9o
 3XbtvhaIdKMdnDU4C+797JYS9FHH4OqcLEGVmq8+xXvCAweinRDo4YMq3WkNyXK+CSeRqZ3EEBX
 EvwCukK4TnpQ+ktLGwCK7crePea8lJ51cToRaZF9bU/T8dsUzAJNHWbK/CnNg7NgOBQDIob+/Aw
 ikg7pILAMseH/IAD4gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_191918_751765_C7F5D62F 
X-CRM114-Status: GOOD (  26.89  )
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



On 7/31/2026 10:25 PM, Nicolas Escande wrote:
> On Fri Jul 31, 2026 at 7:41 AM CEST, Baochen Qiang wrote:
>> s/ar->num_station/ar->num_stations/ in subject
>>
>>
>> On 7/30/2026 10:03 PM, Nicolas Escande wrote:
>>> When (multiple) hw restart occurs, we end up in a situation where we
>>
>> by hw restart do you mean firmware crash and then recovers ?
> 
> Yes firmware crash indeed.
>  
>>
>>> cannot accept new stations / mesh peers. This seems to be the
>>> 'num_stations' in 'struct ath11k' that did not get reset properly in
>>> this case. In ath11k_mac_op_start(), it was indeed the only accounting var
>>> that did not get reset so let's clear it too.
>>
>> the root cause description looks confused to me: if it is firmware crash and recover, we
>> should run the path ath11k_core_reset() -> ath11k_core_post_reconfigure_recovery() ->
>> ath11k_core_halt() -> ath11k_mac_peer_cleanup_all() and in that function ar->num_stations
>> is cleared.
> 
> So about how I came up to this fix:
> 
> When I first saw it I though I would be able to reproduce it using the
> debugfs simulate firmware crash feature, but I was not. Then from the logs
> I had at the time I noticed that there were multiple crashes back to back,
> sometimes while still recovering from the first one. I think thats why I was
> not able to properly simulate it and find the race condition leading to this.
> 

do you still have the complete logs? especially the time when you saw the back-to-back crash?

> In the meantime I wondered why we hit the num_station checks and not the
> others like num_peers for example, and found that it was missing in
> ath11k_mac_op_start(). So I made this change as I do not see how it hurts,
> and I've never hit the issue again.

Yeah, the code change seems safe to me. Just the commit log we need a second thought.

> 
>>>
>>> This avaoids problems like those:
>>
>> s/avaoids/avoids/
>>
> [...]
>>>
>>> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
>>>
>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> [...]
> I'll spin a new revision with all the feedback taken into account at some point


