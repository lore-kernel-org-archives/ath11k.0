Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BF9CCFA02
	for <ath11k@archiver.kernel.org>; Sun,  2 Nov 2025 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAk65/6oxj1521SvgSULDG1z7UA2kHEPOczJdwu/uSw=; b=jtYBbgSvoDy+w0NJ8QpvA7CmgH
	BGWJLELptU95wD1MrLyqmQ9O/TMf3uzregBZrD/hLpCk56YLEBFMl+nD8jAg5LCzrOoyGMYqWcMZS
	1hBA9BvEPDyMUHc4eKYitEiXOhwNEc02GagKbi9ap4ZyiCJyBLqIa5Sr88trpXbO8WkaBjq36uUde
	GyAOY8OwAFzM3rUCy5ts9uSZNFAlLj5rz/LB8KXuR+Hhn7sxc/8O1EFsyXoLucKN/8hWvJu/9L0zR
	MIG+vEYAd7hXiTX678k/i2hjFdoNW9E0MdB/7y+8fCwdWXdhYOCZj3E1vE0HGYrL6dBO+VI7r659K
	OW8QxXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFUHe-00000008Qg7-2yS2;
	Sun, 02 Nov 2025 09:21:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFUHb-00000008QfV-0WAM
	for ath11k@lists.infradead.org;
	Sun, 02 Nov 2025 09:21:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A25qmZX3616328
	for <ath11k@lists.infradead.org>; Sun, 2 Nov 2025 09:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAk65/6oxj1521SvgSULDG1z7UA2kHEPOczJdwu/uSw=; b=RAfF+9CWZNC17iOv
	nqBHywMnDHORhhei9L/R2XqBT2VUNligWR3myLxbxcOmto/7T7ZMtrtvHllilCDd
	fVOVNNnv0kGpnfgjgB5aQ3xbWhleyrUGUrO39Am+ASuZbnZhfbsAk+oWR+0R1oWP
	ueQLys7RyuNx6pdtLmtaMQhU+K0Pab4lSsheheVZxX6kEAxFPmgVOVQTnUSQGJdQ
	bdQGVNHmkJ28RlC0vN1x+NEu0CCE191Tv30tsj1zOMZ++wFa76sg4zwQJ6D0Wn3K
	avGIJnraARoixUbIfKzAtkseD0CSsHltKotmNDIjAEuYYgVoopLIN79YHinvGDVQ
	21O9Bg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a59hhhxq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 02 Nov 2025 09:21:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-782063922ceso3223728b3a.0
        for <ath11k@lists.infradead.org>; Sun, 02 Nov 2025 01:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762075312; x=1762680112; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAk65/6oxj1521SvgSULDG1z7UA2kHEPOczJdwu/uSw=;
        b=jMl1oWZGOShuGettFfw4iAlEEIoqAFomelw28cdadO4YiJM3YsG2txuG/wrgIxgtPm
         Y8yGJ9bQjoxSkL9QTms6nzzzx8Kq65mD/e/JEYDEyB6iyDdASI1cTCRsGuZgsHTJu7jp
         bXMKMeRSaEkRhZ6kw+kQHRAaJDArOugp4/jmxlYVUhMtLEmCrl9xk5jBmYx6R+jVVdRz
         OY/EXlYhQZaxG4bkK+gG3FuES2Y6u6kwKevZnWZnEiwSGfk98f7lnmDHf3jmgAj8RrKo
         4XSjutZQBTlwLtw8Ni526mYU1/4oQ2s7J4rzcRembrEOHGdvJXSjiEDivz6G6ob3A1W1
         WgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762075312; x=1762680112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAk65/6oxj1521SvgSULDG1z7UA2kHEPOczJdwu/uSw=;
        b=ZqQrhzH11orjfpa350WgpO3mulj4cUH86uQrFDSqqxZ2vJ0ga03biuJtglTjckT/V3
         a2mCWs2FYhm6wVnIZMqvPp72urd+wboO9b3dKBu4yQ2p7j37VKK18VxQPZvS1r/vAMa8
         yueNLduSf6RAe3Vg5k+NMxw/BzRHXvfEtKAUN5CkGSKLn3lobcPrmXaNV1p3WK7/NUQ3
         yRzEz0HTmuAts+xZF4jcKAvKcX5jqaiTxmt5iBby/IwpFr8AAakyQBGWpmCWpNO9ro5O
         +aMLSrEwc/DxGSmot4KF2P/hhyV9QAvlT+o0JUptpUpi7tFR1mUB6GNNKMv8/CyqAw1G
         EgfA==
X-Forwarded-Encrypted: i=1; AJvYcCUrfyq30Zw61Kv43usE8QZ7OL8z9/2wSNItbgsxYp1RvVonLH+wfwcfUivONPb5E8PwUHYOVm0=@lists.infradead.org
X-Gm-Message-State: AOJu0YycvO60CScapkvA5zmCKIJnhqiZ7yRjGGs5Bvej2P2GK82XB/Nn
	bKKRtCeYs6J4DUq34quvfajKkmmfU2yINz+3X8tOZ4m7YhyjwlmhEVwDntd+0ueLsbgRiq7ThFy
	mN5w6tGt3d+PPVY5mJZMwn+RsyWWUTZ5eIr9Yby+EdC7iqALMslhffd8Ufd+rNCKLwmlqtul+
X-Gm-Gg: ASbGncu7OHDOV7haaX/P9v9yAkRP7cRfzQpBkn5D6jRuRCiB3FgwrcAHsWlvXY5kwNh
	zw+DdS6n71eTOb2WVVWs5EMxDX9tLp6YZ71Bg8ojDyjvbx0GFijnIzD8QKqQJCync27td/vwV6W
	W95IIyUDpLU67qX3vERLq7kcNUbfjalXqVe3PsjL4zNgurfPOuohWn3lWAY43BIqXM43w4IAlQG
	Hw++a5pbTzpYSUKNd9dzZ08rgHaebz8yGB6qkNAuohGURs7sOX/ZVEj/wXVkPclqETUbd5yoAXz
	OYdx6EhCiBP8DlH1GqvTnMt3MsoTRzlJW3lp8JU7J6wDmEKQsTJ6rEX+8ob46qhXu9LXt+QKTjC
	K/T2jZ0BF9wyeklDiPozecbmDmgOjzm8ElPHFvsgZ6VAPBUifS/lBMoVSfllfHwRG
X-Received: by 2002:a05:6a00:4b4c:b0:781:16de:cc1a with SMTP id d2e1a72fcca58-7a779eefde4mr13299236b3a.32.1762075312397;
        Sun, 02 Nov 2025 01:21:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcmjVi+40dr9p6o/3hoFcMaPlDSC/vKfYhfoR5jnlpypTGY/GIWuBn/J1+Vo8ouKI8w+WRrw==
X-Received: by 2002:a05:6a00:4b4c:b0:781:16de:cc1a with SMTP id d2e1a72fcca58-7a779eefde4mr13299221b3a.32.1762075311827;
        Sun, 02 Nov 2025 01:21:51 -0800 (PST)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e862sm7580857b3a.8.2025.11.02.01.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 01:21:51 -0800 (PST)
Message-ID: <0a05ccf8-8850-430c-b008-52b3bc2df431@oss.qualcomm.com>
Date: Sun, 2 Nov 2025 17:21:48 +0800
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
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <0b4ce00d-78eb-4b5d-88b5-7d5b8de663a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V6lwEOni c=1 sm=1 tr=0 ts=690722b1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RlJQG4Jwgf-QiIBLNHQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: lQ_OqTbcQyFGXxiS8Mowrgr8rtibXtt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDA4NiBTYWx0ZWRfX4Zs7CSzSUphy
 tAlfLW+lXiF9RodRUizO+ohMOYRNm6hrrEYRDDiUre0Nz4jQ+s0HW2VzRQk6ux4MOiFdD5UC2Ck
 2XC3cI4Vhw+E4Rd+eVyGZx/skxsqEJJPSu7lTMer8ZuBj9KlGFnq49kU75eB5lKIW/77DpQnNgU
 0RHwPm5yLw0DkaRzvMlJ4O115DDxFb2imL9W8hmE31GoksrXO6S/XE4gRdKk6Dp7Y1t4RoqOf53
 W6xBoqAxYj1DzSkG32m/qa0s1gfzfvVt2ZhDmDJvjjx7Q89IRPd8N1eJtJid8ZoFIZQ6JexEVAR
 k+xGaRCwvu0Sxqo4E9lK6AgOsgHXnNoakZ/okh0mscb0MUCtAQ5PQ7QUNcQ4HbF2gflsMGwhOlM
 3DnL6aOJGKOqxUMgfhMNvVGDvURpGA==
X-Proofpoint-ORIG-GUID: lQ_OqTbcQyFGXxiS8Mowrgr8rtibXtt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_012155_296313_C42BB73E 
X-CRM114-Status: GOOD (  11.75  )
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



On 10/31/2025 10:43 AM, Baochen Qiang wrote:
> 
> 
> On 10/30/2025 12:31 PM, Yu Zhang(Yuriy) wrote:
> 
>> @@ -88,6 +275,7 @@ void ath11k_cfr_deinit(struct ath11k_base *ab)
>>   			ar = ab->pdevs[i].ar;
>>   			cfr = &ar->cfr;
>>   
>> +			ath11k_cfr_debug_unregister(ar);
>>   			ath11k_cfr_ring_free(ar);
>>   
>>   			spin_lock_bh(&cfr->lut_lock);
>> @@ -140,6 +328,8 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>>   		}
>>   
>>   		cfr->lut_num = num_lut_entries;
>> +
>> +		ath11k_cfr_debug_register(ar);
>>   	}
>>   
>>   	return 0;
> 
> miss _debug_unregister() in the error handling?
> 
> 
The documention for debugfs_create_file() tells us:
  * NOTE: it's expected that most callers should _ignore_ the errors 
returned
  * by this function. Other debugfs functions handle the fact that the 
"dentry"
  * passed to them could be an error and they don't crash in that case.
  * Drivers should generally work fine even if debugfs fails to init anyway.

So IMO any failure to create the file should be ignored.


