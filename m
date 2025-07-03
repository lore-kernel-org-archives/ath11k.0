Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2034C77B7C
	for <ath11k@archiver.kernel.org>; Thu,  3 Jul 2025 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLk20dvf/JzTQp3p5RGp6IdlyZiyxeKpevcy7m6Fu5c=; b=JPken0Wzmr58nqQxPIiuTJATV2
	EUO5dc1QjEFJikfPCBLUjITi463BdifzW6glrmSHeMvoIN/ox2PdXyKwC+vsVToOQds+VIIVPuFXw
	R6BEu/nt5pMIw6q6bz+CJYRpuK0DZ9tKfl6yqo6nveUUzVqW41EUrUd3rAxZ7gOG9EWhv5DOf9Ywo
	4mKqVTaLaobrc3+uKbfS+Em35rH03T4MxRpeHL/3PwuIqNW/86KPScrQf2+wZzZQ8kwI3nQgVKke/
	sbXk9fVLggXHR6mckM7DZ2EKbNacNzVSEii8bUtsLZkBVn4jitoPJd+OmRWs5fdvgFos0Tfk556SU
	24TqSphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9EG-00000009yg1-3l1Q;
	Thu, 03 Jul 2025 01:59:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9EE-00000009yff-0mha
	for ath11k@lists.infradead.org;
	Thu, 03 Jul 2025 01:59:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562MhBMB002651
	for <ath11k@lists.infradead.org>; Thu, 3 Jul 2025 01:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BLk20dvf/JzTQp3p5RGp6IdlyZiyxeKpevcy7m6Fu5c=; b=KdFRRABiqaelYO9h
	VB7lhgFrWTYQfNViFRaotOMOHThR4Sh6lZzaXDhIpXzGJSgBlOKkgfJuRvF+RsQ8
	Fpj7kgEbXjs2B/zrRtgvoEAYYeCW+JxbBRcVKTrSX6722rYERAvQOdWuYVBnL/45
	2wBqQUaFwwRf8TSZgGDwbfYahF2qutfudGG4tLkUqnzFCYkt5IhdJ+L/S5vxn1up
	ud9VN9jGVEqnXZvFcbg9RvF6p7QOEUusJA12gICiUZrz+eQHgfXaWk3VfvLhHOI6
	cERCQV7MADw//NL9OEXJwW+hbNzlBeGwWO6Y1WhjnOnVdh5mOYxsAbbvKW2wm46q
	J36L/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcxptd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 03 Jul 2025 01:59:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so46545535ad.2
        for <ath11k@lists.infradead.org>; Wed, 02 Jul 2025 18:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751507948; x=1752112748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLk20dvf/JzTQp3p5RGp6IdlyZiyxeKpevcy7m6Fu5c=;
        b=pkvj8iDvFyCoVJtU7danJCxSuS2kPUFR+1yK0iGDEuar800WN6qITRd9lN7F7qWU4X
         nfp/OJgMiS2EnKjvXVrpUK61PVzeg+uLETUu8IyBZedVqKwPRDQLbHeVopYTS4YV2UKe
         LTh8oZw7PCAAOuyw+pz2s9VqAEtnpwo4hMJM8vyCXsRfcTmRqs0dUvhAxW6TLy30Qr4Y
         ognq/juuyRbtPd3cp4rQvKzFucLDh6Id/b3yn/GW8Z2T9YuonDWYeTEQJUavfhKhrPrR
         lmK2ZWoTXXWeZQR2xLi1jLooiofoL18kiXg7R2K3rqn/FvoGgs1jK349qtKDdOaPdRBs
         Tpsg==
X-Forwarded-Encrypted: i=1; AJvYcCXcQ3z+AqyCFqFyAaJsNci5dmMu14L0jts30wt3NqSc2Gny6dz7NG5Y5+b8/X8J0iwRFD9SSug=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWAnKLQuMqAl9DVRkb8KJbeVIbNu0sL5rpeHYpWdd/7T2Lu5dd
	Vgm73EdHu8erzwRS2FzimfLh4x8ydSfylsCJ65J0GZb1Vdy3nQ3YMKvzyv446gxIU72mB1O1ZkL
	3gAmVHDRe2HpsM3dj7L+3uh0WJ7+2IhmLi8Hwfc1jIrgzrGJWHyzazTP45OP1wh2o
X-Gm-Gg: ASbGncvmKj+Qao6FFmRQ2yWIS1/dCIW6zUjvxbWTSvhA/O5Bj7YKWmk/yyKhrum5w28
	GnBoMe9o7sTif4JhyeWoR1N48hzzdypiqzK/8ywoWInNMuOsQlnsknlxSeXkqEOw38UMUQnJ1gC
	EbvVPmyBbfG25aKRNQMlzuizz4O8dxvOKyb2y+pNnUfdx4VSfZcgyJD44xT9ogXkeU1eGc4Ypix
	kz611ukI2zaaB3bS5eDb4Ay9+QXgBZFcDZKhe/fZYF4blaX3EihnsqFGs8S4WU4omGByB5ALhAj
	aierZmRLhdaj/s8X3M2kBQOxrdex8syLcFwTx5CjsOBURb4c6NaJ4oAZETmtBqjX7SytrhCd3fB
	HzlbUccRlhTpLgBk=
X-Received: by 2002:a17:902:e747:b0:236:7165:6ecf with SMTP id d9443c01a7336-23c6e570620mr92655845ad.38.1751507948076;
        Wed, 02 Jul 2025 18:59:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjV6F4zIrWa0LJM5H7lesl+BJIP2s5KAmtJeAQvLyKOvf6L5XBeXUE/9AgT3s1eusgbYs4MA==
X-Received: by 2002:a17:902:e747:b0:236:7165:6ecf with SMTP id d9443c01a7336-23c6e570620mr92655235ad.38.1751507947568;
        Wed, 02 Jul 2025 18:59:07 -0700 (PDT)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7ab2sm138723935ad.177.2025.07.02.18.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 18:59:07 -0700 (PDT)
Message-ID: <8b9eb6f4-6f0c-458d-b1e6-a1893c35b81d@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 09:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <29ba0afa-9a1b-40f9-a174-d03902ea5d3f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JpaIS-oOyTIGeRb3KP14_wEqzlLJ2xmR
X-Proofpoint-ORIG-GUID: JpaIS-oOyTIGeRb3KP14_wEqzlLJ2xmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAxMyBTYWx0ZWRfX7xZOP6FBljnK
 t7bFdasFOc7XaIJTsL2c8IG+EB1Mmsb+9bjYZSCBMTQ2pqG3aMg/e/WrY/mbNZcge9ruQYoNLHD
 tS9ydggMQHhUrmUenZ9LH8P8WBadlgw1VdVd+87hwU8VXkckqRDD/r4svVrQcVU2CkMGyajwx23
 0gKgBQgmyztJ5wRr8jpBbBvJEj3Biy1trpgjjH1MNXoDxQeqlLFYJ185+d3Bz4LBG/+Z9WyCjJ+
 qwaMY4ZZGCzFlU4gK2FufwOrTEL1lMzVJkXAU+hBEd5qn5p55J2k26RMr4JOHvqgTwI5RR4CJAU
 I/OCOG/qnKqNLCmxFs0HUEfYd9HgKpep9sqNqU8+P58CUwlw2HdHydOVSg0XU4oTXlEbukDfh9q
 5Xe+5dplqaRv4EeMd+qdrbhRjIG9uuLjCMuTxz0Vs4dz0sxEt1Gu3CBYZ6yLoPzIMtFlyTyj
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6865e3ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=unw2bX-B-0ReeQHatd8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_185910_243386_2F8521B4 
X-CRM114-Status: GOOD (  29.03  )
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



On 7/3/2025 12:12 AM, Muhammad Usama Anjum wrote:
> Thank you for reviewing.
> 
> On 7/2/25 8:50 AM, Baochen Qiang wrote:
>>
>>
>> On 6/30/2025 3:43 PM, Muhammad Usama Anjum wrote:
>>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>>> deallocated and there is high possibility that we'll not be able to get
>>> the same memory allocated from dma when there is high memory pressure.
>>>
>>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>>
>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>>>  1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>  	mutex_unlock(&ab->core_lock);
>>>  
>>>  	ath11k_dp_free(ab);
>>> -	ath11k_hal_srng_deinit(ab);
>>>  
>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>  
>>> -	ret = ath11k_hal_srng_init(ab);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>
>> while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
>> _deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
> Why do is it being done in the resume handler? Shouldn't those parameters be cleaned up
> in resume handler? So when device wakes up, its state is already correct.
> 

Hmm... not quite understand your question. Can you elaborate?

> I'm not sure why it worked every time when I tested it on my device.
> 
>> avail_blk_resource, current_blk_index and num_shadow_reg_configured etc.) inside the
>> _init() needs to be kept as the later operation needs a clean state of them.
> So should we just memset these 3?

more than them I think. We need to take care of all entries in hal since current code is
memset them all.

> 
> 
>>
>>>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>>  
>>>  	ret = ath11k_core_qmi_firmware_ready(ab);
>>
>> the _deinit() is still getting called in case ath11k_core_qmi_firmware_ready() fails,
>> making it a little odd since there is no _init() anymore with this change, though this is
>> the way of current logic (I mean the hal is currently deinit in the error path).
>>
>> Thinking it more, if we hit the error path, seems the only way is to remove ath11k module.
>> In that case the _deinit() would be called again in ath11k_pci_remove(), leading to issues
>> (at least I see a double free of hal->srng_config). But this is another topic which can be
>> fixed in a separate patch.
> 
> I don't think this is the problem as HAL is already initialized when before the system has
> suspended. So by removing deinit() and init() pairs, the HAL still remains initialized. Or
> maybe I've missed something?

Yeah, it is OK in normal path. However in error path we face issues.

> 
>  
> 
> 


