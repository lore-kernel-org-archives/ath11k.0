Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3723AC54E71
	for <ath11k@archiver.kernel.org>; Wed, 21 May 2025 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gclGxcmh2deSgmjENsWitrKLn40jp6PQMWWDoTEhlBY=; b=xjT8HGWIxxDqRFE2cQiqij83Xd
	L6IOm7cX4uHj8hdfK5AQcHzTihKtDN4B9+LlxJXaecOmRGj7ibQVDCEANWvxKvFBmja4ZpqGv0hD5
	iKc+CD1CqhZj8YdDE4NeVjR8CGEf0geXTkWOxW0mDLaRz+CGFHsoQE1qxSeJFFjoOOPQLBW7obdfg
	nCxnfRMaDqG58PmjEMS7h9f77EaEBkvVjdydsIpWpMWtoZNOSgLpt/z2fUBqkkXVy5q8eEWL0P3Rc
	w6VavI88AFLfx6cTlzCtgsM6KFpgn1ZQXrTvQQ7UkXGpvP0YYxVx0BA613MmND7C67RiUQ02ilQ8G
	iyPEv6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHl4e-0000000GEWi-3TD0;
	Wed, 21 May 2025 15:09:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHl2A-0000000GE3C-31wT
	for ath11k@lists.infradead.org;
	Wed, 21 May 2025 15:07:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XLQL020601
	for <ath11k@lists.infradead.org>; Wed, 21 May 2025 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gclGxcmh2deSgmjENsWitrKLn40jp6PQMWWDoTEhlBY=; b=WxBUaiwUqXnZxZd2
	Pd611+dgTkvm5OUDNfiUVG7/R5T12uUOXQhCFFASiyzo2czfAQwckFrZxksxkytm
	8Y/VbIb6xXjtvQFV/U27FUJkCwivja9aLTzfTyrTf9Rl2xXCdAlR8KLhMkHtIbsl
	+FLSejtqOiAt/LtC/t98RpQvmw1KGT6Ti5r9cdbhS2RK7S28O0L4PuY8ls7z1z8h
	6Mp033oUPMRVvzLhuy9mrBceZBh1uPHVGzhfqpjWjyFO8DXQ4mHKsvKOhj4g9N1x
	kLtU1+JRrnYrRaJOFEXzoyijusYv7Lv+ql6yUfT4O7ebZTeHc3hD65QHqMegXTFD
	xDEr1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb1m11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 May 2025 15:07:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so7249761a12.1
        for <ath11k@lists.infradead.org>; Wed, 21 May 2025 08:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840024; x=1748444824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gclGxcmh2deSgmjENsWitrKLn40jp6PQMWWDoTEhlBY=;
        b=ePh8cMKb4ZlC4h+X9Dt/TGgpdFCPy9vhcXA1n78yEFk4vK+pATaYiiyxWMZsb4qCwC
         tpB1RYBf/D4iEOqkSrkQC2kxTL9flDUvnQXdKZlPwqg4Vk2/HGMEa7faSIARWjeuGguX
         sYvlQht0Pa2lh2GiOz5IINIwLwD0E3l3la1iEXLo4VQI1LE4kZXagTTu3J7TuRWRfFQh
         kVuSCBJnSLoEoPpWA0Y2DrxoIME+yc6GpGMdXSwvoswmyn0MJs4dxWzgRwvfwKNQj7nZ
         SgxGcgafYwWy4lGWwK+U+k+koQIWn6XQmCWf6QwEnCOSXEXySqNOvM8you3s6eR42cVy
         ihAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIvPm07XoGduAKJxDaFX9ZruQh42vunqPnRSpU10rRZmhBJtlJWn9sw24WYIty3Sw5RL3kcls=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2qNP6keIyJzWlk4SBPfGC31p84nR476CXp1Uin2g3rhk0D37
	QaLS/Bh2ZY3nXOnX5t4Ni4mdiGeo1YM29bbqP+WYEkQHpQLG3RCbVdrrgZvertTCd4grTOPTCae
	dgvPKiw5q9NPc71gepoNNwIX8i7fGzhYod3LEHbGlBB47LVQgkKBBzashcnKoGPn8
X-Gm-Gg: ASbGncvdW9We/x4Lmf9nixeajRbDfe4IOOqCXSF6CrIUQDGm33+AYFehHsfONVdTJbZ
	eFZq2bfGtT1CpYrF3Q5PwsgvOWLimHlsmXzFTWmBd6JPZ3tBnkeiAmYqq4uoyW16BSVFH0e8jTK
	gjCh+gwAftSZpv63a4RIp8bcWZYjPAVA4EMZZwQh1qUYRlmv9OuaEsPBtHQqEJj/6hOlYcak+ye
	m0jp0vrEYifbr+QcRV6LS6+KEJUvz3aJdRrxagK0PAjzD3I1zSAtx3JNufVV3wU/sWf5qO3Otnp
	jjU12x8wop4UMAP9BJpyZf2AlOt/tIjVsGcRaASwRHM=
X-Received: by 2002:a17:90b:1dd1:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-30e8323ee6emr27638992a91.32.1747840023806;
        Wed, 21 May 2025 08:07:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkFeyasrtr+2FBvL7+PLcu+wKkij8Ce3tKmpJG2Tgqbvq/sTmcpPLrmVJ4iiOnvVwgI3U6lA==
X-Received: by 2002:a17:90b:1dd1:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-30e8323ee6emr27638930a91.32.1747840023284;
        Wed, 21 May 2025 08:07:03 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.230.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368bdcsm3791783a91.5.2025.05.21.08.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:07:02 -0700 (PDT)
Message-ID: <8bb9acff-b2cf-edb0-bd55-251cf4a93f5b@oss.qualcomm.com>
Date: Wed, 21 May 2025 20:36:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 07/11] bus: mhi: host: Add support to read MHI
 capabilities
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
 <20250519-mhi_bw_up-v3-7-3acd4a17bbb5@oss.qualcomm.com>
 <aa45ff83-bc8f-4cef-a82c-9a868396d19d@quicinc.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aa45ff83-bc8f-4cef-a82c-9a868396d19d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682dec18 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=m9Fid+qPLYWXQ4ltJ96dlQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mVMa0e8YI0uuylkBircA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j0OrZPtJXv_MG7LMLfavgrFvpYC-z7Y0
X-Proofpoint-GUID: j0OrZPtJXv_MG7LMLfavgrFvpYC-z7Y0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NyBTYWx0ZWRfX27lWHv6x1qrS
 svgLgbRl6lTeesOmuRcPRnp7RaBPaTK6b5/rzsZ92/+rN57XFAMBBkr8ZwR3N+oYMNgl3fzVAFP
 UxuHHnNsaZIZDuF/AM7qdhjqVcI8m1a52/bzoYEOMF+YcRehC04DLpdHJsM6AKcItL/LD6OWfsW
 E3M+/AcWpy4DlK3SXWT/EQVcmLADO+T4FIdjNPUhIc+pEFYMiPnh8dgjNuZc5lKfgf1489uGouS
 EfdMsUUkwJ4lWLfzLPBgkvJIZJa8b1mAbGyxraGKMfkjuRdvU+tshw//R2Z5q3HFVecaNIyhZMk
 7yIeLMDn4CTe+vYX1EUuhgqBR5VLWufOv4dNjPT46KENTMEG+ka+3QAyytqnPJwVqWns49AOY3w
 SpuNA1e+R6g5j0LlKtVnSf4H8ZvLbEHG00+8aTOiBcc+IbL9T3g9IV754Ea0kdCDEt+uYHm+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_080706_772718_01A2A918 
X-CRM114-Status: GOOD (  22.77  )
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



On 5/21/2025 8:22 PM, Jeffrey Hugo wrote:
> On 5/19/2025 3:42 AM, Krishna Chaitanya Chundru wrote:
>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>
>> As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
>> located after the ERDB array. The location of this group of registers is
>> indicated by the MISCOFF register. Each capability has a capability ID to
>> determine which functionality is supported and each capability will point
>> to the next capability supported.
>>
>> Add a basic function to read those capabilities offsets.
>>
>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/common.h    |  4 ++++
>>   drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>> index 
>> dda340aaed95a5573a2ec776ca712e11a1ed0b52..eedac801b80021e44f7c65d33cd50760e06c02f2 100644
>> --- a/drivers/bus/mhi/common.h
>> +++ b/drivers/bus/mhi/common.h
>> @@ -16,6 +16,7 @@
>>   #define MHICFG                0x10
>>   #define CHDBOFF                0x18
>>   #define ERDBOFF                0x20
>> +#define MISCOFF                0x24
>>   #define BHIOFF                0x28
>>   #define BHIEOFF                0x2c
>>   #define DEBUGOFF            0x30
>> @@ -113,6 +114,9 @@
>>   #define MHISTATUS_MHISTATE_MASK        GENMASK(15, 8)
>>   #define MHISTATUS_SYSERR_MASK        BIT(2)
>>   #define MHISTATUS_READY_MASK        BIT(0)
>> +#define MISC_CAP_MASK            GENMASK(31, 0)
>> +#define CAP_CAPID_MASK            GENMASK(31, 24)
>> +#define CAP_NEXT_CAP_MASK        GENMASK(23, 12)
>>   /* Command Ring Element macros */
>>   /* No operation command */
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 
>> 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..a7137a040bdce1c58c98fe9c2340aae4cc4387d1 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller 
>> *mhi_cntrl)
>>       return ret;
>>   }
>> +static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 
>> capability, u32 *offset)
>> +{
>> +    u32 val, cur_cap, next_offset;
>> +    int ret;
>> +
>> +    /* Get the 1st supported capability offset */
> 
> "first"?  Does not seem like you are short on space here.
> 
Misc register will have the offest of the 1st capability register
from there capabilities will have linked list format.
>> +    ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
>> +                 MISC_CAP_MASK, offset);
> 
> This fits on one line.
> 
>> +    if (ret)
>> +        return ret;
> 
> Blank line here would be nice.
> 
>> +    do {
>> +        if (*offset >= mhi_cntrl->reg_len)
>> +            return -ENXIO;
>> +
>> +        ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
>> +        if (ret)
>> +            return ret;
> 
> 
> There is no sanity checking we can do on val?  We've had plenty of 
> issues blindly trusting the device.  I would like to avoid having more.
> 
we can check if val is not all F's as sanity other than that we can't
check any other things as we don't know if the value is valid or not.
Let me know if you have any taught on this.
> Also looks like if we find the capability we are looking for, we return 
> the offset without validating it.
> 
For offset I can have a check to make sure the offset is not crossing
mhi reg len like above.

- Krishna Chaitanya.
>> +
>> +        cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
>> +        next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
>> +        if (cur_cap == capability)
>> +            return 0;
>> +
>> +        *offset = next_offset;
>> +    } while (next_offset);
>> +
>> +    return -ENXIO;
>> +}
>> +
>>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>   {
>>       u32 val;
>>
> 

