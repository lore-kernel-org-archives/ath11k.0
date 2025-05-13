Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634FEC3ABCC
	for <ath11k@archiver.kernel.org>; Tue, 13 May 2025 15:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=; b=4nk79XS6Do+QpLbNLqB/PxIFBY
	6uwUFcjBAMmz1TSVF5j9orTvWAWxx8FxbYl51RxhFrCUFbiMNUvaVnTUW9GMcIMO6adgWnZ9sYVYu
	d7wSK1Vz4dt2N32S4VgaI3h+MVuUTPXTkkB4Zltmz3p9qpkqLfvl37IOaXRYn+MKDdk2PNFZ07LtY
	txnorqqFug0o2W+aMZs++2lReov+ZChnIccYmGfuOVWwFqqYKbmjgPzCOEsc7HUEMbEywe0PCncTA
	0ep5ynM8UpMG0nK2KWBT8hLXEQpn+zI3RxJyaQuqu0aEe+XHY1/akmvkIQJBRPW+eCCYuv3AkmQjO
	LAEbIenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErR1-0000000ClBs-10UC;
	Tue, 13 May 2025 15:20:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErNK-0000000CkR8-3hfJ
	for ath11k@lists.infradead.org;
	Tue, 13 May 2025 15:17:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDMR7G017633
	for <ath11k@lists.infradead.org>; Tue, 13 May 2025 15:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=; b=LIZas53faEkTAKOj
	U+9+fr4CgM/DHXntykZu+DTxCM7n/wNvla8Yh1M+Anl8FZ44LK2LogmklpCLkpK9
	ONsYCV+6mRfxkfS5hLHXeS/+TSb6/aDAEYnmUKnwjV4PqZYtINQKI75BU66Wo+7X
	s8meOhsXZUR2zSgnWQVCvcnBs7z6wEJ2vf1smom/uOYDRtyQ/cak3+CYZ6hjYzs6
	i5OqptPTI4GG74bcH+w9cX4y1HTJ0C0dikakvsFgpOFvAuyk1PcIJtYMRXp2loFa
	Oat6rwKbqMK0h37WAFX9RGU4Juw/aOaCMdsc2RZna9NpYYng9tp5Se0b8TqUYNtW
	ysBcEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjr4nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 13 May 2025 15:16:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b20755ac243so3997666a12.1
        for <ath11k@lists.infradead.org>; Tue, 13 May 2025 08:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149417; x=1747754217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=;
        b=mNGCuj+TZa79VWA7Ya8sJojJ7EB/kvuzS8mkQPnO6eTPs3FFiLzKcs7t+YZPsMDTF9
         O7j4RXMSyXgeIAVboLArxZ1KJhXS1aQoFwlL2/IdEyPRhZs+kl9VLGsLx+fjpsCuAppg
         l62Hvxz5+g0bIlm3dpaH2Ko4F4xoe2cM+qTsdxhZUZwCumLt6xF7koTdGCicoHaAVDRO
         9OUl59TIGwLem16JW14ANowuI95M8wZ+voioW+i72iUOfDni+vqtpozkYLng7VYP5wpg
         0sC8mjfJtVD3bGThsCfp5o2/N+K8CgVJxaJ7vKmjFqR0wc2Fazew4Vgf+nPzjxBs+Gay
         xFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKULJ3dcxfvU+8oEaqpJ/D2CiZYzEEtNZzG4nXL7XSo/DLZyybvhqBra+3JlqGXDv46RRj1RU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+P4bMRrrWhHaTILpiQFcR7ugrC7uYS9/YhZLEKI0TNg3EOTFn
	wr7y5187eBti7mYEHj0DOHf5P/NgxcUh+eJHQNAmzYLzIWZoZYKlG3L4tCsngQff5UW0YdFjfRX
	aSWGcBxo8g3tQC1moYIB+NRQGDp9ePBjMtyMCQwN0PhVB4LLNukYcofchJfFc
X-Gm-Gg: ASbGncss6M8a4kqK46QO9URhk6RMmr9x1LEWT6Fh1pTfFLcugT9PoKxakslua2GEuEq
	agALpBYDxWp3T+5zAOd6iOi8GjOZvKLW2d/zjOIh6mdjdAJjM1jCafUeN2hh6gEv/NNCLjW1ceI
	c9kjAK+Fx3nZbU9sCoOzODy+9G4W2kSDE6zWfnPyco1JdeOss2laMKawTd1ZwrT2d+HIT7+yFYK
	trix9UF1/ugjZA6igJ5EqDdjdQVYkvA5kuZMSJpFzcE9LaLgzXZ6C+yPCIsYxXs9MwhBnZGTwDi
	H3QTG7w9a8YkLbcH1xAQ7QoRfIiXTwCwasW8zDRHeunuAFrXqcAgO0Uy0EWesw==
X-Received: by 2002:a05:6a21:328b:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-215eb73ff9bmr5239886637.10.1747149416979;
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/qZgi8tIjcUeE0ohWzU4Mnw55YfaTgtINhOjXu6Fl8drDxzQO1FyRbVY4oDD29OgLNL9FTQ==
X-Received: by 2002:a05:6a21:328b:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-215eb73ff9bmr5239835637.10.1747149416526;
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3ea02sm6349451a12.39.2025.05.13.08.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
Message-ID: <57e04b5a-9f04-49bb-8a7d-978276e9033f@oss.qualcomm.com>
Date: Tue, 13 May 2025 09:16:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
 <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
 <5521efad-1ca8-41e3-b820-5527d634c539@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <5521efad-1ca8-41e3-b820-5527d634c539@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE0NSBTYWx0ZWRfX4hHPSaKX7MTT
 ZhJosYx6bQErU2lAVLNnjIjvTMfPoFC6t2p7zuLOwEsGXc/ZyjUBoXL04Aurnfwu2KUF5oK3+EW
 s1jVa9TL/ciCfrIh70xc4l2YkHGDEZGM1U8F9f/2ic//peBSpvJhzOVtLTSMFYs9rnPgjdNDjPl
 Wb43/FxMTKg+X2EDTb25+xcmIMOGNs4Zyz8iAG6bFvHM+KwIkNOo5wV1qe6f29Y4lCLsR+NwXuY
 q7ew4xhNGaxtgavO6bTDkg76t0I4IxaW7a10BsJS2B3Htsju/mj0R18azDZz7ox9ffSbAcBhz4o
 qqVgSPMm69YsUm7zHtZvNxtYgfIS2T/seXfkEUbbQJxEtdCq1xgz9xkl5H3CRqAUzhUtRej6kkw
 LR5yOpc5rTZrfcOjy0wlIBamTVPrzoFm6lBoSe9lT5rz5JlYOYFr5GRpPx352pWIXHJLs62G
X-Proofpoint-GUID: PN5Oyr8Ho22qV6YB0JqB5tCCavmDIxj2
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=6823626a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=ql1YSk0x1lwMMiQrb4cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: PN5Oyr8Ho22qV6YB0JqB5tCCavmDIxj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_081658_928625_31409060 
X-CRM114-Status: GOOD (  28.29  )
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

On 5/13/2025 12:44 AM, Muhammad Usama Anjum wrote:
> On 5/12/25 11:46 PM, Jeff Hugo wrote:
>> On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>> allocation because of memory pressure. There is a report where at
>>> resume time, the memory from the dma doesn't get allocated and MHI
>>> fails to re-initialize.
>>>
>>> To fix it, don't free the memory at power down during suspend /
>>> hibernation. Instead, use the same allocated memory again after every
>>> resume / hibernation. This patch has been tested with resume and
>>> hibernation both.
>>>
>>> The rddm is of constant size for a given hardware. While the fbc_image
>>> size depends on the firmware. If the firmware changes, we'll free and
>>> allocate new memory for it.
>>
>> Why is it valid to load new firmware as a result of suspend?  I don't
>> users would expect that.
> I'm not sure its valid or not. Like other users, I also don't expect
> that firmware would get changed. It doesn't seem to be tested and hence
> supported case.
> 
> But other drivers have code which have implementation like this. I'd
> mentioned previously that this patch was motivated from the ath12k [1]
> and ath11k [2] patches. They don't free the memory and reuse the same
> memory if new size is same.

It feels like this justification needs to be detailed in the commit 
text. I suspect at some point we'll have another MHI device where the FW 
will need to be cached.

>>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>>> index efa3b6dddf4d2..bc8459798bbee 100644
>>> --- a/drivers/bus/mhi/host/boot.c
>>> +++ b/drivers/bus/mhi/host/boot.c
>>> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller
>>> *mhi_cntrl)
>>>         * device transitioning into MHI READY state
>>>         */
>>>        if (fw_load_type == MHI_FW_LOAD_FBC) {
>>
>> Why is this FBC specific?
> It seems we allocate fbc_image only when firmware load type is
> FW_LOAD_FBC. I'm just optimizing the buffer allocation here.

We alloc bhie tables in non FBC usecases. Is this somehow an FBC 
specific issue? Perhaps you could clarify the limits of this solution in 
the commit text?

> 
>>
>>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>>> fw_sz);
>>> -        if (ret) {
>>> -            release_firmware(firmware);
>>> -            goto error_fw_load;
>>> +        if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
>>> +            mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>>> +            mhi_cntrl->fbc_image = NULL;
>>> +        }
>>> +        if (!mhi_cntrl->fbc_image) {
>>> +            ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl-
>>>> fbc_image, fw_sz);
>>> +            if (ret) {
>>> +                release_firmware(firmware);
>>> +                goto error_fw_load;
>>> +            }
>>> +            mhi_cntrl->prev_fw_sz = fw_sz;
>>>            }
>>>              /* Load the firmware into BHIE vec table */
>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>> index e6c3ff62bab1d..107d71b4cc51a 100644
>>> --- a/drivers/bus/mhi/host/pm.c
>>> +++ b/drivers/bus/mhi/host/pm.c
>>> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller
>>> *mhi_cntrl, bool graceful)
>>>    }
>>>    EXPORT_SYMBOL_GPL(mhi_power_down);
>>>    +static void __mhi_power_down_unprepare_keep_dev(struct
>>> mhi_controller *mhi_cntrl)
>>> +{
>>> +    mhi_cntrl->bhi = NULL;
>>> +    mhi_cntrl->bhie = NULL;
>>
>> Why?
> This function is shorter version of mhi_unprepare_after_power_down(). As
> we need different code path in case of suspend/hibernation case, I was
> adding a new API which Mani asked me remove and consolidate into
> mhi_power_down_keep_dev() instead. So this static function has been
> added. [3]

I don't understand the need to zero these out.  Also, if you are copying 
part of the functionality of mhi_unprepare_after_power_down(), shouldn't 
that functionality be moved into your new API to eliminate duplication?


