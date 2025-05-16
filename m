Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD78C3ABD8
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raENH4kTS198feoVrJY7Mwi+J3+xevS+DdoAQLqz9+Q=; b=tgOJynwGFZ6a8EiO4RgIF8DbAJ
	H+9o2WJjjvt06hiJs/acl/+BT6g5pfGI0P9uk/xw/votx4FqnlI2jNZM3NHmtUk27SF4sXZHgM6k4
	qAyD6GCbxOPuzRbYSfJYAmN5Sf13M92+PKKUn5WTf2wZlV+21RKBflNym2Jq0U72OmcKDAayc+LhY
	2dW5Z3293JEa7ROQBozDip4zxCFrPO5S1GFgfRlA+kshNIT97uQAXhKQ8tUr0ZUZDjXsC8119deuk
	YjY4v1ZESzv+KxIzp3aRKomZk6M185+3leJ3CvgfbDVTJdRhLfrswKVKDRjPW35wFH2L3YNIjrZq7
	xswtEUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx01-00000003qy5-0K97;
	Fri, 16 May 2025 15:29:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwgo-00000003nJa-0Nkd
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 15:09:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBIYwu032624
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 15:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raENH4kTS198feoVrJY7Mwi+J3+xevS+DdoAQLqz9+Q=; b=drFLlU4br9XNhXXk
	xdXr33jsEWM5ALkK900xJgbR9Dt4ufXBoLgBWykryPc9+ZPTAQEZfE38HKxXJaG+
	cq0sNMzHPN37Eq5Ft2MwBO22qAoTdXfFfZT1vUjh8uxdk7srrvPGhUftE48RNdrI
	yzG0wP9mOAl3fPdFYQ1zudeWnClPwt3rfuz8ZEoC5EX6nmiDseYArhFCO28kDtnO
	fEbYkOQBval2S2qejpiWo8qGw1YYXZTRytJo4z/cIp8g0VV6QXaSXUoK/R0GGXfZ
	BQJPiawMF3lRf0G1yiPV/hWzaXiufHI+aj4reqUHKyqeXSSaZ5P6JyZTJ1vCjTdu
	8BPtOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp29gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 15:09:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231e412d4c9so4823745ad.2
        for <ath11k@lists.infradead.org>; Fri, 16 May 2025 08:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408172; x=1748012972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=raENH4kTS198feoVrJY7Mwi+J3+xevS+DdoAQLqz9+Q=;
        b=Av0xbDuJNrjspy5rPq5C7UNGiQ/wbYrslJnwf7JAtIWNgiwSib8KHn1a411pqdZoCh
         9sfAmmWFZcj9IRlfLaeljRDZPFz4O+f7MZtDUpsDHoixr2VyWvZrxLwDEt4pHM0B3SAn
         U+Ss0gV5e0/vDZWUhqY5En4d349dVoIHxf4pp3D2j9D/bebYTaH7KHvUhjMlkM4RQJ92
         PqfgaYcd3FgMr6+QdVKSDysaouUqagtWBnTCS2VcGhHdS+sIobAwib238QL/OCQqgfKl
         +nynMQ8a8+CbvFAWmEUbCWJeM8OZsW/hXYfD7qiXeXBCWw6zfl/FRnTyUDg4qkKZ5SNS
         GIwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzeg24OaYqlil3Qp7jkwLAFmZSGGX4RNRP9D0qWFzBbKQBb6SmyRkMYpgCXB6kQp7C5UtCFYs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ9JbhjW7wFgo4cs5grAJLhQ1BtCpNdqOTbSgOKUmFg0twNli4
	NagieK0r/iYHNQn9fg0HIYoezX8kra02muYUQy6wBOLKyztiNGdS5Z89qmNoJjwx25FtlcsPqxF
	b6qUVp02L9g5zenrOT+YhoS0fB7D3WGQZCjJDo/IsL6TQk5+5ttQ/XA/sV6qQ7wBB
X-Gm-Gg: ASbGncvEMc13lvQfsxGiTcOOXenWpTB8zqqJdta4ol0tcKvwltgmGwX2pv27Cwrw4LA
	HOjG8hxS1dl+eL9GCa6p4+gm/8/vByZrfRH8Zm00yCLKjNyWqdnHyJLL3Fi1unASBPASle2lLRh
	MCToLb27i70Hr0YpCGi4PMVAdvQNDqNlymlordjoe2XcnArc3Uk5CyLlSxZg9jbmhBXASm8EyNP
	iUXATL2uL+vXphhdywsjSw35yzq9rtuEx9fJzUQNh7azyEU4nW1RF6SjaWgW14YQrug76BbLuNe
	ydLFV2ZBbR1NUD8B0UI4FeJDSqy0fAsg+wHKUmM2PFlnng2LDeL0FkZYPkAP2A==
X-Received: by 2002:a17:902:d4c8:b0:220:eade:d77e with SMTP id d9443c01a7336-231d452da59mr54246055ad.40.1747408171830;
        Fri, 16 May 2025 08:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBhjIc9UTjgG/uGiPqIqdjHzIod7qOxovzGafc51g4T4wyDvPmDvk1xpjqgSrE9k/1bTmLbA==
X-Received: by 2002:a17:902:d4c8:b0:220:eade:d77e with SMTP id d9443c01a7336-231d452da59mr54245595ad.40.1747408171341;
        Fri, 16 May 2025 08:09:31 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebad0bsm15505515ad.196.2025.05.16.08.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:09:30 -0700 (PDT)
Message-ID: <ea1336e9-768d-4393-bf88-d4c3f19db1b8@oss.qualcomm.com>
Date: Fri, 16 May 2025 09:09:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Baochen Qiang <quic_bqiang@quicinc.com>, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
 <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
 <5a90a869-8bc6-4fc5-a02a-58579f24dac5@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <5a90a869-8bc6-4fc5-a02a-58579f24dac5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ocn5cL_7ZLwktZiZq3PhmOxwEjwhMyqf
X-Proofpoint-ORIG-GUID: Ocn5cL_7ZLwktZiZq3PhmOxwEjwhMyqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0NyBTYWx0ZWRfXyMHnTamlM3D4
 0q0nUkaxQ5Mg+THcj+qhpGZm9uhisHa0M1gAbEurw3+b5XDAOUS+eWq7kAooPFm5AB9hdqFAJwR
 tDPv1Wu4eRUS8Y4e5uiA4FBd00vpuKaCRoauJ7hB8gByOmqMB3F/wX9jxGCLMlvrEE9bmDISXP6
 9PjVwNM97lUEWLJ2PvTaMTJbPf9abvZmOM4IK8RgSBqAjDChca3GABpS4K8YV6p3ZEuCc0rsYfU
 LxASioEAEs6ARzrBEe4g8/xZlpblyTwAmwuu0svENP7a6T8B2pEsPf78bobpewn5CV6kyCLx8jV
 D/uM0849V4l6Jrea7z4/qelHa7Prwnat6t0f15pfdnkTffrrpcFj/9h/+AkL1sv+PzBjzhJYU3L
 uL3r5Atws0G9+jt94OZrXDzG6ZXBOuWrZnhPyh+duOg3/YVIySxExKFS04bRp5fY91orN0f4
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6827552d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=JLD3Kezu06QqUefcltEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_080934_250017_A12394E0 
X-CRM114-Status: GOOD (  16.39  )
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

On 5/12/2025 7:43 PM, Baochen Qiang wrote:
> 
> 
> On 5/13/2025 2:31 AM, Jeff Hugo wrote:
>> On 4/27/2025 7:57 PM, Baochen Qiang wrote:
>>>
>>>
>>> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>    int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>>        struct mhi_event *mhi_event;
>>>>        void __iomem *base = mhi_cntrl->regs;
>>>>        struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>>> +    dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl-
>>>>> ctrl_config_size - 1;
>>>
>>> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
>>> boundary, no?
>>
>> Its possible, yes.  From a practical standpoint, that seems to be unlikely as the control
>> area is not terribly large on supported platforms.
> 
> although unlikely, we need to handle it, right?
> 
> IMO a possible solution is that you allocate (2 * ctrl_config_size  - 1) bytes and take
> either the former half or the latter half, depending on which one does not cross the boundary.
> 

Ick. That is going to double the memory consumption for the lifetime of 
the device, and these are dma_alloc_coherent() allocations which usually 
pulls from a special pool, making it a limited resource in my view. qaic 
has usecases for 128 devices in a system, meaning 128 allocations are 
now doubled. That feels excessive.

Trying to allocate again may introduce fragmentation, which is also 
something I'd like to avoid.

I'm working to get the spec updated to remove this restriction, which 
would then mean only "legacy" devices are a concern. As far as I know, 
the number of MHI devices that actually require this handling are low 
compared to the set of all MHI devices.  Therefore I am hoping for a 
balance.

-Jeff

