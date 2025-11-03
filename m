Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D8ACCF9F8
	for <ath11k@archiver.kernel.org>; Mon,  3 Nov 2025 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3JXCgZLgZt59euN+7SYtL4D7oNSh6Gr61wJkEKqtQ8=; b=alrM/wZ7va04ZpA3KrX3LrpSQK
	WPlk2arKXZoSwFDA1Hsx/xdW5OC5RX1qPwrwafHHMv+oVUXStvTkiTBHmJJknSjb0KD1OwvXcOloK
	970AYGONlIf2kflzU+Xq92xlckm+8F97raKiW9QXffRfWMgr6T2lt8DTdCN6tzEEds5McjAoqY/9y
	FEI2XOQJAd4AjbogVaEfEbMqEfBJdWGbm0Y+P99kz5u/7fNUIRtekhNxkT4L5WBxt7tk+pJBKL1xK
	0tujT+nH4j4aaAEezuXkwRg4ySNszCkoo1vUk6ERDR5pIqvTNxt6xjmBX5QSfssxXANmGj6v5nnR4
	9MR2HuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFp8B-00000009N1a-3oHg;
	Mon, 03 Nov 2025 07:37:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFp89-00000009N1B-3zGd
	for ath11k@lists.infradead.org;
	Mon, 03 Nov 2025 07:37:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36IkmB2247306
	for <ath11k@lists.infradead.org>; Mon, 3 Nov 2025 07:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3JXCgZLgZt59euN+7SYtL4D7oNSh6Gr61wJkEKqtQ8=; b=HOQZKHdkBaAoj4gT
	aHCPWykKvtRYa6t+42YS0My/FrLRB98mZe+PeakIbvw0LL8iqHuD0SoWAd+R+TzK
	Ppju3v2zGVsZD2oeK5lUIJwRJGQaAlKNfReWruKsCYkhyov6EUisWRUanAUOnuIp
	8W5n9VQEtrVWd29+6Cgi/4wmgYzExE3OcAylVMRaeV5AAfbD9GoXSq3RTKtxwrZC
	HuzknQ5IFBeCTtpE4tDjs99AxKeD6EdoJsgT7QWRmLTwN3r685gBylkl4s4HoMYX
	4Ko/Ph09lmXFye1xp2HzDQ69lLRpbQQPKy5g3CaM8Uoa+ZR0bJ6oh0TfxbyrnLGz
	5Njtcw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6q0yg6rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Nov 2025 07:37:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2958c80fcabso29338625ad.0
        for <ath11k@lists.infradead.org>; Sun, 02 Nov 2025 23:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762155453; x=1762760253; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3JXCgZLgZt59euN+7SYtL4D7oNSh6Gr61wJkEKqtQ8=;
        b=jIS1d10oIVUEdvlC+dB/uOhH3XiDCHP4LG+GFHfPN6/hL2bcgWXDMoIU0pL3bf0UQ2
         phdbDEmoijgUlTtxwJbdvuLAiHcjDadSFy/cqezWW5GKQthssRlQ1lmvtThJ4uQgkJOh
         NVBXQ0LO87Z87gfO8qOsVlqplNE0BEGmP3LBtx6RLs0uJ3PRcFpDu0kDl16q9ht9P15e
         R7TbF13HZZAE8JrOKZuO6YB6m5SQWUItKEdR6GrdhEFn4FpHTLDF9AIEJtDhFDfH+gxz
         9NNnT8aKfIYvemP03wk8V0FtDpgrf1boWINuCr/TWv3kB+vzvvJ2upifaEpwO4ckb3tS
         ZU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762155453; x=1762760253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3JXCgZLgZt59euN+7SYtL4D7oNSh6Gr61wJkEKqtQ8=;
        b=GrC7PWUom+Ee8rqmxTqdWmvmM5ypnLw9FPVQouVKcUuu7tSohB9DxBhwxFN6QaOtTN
         dn2/QKsNzuvyEDDL4SeZtIVJzz7qRZRL4ZTbpO+P1zTVhsbJlT+OeMH/fVFDttjwsc2J
         Bc/1zoj0QAzh0UMQadcjj7qz1V3VCebm4Y9rieejQ/ouhnQW7Np0EdVIi+qeCT2/HD76
         ZpgmIGBnGBWPiE/dekMTsoWy5ZZh9dqC7y+jf9fERcYzA0jJ4YkfLRCflnSytGwJW9DM
         /LQpbEWQlsMmGxQ8MVoUkcIh05fb6nrUzaP6bAmVWGgdmSVZ2eLkslUtA/kMg/76YZLR
         RXAg==
X-Forwarded-Encrypted: i=1; AJvYcCWjy6EWxRflVbhoxLTXtkcJpSZFM6qHPMUjgCHaOnBGh0Nn//Vztjdrmigq6S4+wTGJPWlEY+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB4HXSrpXsBMwu0oY+XLTkPEkS1R8uasIdDe8zYn0ZWeYjea3Z
	XTYZe2ElnyWKn70IY0HX/5pzvomdWnSdNkZmAMFipoldxpARIkHoqPG3qcoTcmGb1F6kGU50Z8Y
	qTsqqZguDUhsPA0EFDcvctmnGAAqR4C28/1wlRMlLJ530QS8kREDgqugR8bAR1fLH
X-Gm-Gg: ASbGncvjJPvj1mU5YeMBbLF+Km1J1l2VoGcJ6DelUfTyWZ/ZvyhL++AiggF46h34Z34
	vrex4MGyiyv2e68x9nNwE3iJcso/6NuehnUzS2huVHtQSuWdZ/d9MicDn2wPUGTPs6OxXeGu9Pb
	0Z3M4BO8J3Q0nwqsmwhaJn+ty/46jHuBQymbScQANp1imxbR0S2jKoIDYqSPHtOO0iM3iyYQaXS
	6CBuvkzSSUiom1LoAN0wArg5oaiE+6yv+47lVxlKSVZs2UcfuODz+NzQwiI1a+QzHuaygXBtHoE
	mptiMjE0qmYZollN04jLDTCkIE/EaswLyT9wBsfekHp8FZANrpoc+xeXAipQFs66vyVi9Quc3t3
	Jzfd2NLy+rE3Ux925eWyRTa0=
X-Received: by 2002:a17:903:2302:b0:295:557e:746f with SMTP id d9443c01a7336-295557e7a25mr96007395ad.32.1762155452791;
        Sun, 02 Nov 2025 23:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGoYjUzwXxifSe05+L8+ZuGbe6Sp1Ukl+bahFZYvc6hkeGLR5aBvmkwawKJdsuKjuz39BQ2A==
X-Received: by 2002:a17:903:2302:b0:295:557e:746f with SMTP id d9443c01a7336-295557e7a25mr96007145ad.32.1762155452329;
        Sun, 02 Nov 2025 23:37:32 -0800 (PST)
Received: from [10.231.195.211] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696ea51sm108400405ad.57.2025.11.02.23.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 23:37:31 -0800 (PST)
Message-ID: <dbb7c7ae-1c8e-4b7e-bbb5-a7866d173468@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 15:37:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/6] wifi: ath11k: Register debugfs for CFR
 configuration
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
 <20251030043150.3905086-3-yu.zhang@oss.qualcomm.com>
 <0b4ce00d-78eb-4b5d-88b5-7d5b8de663a0@oss.qualcomm.com>
 <0a05ccf8-8850-430c-b008-52b3bc2df431@oss.qualcomm.com>
 <5d0e6d7b-d127-46be-8985-9be33a490aa0@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <5d0e6d7b-d127-46be-8985-9be33a490aa0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NYbrFmD4 c=1 sm=1 tr=0 ts=69085bbd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iy63uO9faCoK6JyWAJUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: pl6jDjs2MoXsKntKoi58s-2qVm02PF3r
X-Proofpoint-ORIG-GUID: pl6jDjs2MoXsKntKoi58s-2qVm02PF3r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3MCBTYWx0ZWRfX5qKze5dNugxa
 S2llWUdyy3WUqdOXcAACrbWQnys1TVeQiENw5UMixnyHESZ+chQRixy+YbUb5o+lQoJhs5/QgYN
 iWZ/hYamaQHKwXnTv2g9IXQclTplbQJuRGdNGAyEUYqMd40/aORMdtuAi5rLEIdvUnBJsk+Jb2l
 xpb+E4PpxyqpVIYfn2wr5sKY8AdGJ6A7rSCZlhZ+gt1Rsg+Qcnql1LWxhXgFW0B9dp6xTrEoEN8
 i2UjN2NoD8TmNrWnd+rt6TXWxvROBBQ0TExucrqbaIjWHCwORXZzmUXiUjehJZHnDc9cDs6QERn
 WYkJJwYb33eVmwUFQBkRXJImxAHpbjZk2H96L9SUB92wF/oHxgr4u5yLGj7zRg0piV/VIdRmyy7
 oVdQNWljM5uMUDV5iBaMBqE4xzwGLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_233734_016693_84EEF04F 
X-CRM114-Status: GOOD (  17.45  )
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



On 11/3/2025 11:14 AM, Baochen Qiang wrote:
> 
> 
> On 11/2/2025 5:21 PM, Yu Zhang(Yuriy) wrote:
>>
>>
>> On 10/31/2025 10:43 AM, Baochen Qiang wrote:
>>>
>>>
>>> On 10/30/2025 12:31 PM, Yu Zhang(Yuriy) wrote:
>>>
>>>> @@ -88,6 +275,7 @@ void ath11k_cfr_deinit(struct ath11k_base *ab)
>>>>                ar = ab->pdevs[i].ar;
>>>>                cfr = &ar->cfr;
>>>>    +            ath11k_cfr_debug_unregister(ar);
>>>>                ath11k_cfr_ring_free(ar);
>>>>                  spin_lock_bh(&cfr->lut_lock);
>>>> @@ -140,6 +328,8 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>>>>            }
>>>>              cfr->lut_num = num_lut_entries;
>>>> +
>>>> +        ath11k_cfr_debug_register(ar);
>>>>        }
>>>>          return 0;
>>>
>>> miss _debug_unregister() in the error handling?
>>>
>>>
>> The documention for debugfs_create_file() tells us:
>>   * NOTE: it's expected that most callers should _ignore_ the errors returned
>>   * by this function. Other debugfs functions handle the fact that the "dentry"
>>   * passed to them could be an error and they don't crash in that case.
>>   * Drivers should generally work fine even if debugfs fails to init anyway.
>>
>> So IMO any failure to create the file should be ignored.
> 
> Maybe I was not clear ...
> 
> I was not meaning the error check on ath11k_cfr_debug_register() or debugfs_create_file(),
> but was meaning that in the err handling below it, _debug_unregistered needs to be added:
> 

Got it，Thanks, will update.

> 		cfr->lut_num = num_lut_entries;
> +
> +               ath11k_cfr_debug_register(ar);
> 	}
> 
> 	return 0;
> 
> err:
> 	for (i = i - 1; i >= 0; i--) {
> 		ar = ab->pdevs[i].ar;
> 		cfr = &ar->cfr;
> 
> +		ath11k_cfr_debug_unregister()
> 		ath11k_cfr_ring_free(ar);
> 
> 		spin_lock_bh(&cfr->lut_lock);
> 		kfree(cfr->lut);
> 		cfr->lut = NULL;
> 		spin_unlock_bh(&cfr->lut_lock);
> 	}
> 	return ret;
> }
> 
>>
>>


