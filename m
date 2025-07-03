Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE09C83F0A
	for <ath11k@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=JKAeLeTbqQuJB3heyH2gMGRy5K
	z9jHGpOjlXbKpu0gKx76IcZjb1pMLNdE/zUrksG1y6Xl2ChLfNLUlWbmmrgqMchrsU9oB0QLo2Dq2
	n0KQ8IQn+LljLHl3aEWmzcYK441TYtlVKUNjKAViZSLDFFowd2rMqHl+RnnLdnQ4v26ZMBibvG0Dt
	VhSp2NZ0kHkFOoaoMW7FECHIg/PUf+Bc+TNH0+SRsQOFVn8szF83nLsTNXMEGUsu4EP4fdvdXAW7U
	gwQaQZpVL3vcZVNy0aJSfrsdr/DQusGi8zG6uKjwimlLWKikvc0FhIXjm9mg475F2gh4SET7uESy2
	qiRPzs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXr-0000000CqnR-0IIS;
	Thu, 03 Jul 2025 23:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSZX-0000000CkBN-04YE
	for ath11k@lists.infradead.org;
	Thu, 03 Jul 2025 22:38:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563GI21l007218
	for <ath11k@lists.infradead.org>; Thu, 3 Jul 2025 22:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=CWyUayD+8Bux6HrS
	CXSgMVfZdWOYL4PH1XzrD0XHMeNGifHqaXcXt3dSsVnScByMnmAkiQRTpL7Rwruf
	tkl+NV8VC8/mMl2p2UjTD6e/32uJajCEkw9ysfYert8V9Qs/l9Ij2Ztb0TW1zjn5
	Hi5Oic5NDb728rQvotIGsYRtInx+ZUoxbHQzTnOu6VLUFqldf0wY3+3zwsg3/53O
	Lo5F93pr4Ihri0ZI6Ija+X6iZ3R4XVvTn4UsbN3CVm08y+Uu9OMdOivvlHPYHQXM
	tOvQgY66FqQkZzZ4bdZCQZoEqnGrWWIdG2uJQViBPXBP5PK93LOpeYC5y4lbZmMJ
	w9OG2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jpc5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 03 Jul 2025 22:38:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so201723a12.1
        for <ath11k@lists.infradead.org>; Thu, 03 Jul 2025 15:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582304; x=1752187104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=;
        b=TaWWiFO3NC9IDqTuQp9kcwItIaZLkTz8PRshTJzRSEkFI5F0n3KV2jRIRA0a7geiZU
         7CAyXPCEyMnuPBGV8Sh4y8+N1Fddvt7eVtuC22aC93Har+nEmhLJmy6U8T74ow4T1ysR
         kkvlnWv6AK92MVDjL3eKq14fpM/3OmozuhHxwOXaXvGXMW2yhqWOlv2JvAyfTH4Mhbb4
         5q1X05v3oRF2w7fX44Xfn21Kx5gzumJFV/o/R8NRCkKJkE+6i9yTget4+nnxOWaK3NTf
         FMXJLWbk57N2PvUdkIN7NQDa7U+zMnXvjI610jGeswYGCFpdvJgQGObdVVHFpgIPPGcs
         loSw==
X-Forwarded-Encrypted: i=1; AJvYcCVS9kmCD4lstxv/qKURpi8CWdR0JOhHXBb7fooNIfLd5YQvN90mtSzAzjWJaGP4VxEEHBC5BHA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxR6qIs7O4tFRJEnH/QtvdOGUBvOSi1vc7k9PvwAAplW3olxuk
	DH4MyoONCnR9BylEFuLWYlwRODk18DgzRALlSinFc+B8jJbFqzmMgcpHIWeiN5jwIEbpsbjUtRy
	xDgDH2YfvCmN6FHhUy+M8QQfgsJaphhpUlUfTEWXAUf8sSCn+Yh4lsAymDBj1LNNX
X-Gm-Gg: ASbGnctNFMusv/qNg7MyKbbcJYdkO0CHioDD/PZTGWl4O9mGiiDQ0OLa8ASRe0ernCS
	cLpC3/7p7bC5PmMFs1dS4GxMcj0P5q6DjPNdAP/Yh75WnLthmtCpXrDAyujPh9KvP+BYx7WUKc9
	ltyxvM0kzkdT2qbcpaOJgGBNYeu0vjUNCLE7Qbny85w4tvgwa1OuZGbhbUkv8KGjiCw4iwjgKx+
	BnT/5bHudxpuqzo7zHJIgNEpaSNZ2zbM/I2NeRFoJlIZPbeDwQwCziM2bjymL9/xNyJlPuuiVv6
	1MwjiKdvoZyh14KJ0ChW6UW9guHoUPV2BAHGFnP4BRUPm5LRZ3EIf3gpA/E0oWpZiD/PnBk/sA9
	kpy7aTsxzuDjYnlc=
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678870637.23.1751582304178;
        Thu, 03 Jul 2025 15:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpT4Lpx7Qr7u2DGYV2UWbI8VMttTXhwYx8YoVd9mUgEjIMP8UGVB0SwmR2RW7RvDWCQB5IHA==
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678833637.23.1751582303769;
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40c2sm559085a12.33.2025.07.03.15.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Message-ID: <339f0d83-a28a-41f2-99ce-3fde0b5ef95e@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 15:38:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wireless: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson
 <jjohnson@kernel.org>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20250703183502.2074538-1-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250703183502.2074538-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68670661 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=iqVkCsNWeGCx9g_Yh1UA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 64Zy63RvCzTwZsLXgowmfDvb_yFofijD
X-Proofpoint-GUID: 64Zy63RvCzTwZsLXgowmfDvb_yFofijD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE4NiBTYWx0ZWRfXyY9VOyf/f00X
 AGFTB5ZUupQOug/6vwttBTc/Q1INr3+jjfsSM/cYKeuxiR/DFg2Qd3nG4lVwqj7GTam7LzUIG3X
 uKtKjugLDsHHU7s1/s7NPUm3ZoB6ep3LMU8yE8iWShWVNRipaZZ2wys5esEjAOCsrlGsEo4tO4F
 zmqFHXT6ztaKUTBmktQduBaT3Af7hm/E+wknbZMAEsWfSENCC5SPhkW1qX9+x87gi8AsOtPWs98
 jLtJZqlvbVSU2acHV9TbodWYEOGozqP6UFPCTQmqPJwQZ13Zjt5FfmOdf0aRP/v6uOYEdCY0i7B
 /Qm+z9qm0KYwPCJU1eAh+pzDjyZXFpE2DBzmH9qzyHQnpQeCZUNIvbaU5LkZ02/H5f7yloWVt99
 x5IXtrwfqcVOtGQoMz7wtu+PR73BNi9YDSr4Xuzy3lmT7EXUhvy9sLzSvQjVgwP/KH7CM/xF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=698 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_153827_079850_9B4ECFFE 
X-CRM114-Status: GOOD (  15.09  )
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

On 7/3/2025 11:35 AM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c        | 14 +++----------
>  drivers/net/wireless/ath/ath11k/ahb.c         | 17 +++------------
>  drivers/net/wireless/ath/ath11k/qmi.c         | 17 ++++-----------
>  .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
>  4 files changed, 18 insertions(+), 51 deletions(-)

Can you split the patch into 'ath' and 'mediatek' since those drivers go
through different trees.

/jeff

