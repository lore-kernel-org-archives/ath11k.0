Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D2EC369A2
	for <ath11k@archiver.kernel.org>; Mon, 14 Apr 2025 14:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxG3IdlEU0/EeaB+zxx6yERTFdkVhtJDwmR5p/NkIrU=; b=fWkJi20aJ9JpdeRz0ewqad54wp
	D7LoSwNP+ge9x02Rg9jDRh+JO7Vgd987LbfVozrkhl6DkO2klv1qG0rK162meif0d2PQXrcd8wxEC
	D3paCluKNVFKDq3LmBva/Q180Lu8+x1uecbsqNo+v97TGGll2QtPzfCmwH/kfA3M+QGh/5ePaqfrP
	hiLtpF0bDGQZQBbxvrTpQvlZ/fNhEohLOhYDCTG481ER00VYuWrBIk5Qw/3aCltkvaWenrj4FFISp
	3jg4ANM7opF07dzLW65RgA0mePSIfBGrCphJxzDU2RRusx+jEN4DqGN4mjnfO81ShEiWW8t/exGRA
	Hl/Fl+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Knn-00000002NcB-3b7l;
	Mon, 14 Apr 2025 14:28:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KaS-00000002K9P-1Ss4
	for ath11k@lists.infradead.org;
	Mon, 14 Apr 2025 14:15:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99ols017647
	for <ath11k@lists.infradead.org>; Mon, 14 Apr 2025 14:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxG3IdlEU0/EeaB+zxx6yERTFdkVhtJDwmR5p/NkIrU=; b=hHPr0i7osx8vFaom
	VYV+Mtndw1qOIbkeg8tmmJa2RB+jki0pRpOT1cTI7EI+aQ5yw/S9bjphuAvvPMC/
	8+B+8lw9zUWhTzEG0d3w2XWn6YBuSMgN1ryUc5xM6T3/MGLLWA8rW4Hq0VbErtDP
	d/53phYC2zoWTDWhSHFj/VDYdb4cyIF2Y3FP9gdinwl5uWQTtvotm56cE8vf+p0e
	fiRsTp2egrw6cWVMeFRnfyE7xhahZscAj5mwHL8I1Zil46Lpe6WxC7wvRY/dox7j
	qE2VlXfWy9oHphiKtL2syJgo55z2RpfpKomtdH5AqpLNy29LQzfpzjHRWnhbbk+7
	Q3qABw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vcv8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 14 Apr 2025 14:14:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227ed471999so38218415ad.3
        for <ath11k@lists.infradead.org>; Mon, 14 Apr 2025 07:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640098; x=1745244898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxG3IdlEU0/EeaB+zxx6yERTFdkVhtJDwmR5p/NkIrU=;
        b=l4zlV6nIIPrbHsGDEZ+WdzxJ01S/DxYqGYiJ3GtZDx9MacmOModZpxE0Ypoc3FYiKU
         YCGInKFAAsREAlnXcshpvtI2T1Lr7XSrjROEc5T2MznRZy97dloI84cTGy4p0FUk+Xim
         r0dsGlfUf1Fr19wnU+KeKZh0otT8xIAdldlyo1pl/NqI3wji5InMmEputU7z9a6XWSzF
         D8gxGQoTlg4TLurClmOV1B4eaKl3kpy5biz663dE5qKUUs6BQgc48FPumkki0fNV4LyB
         4HBQU+4x/WhFSpJsoV5YGjUvKAFxkrBByVyUzuqmmbbT6AzuvpXcV6ifcIjRD6XzLbzU
         bAzA==
X-Forwarded-Encrypted: i=1; AJvYcCWO0DCUjK6xhrUxZhOUPT0j1LuCOVBUpkhyev9LD2zO7JY1saGvoG5PSYdUAGM3HIG+MQap+hE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6DlCR2zKTPswGvCsr0eb9Bx65QD6VR3fM1Z6oOdGwAQj/s0k+
	0oagpbQaFL5HHf2yVzSeXvW9CYhKnMja47+7tTCvqJbaLiSvZG0KluZZ1xnO6XKf7+vimzOfDuO
	h4eCK8Dr2SWUC3gOKwLPK4N8TQCPJ/CrKmcfBN1erWmAscBtf+pZ7pYSQk1CC
X-Gm-Gg: ASbGnctyIdurnWJ13bwjwLHRT4EWrLLUGMtWAbyO6nzdw8rPgQ3dekkpCYXmqsOSqZd
	p4sK2MC6FYdBmziECdZNG4FIDA1Su89uQpkjem27RJcb5BHSrrPSGtEtvl0H4HUUp1C0/1sBPy7
	URp6uhNcx6bxl2mI95WufVrsXqrdwGoVCg4m1sO/mkPTSXMY1HB/uMB5yNlG9LIN+GhgN//TqYB
	CUsa34jCBGcZEY8HCCkccOqx6x0sFOcpmeu8+EnEyzmdyfAqF/K2fQuSMDNL+Swy73C61XP/5qx
	nR2+1YjKq5DsmmE+Va253dw51hjAuopfZ42aphcK0Ry5r6d3xof93T+MVYYMdg==
X-Received: by 2002:a17:903:1b03:b0:223:501c:7576 with SMTP id d9443c01a7336-22bea4aac90mr209768655ad.12.1744640097840;
        Mon, 14 Apr 2025 07:14:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUc9+/UIqegjATJ9UbGeCCAJ0DtjU4YNhpXakGi/P6OIAyr24MclI3pdwUoau+1IS1bxBK3g==
X-Received: by 2002:a17:903:1b03:b0:223:501c:7576 with SMTP id d9443c01a7336-22bea4aac90mr209767795ad.12.1744640097219;
        Mon, 14 Apr 2025 07:14:57 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb681asm99532345ad.204.2025.04.14.07.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:14:56 -0700 (PDT)
Message-ID: <ad5e99e8-3ff1-4727-aed6-528ac747f409@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 08:14:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kunwu Chan <chentao@kylinos.cn>
Cc: kernel@collabora.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <ba09ae0c-fe8d-8f4e-a1b8-9c7e5913c84e@quicinc.com>
 <fc9ca0da-9f6a-42b5-aa79-abcd43c97043@collabora.com>
 <e0159cb8-fe21-7f71-1ebe-744ed26bd698@quicinc.com>
 <85580a01-289a-461b-b0f1-38fa1b96717c@collabora.com>
 <1c0b2217-49d9-360c-ed60-db517eaf2ccc@quicinc.com>
 <7d6b074c-8499-4984-b235-d1285b006ab3@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <7d6b074c-8499-4984-b235-d1285b006ab3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vVpw9w7alcqkP8KtJLS9Tx-05ZNahjKW
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fd1862 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e8kDqSdrP573SdWI4XoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vVpw9w7alcqkP8KtJLS9Tx-05ZNahjKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_071500_398664_F11B450C 
X-CRM114-Status: GOOD (  17.89  )
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

On 4/14/2025 1:32 AM, Muhammad Usama Anjum wrote:
> On 4/12/25 6:22 AM, Krishna Chaitanya Chundru wrote:
>>
>> On 4/12/2025 12:02 AM, Muhammad Usama Anjum wrote:
>>> On 4/11/25 1:39 PM, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 4/11/2025 12:32 PM, Muhammad Usama Anjum wrote:
>>>>> On 4/11/25 8:37 AM, Krishna Chaitanya Chundru wrote:
>>>>>>
>>>>>>
>>>>>> On 4/10/2025 8:26 PM, Muhammad Usama Anjum wrote:
>>>>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>>>>>> allocation. There is a crash report where at resume time, the memory
>>>>>>> from the dma doesn't get allocated and MHI fails to re-initialize.
>>>>>>> There may be fragmentation of some kind which fails the allocation
>>>>>>> call.
>>>>>>>
>>>>>>> To fix it, don't free the memory at power down during suspend /
>>>>>>> hibernation. Instead, use the same allocated memory again after every
>>>>>>> resume / hibernation. This patch has been tested with resume and
>>>>>>> hibernation both.
>>>>>>>
>>>>>>> The rddm is of constant size for a given hardware. While the
>>>>>>> fbc_image
>>>>>>> size depends on the firmware. If the firmware changes, we'll free and
>>>>>> If firmware image will change between suspend and resume ?
>>>>> Yes, correct.
>>>>>
>>>> why the firmware image size will change between suspend & resume?
>>>> who will update the firmware image after bootup?
>>>> It is not expected behaviour.
>>> I was trying to research if the firmware can change or not. I've not
>>> found any documentation on it.
>>>
>>> If the firmare is updated in filesystem before suspend/hibernate, would
>>> the new firwmare be loaded the next time kernel resumes as the older
>>> firmware is no where to be found?
>>>
>>> What do you think about this?
>>>
>> I don't think firmware can be updated before suspend/hibernate. I don't
>> see any reason why it can be updated. If you think it can be updated
>> please quote relevant doc.
> I've not found any documentation on it. Let's wait for others to review
> and it it cannot be updated, I'll remove this part.
> 

Wouldn't this be trivial to test?  Boot the device, go modify the 
firmware on the filesystem, then go through a suspend cycle.

-Jeff

