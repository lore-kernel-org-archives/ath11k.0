Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677C3C83F1A
	for <ath11k@archiver.kernel.org>; Thu, 10 Jul 2025 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ar7cVymq/jtUHBmvH1VZaUyciNOHi8uWBeFm9Lj+JaM=; b=UZO2ixmXrsr3W2VKt2q55yX9vI
	BY4bA+bpXmP1IIoKTTHkJitjGV1YH4szU5pDAtHC6q1euXNxEaKETQlvYNM/E5cAFk5GCIXVvqmpA
	1QodWhYjrEmZWJIJbw35jR0/7CdFF0ciIQgkf8rEdu08aUisoCBfVWId6HFAPndT5ye3XVJE++o4Q
	ItP6JHV2o9rjnx6AlJtaP9lRdW+Dxmv0vSLpFjlhiR4O5eeJMGtpnYGrnI6fNqUFCyIPYMB1BUhP4
	fSyT471A2vyljWBw9BoYww2o1UgSc3Jc5DiPy0ezfP8x5VbetCZKOUWSl4UQU1vaWDaarSAjOQyvb
	hK5jNveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZx5A-0000000CpTx-3dje;
	Thu, 10 Jul 2025 19:37:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuuO-0000000CYyA-22eY
	for ath11k@lists.infradead.org;
	Thu, 10 Jul 2025 17:18:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9b64M011520
	for <ath11k@lists.infradead.org>; Thu, 10 Jul 2025 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ar7cVymq/jtUHBmvH1VZaUyciNOHi8uWBeFm9Lj+JaM=; b=kftSpZ9YXjb9tP8z
	JAa7GP/C5N1nGxlH9A8arpDhrAqIcgd0Ga9o0P84DK05+Q7dKtyGNZt6b8HMn2tw
	2ORX65/2UdoBSPG0ncP6NiYWtDVilajBiYoZ6j+5CahLCPbwt4t8lyz9oZ8rUkB5
	tmZWZN+HNChoCB6+SRBUW4I1tS2X3FifvuGUeLC2qUMcNERFtPWQ27xtQePftVGY
	H5SdSLyPMSLonbwuZYQFzVQHI43CrnNINhkcycur23ivtvSTguMNk/IHaQh8e8c+
	x1KfD1I4AVZIIxD8PhiiccHeNDKBbgGNNU51RDnTtnRF11rxnwvnNfHsIZ5/Uw/3
	o+Vzeg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafnqh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 10 Jul 2025 17:18:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ae13e99d6so2018952b3a.0
        for <ath11k@lists.infradead.org>; Thu, 10 Jul 2025 10:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752167885; x=1752772685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar7cVymq/jtUHBmvH1VZaUyciNOHi8uWBeFm9Lj+JaM=;
        b=k38yVDnVi1SBFm89qanHo7jSFATSxG3vOSxotZfoHEC/XMxluwalISGtvltcY9mRXn
         voAqbAWwefjCE8Im2n910u0Jsb2VA1bAcGXVe2BAxxpOEHTjmJxu+a0NKVWE/Au/vmFy
         fV9sRPgJvMJK96GZaCCJr80f6wKkdZgmYGWxL+pRSrwjSfulP9xkHOlSkz6MQ5kGus1k
         tUhE2u/hK/TZAXbYSLSBLWQkIUFUA4FkWgxs+0/I1VEMU69X+UD/dL4htaxed+4ha1x/
         qKpLcMfV7+bajtJrOaZW0WJrPfkA+tZVuMNJncHCdNTrPyeaVwMvSrh2aL5XirOfpKu4
         oAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn4dqPKvAmVnygsumBrmIWqRPqlyup5Z9/9GQoO/l+rCWSaci9igjma8Vn7aX6BK8qH85GiU8=@lists.infradead.org
X-Gm-Message-State: AOJu0YylhXegnCVc46eyeqg1n5mDcSWPG7z7TABIDZN1buyiTFun40Xs
	alxjlgrI2IlK87cmhtK4BtaXEztN4qn/4bqNZnEBNh6KFH2lyEbp1TJSpYQcNne46OpEqrNDm25
	eQGN3RenBT3tjJBrcGMzRdqlaxT+Cp79empmXEuGOECjlFm6dKbxnCHalIugLFMUi
X-Gm-Gg: ASbGncvRhrtjScDOochnass1wHYw56w6C4s7wsRx7jGgy5My3L1Fj/0O5Xzq7ztj0fw
	88Fvk5eyxoKetemYR4xgPYgA4jK7z4zsHj+c+USJLJhhzF4EqIqhyZEdtGKuaXCe2KsUa44AZ7C
	kidP2NhheZoz/mTevUblePAj9wzhWm7R6m8teAxktRx1d40PD9OHbTSodPZb7VQ/EjVstTUdrvY
	yb8lUxV/lOo5rRVq0aDuZgNjO8IHG3lq8r/CceZen+xRGT2mqjXxTvlN5miB+B3fOJ/lftSL+s5
	NP3r5fzhREtMOUtg3XQho7M4UKRY4/8BE4Zs6tRJgRYW77aBSWQ=
X-Received: by 2002:a05:6a20:729e:b0:21f:9b24:321b with SMTP id adf61e73a8af0-22fc57e7824mr8500614637.20.1752167884945;
        Thu, 10 Jul 2025 10:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHffsp+s2THEsKwd99/2YsGeT6E/wKdQJkZlm+vr/bjKBhhIbOq/IXrxnXy0oU1VYAbUwh2SA==
X-Received: by 2002:a05:6a20:729e:b0:21f:9b24:321b with SMTP id adf61e73a8af0-22fc57e7824mr8500573637.20.1752167884443;
        Thu, 10 Jul 2025 10:18:04 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.227.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe72ea8bsm2779997a12.76.2025.07.10.10.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 10:18:04 -0700 (PDT)
Message-ID: <304d71ca-5773-4fa6-aece-50f92b70c77f@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:47:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
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
 <20250630074330.253867-4-usama.anjum@collabora.com>
 <b72b3635-1c09-444f-98f5-30fcc219b297@oss.qualcomm.com>
 <c40f13e8-7420-4046-880d-7c72620fc021@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <c40f13e8-7420-4046-880d-7c72620fc021@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686ff5ce cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=4nqOr+EkFiuPl9GB/B4vcQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=zOkQIraDPy1jB-BB_0EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: lro1wfq0aKGzVy_LhPKwmSNyThaBTQfc
X-Proofpoint-GUID: lro1wfq0aKGzVy_LhPKwmSNyThaBTQfc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0NyBTYWx0ZWRfX92fYFJpal9Wv
 8KpLNeeARTijl5I4RgwO3WD4iA1JR6hkBJzhWaGFE81J15mOa53AxWbAe/SmSzHNdey7Ox16By1
 T3c2hsZH3L3kXuMG3t7gOTOWoUMHWrUetMRSD4ECxWPcTPEbUqPR0hfa4geUc8eOzRdHn6f/imn
 pDIqLPshUiMb1HG6vGzWrH66ilPfzRGQP5oH1yQKdtfwoZTUgCrS14m6tiHo5ehieUCymZ3u/wd
 arojwWZTwOPCPg73LXyuzuH2Sb6p+rg3AJuPfDfD2ENpebbrnNPn/ehz4PY15jn6tnKJ4s3K8IS
 ZEsIGl7aQEhFgowPtO7fGXJoDYSors/5DMQihT9R7Vz8A1+VprteuZ0aPnVmZpkVzyW/SE4wP+j
 5PolDxUCnW6WTc8uqMHzKnTJrtLOqajEd9KcMaYD76tYMJActOjE0h5q7p4NgmSbra7Vbs2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_101808_645572_2EE97FEB 
X-CRM114-Status: GOOD (  18.75  )
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



On 7/10/2025 8:37 PM, Muhammad Usama Anjum wrote:
> On 7/8/25 3:15 PM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
>>> Don't deinitialize the device context while going into suspend or
>>> hibernation cycles. Otherwise the resume may fail if at resume time, the
>>> memory pressure is high and no dma memory is available.
>>>
>>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>>
>>> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>>    drivers/bus/mhi/host/init.c | 11 ++++++-----
>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>>> index 2e0f18c939e68..8f56e73fdc42e 100644
>>> --- a/drivers/bus/mhi/host/init.c
>>> +++ b/drivers/bus/mhi/host/init.c
>>> @@ -1133,9 +1133,11 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>>>          mutex_lock(&mhi_cntrl->pm_mutex);
>>>    -    ret = mhi_init_dev_ctxt(mhi_cntrl);
>> mhi init dev ctxt also initializes the ring pointers to base value,
>> I think we should take care of them also ?
> Are you referring to mhi_rings? They are getting initialized inside
> mhi_init_dev_ctxt() and de-initialized in __mhi_deinit_dev_ctxt(). That's
> why I've not handled them separately.
> 
Maybe I was not clear in my previous comment/not a correct place to do
the comment.

My point you are not freeing __mhi_deinit_dev_ctxt as part of suspend,
that means we are expecting device will continue to use the rp and wr 
pointers of ring as the previous i.e before suspend pointers.

What if PCIe keeps link in D3cold as part of system suspend, will the
device able to handle the previous rp & wp of ring. I don't think
device can handle this.

- Krishna Chaitanya.
>>
>> - Krishna Chaitanya.
>>> -    if (ret)
>>> -        goto error_dev_ctxt;
>>> +    if (!mhi_cntrl->mhi_ctxt) {
>>> +        ret = mhi_init_dev_ctxt(mhi_cntrl);
>>> +        if (ret)
>>> +            goto error_dev_ctxt;
>>> +    }
>>>          ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
>>>        if (ret) {
>>> @@ -1212,8 +1214,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>>>    {
>>>        mhi_cntrl->bhi = NULL;
>>>        mhi_cntrl->bhie = NULL;
>>> -
>>> -    __mhi_deinit_dev_ctxt(mhi_cntrl);
>>>    }
>>>      void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>>> @@ -1234,6 +1234,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>>>        }
>>>          mhi_deinit_dev_ctxt(mhi_cntrl);
>>> +    __mhi_deinit_dev_ctxt(mhi_cntrl);
>>>    }
>>>    EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
>>>    
> 

