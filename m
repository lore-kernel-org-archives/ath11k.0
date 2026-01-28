Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30CDD3F07A
	for <ath11k@archiver.kernel.org>; Wed, 28 Jan 2026 15:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfAWH0J+bT1TfO8Eut9bd0nqaaFvU1SsEogfvfC3c/s=; b=NE+MjDnmMOwj82E+WtRCwjYGsc
	NvOALNiMlsVwxHxupwLv9oExoEYAV2dfD2qPCxXK9AERgb+UQ57m6ZBnSfOZkikuqSUGBsW2dZCeY
	yruwAAAPY1P9qW/FG+Iy6F/3x+RMQtlo5LocF4YouRJQ8MB10LmgTgdnxFvBUM3m4hOEVesGv98qy
	bu8rF9L4z08afdj9e4rNDs82SNC2WaaFxtPt006p/G3aJrJSxAyqVJCvF39UKP2gOaI2Y8bPVro4Z
	FIlKk+u1yBKd7ohaG912SBpwfJhJrVWfedBrQCv/9+PJgNV52hyH/oKQrT9bXelHl4Y6JcT1Z5bpm
	VDHxYTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7VK-0000000GHtj-2Oj6;
	Wed, 28 Jan 2026 15:30:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7VI-0000000GHsr-0a7Q
	for ath11k@lists.infradead.org;
	Wed, 28 Jan 2026 15:30:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91pZf3879112
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 15:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfAWH0J+bT1TfO8Eut9bd0nqaaFvU1SsEogfvfC3c/s=; b=HjlKuflmfSJLO7jW
	U0sgqjrUlREdzZtsYIYn4oXlvuPiiKP/hw0OvH9IR48pW7b6VM6oAUqB7FbRSaDc
	2mjpYeUwTEH5E88QsGplKLgQPD+FLR5ue4gDs9hlwsjMaAGmGGCdYII+u8XpzjA1
	zh/xhAoCJXrDjpzUNwJparQ1NaEpDE/GYk+pVR+wnTi/OuW4LsVB0gCEVpftkYtN
	AuXQ77v8xKMBEizGRp4DpajJ2zygZM6z09AdiWSew3Y046pXk+tA59TUuKA5o2GR
	BRcxGC3xdpxyX7MSqJMBx2nZCq875G01ik56H2SpulX+GsfsTIHHHAftdmNqV4Fp
	ieVBpQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv24b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 15:30:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1247bb4db53so9394955c88.1
        for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769614246; x=1770219046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfAWH0J+bT1TfO8Eut9bd0nqaaFvU1SsEogfvfC3c/s=;
        b=Rh97pX4Ju3PHPEGKtpW8PlgNI2np/Gf8q9u6Bf1UpZuBtWcVxKGz5AnJ/SS8wCTBLq
         cCd7WlkBX4IAUL05PsY0a4k70gZutf1g+geBEOZEeoWcdZl2dHafYGEw/7ePyqM836C5
         ZDuZxGWAg1glywNuQsNkKdNfdi8juoMY23xvRhZfCMDpKT94eaZwI/5CHvJXDBLy+JhT
         D6Rw0GwZmytyVZWUVwZfI5Tt5qEJRqMWYoLXCWCcty0ArP9L559GFoFnamxpPSuIGJVD
         yi/BMrNVQD443dcL09/L8YB7+CAyoIFpyUK1CO3ipAXx+EbtO+l4nS+Xq8RxlZX/VEij
         TlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614246; x=1770219046;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfAWH0J+bT1TfO8Eut9bd0nqaaFvU1SsEogfvfC3c/s=;
        b=q90FCW+qiL1OeF70WCmCNW7An+idiHch+lxscgpi9S9OwjtOzoPprttek7f35X9RuN
         M2rLpAt82rHtYJm5C2ZmFaXdgvITyhSepUEab3daM3lrY0QiQSapob8GeahxdxO233QS
         sHxZ47u4IW2jcVD9lYICZjacCBzXVMZFiuWVMbJXyowXWBaA6C1a4qkXcPiY0pZ83wsO
         v7jPgVwcJErdp0owNGiIgpsrKimT4N7535yhmxo55L0GmSIpnO0aEFQKxjqm4Nsn91Kv
         LLEG3obk+8ywhq6wh4nZzQH3mALIbwo3RmJqhqyzfv4Xy5T2T4AI8gO8OmhNkhFLgJI5
         xg9g==
X-Gm-Message-State: AOJu0YwC4QyNVyHuCt3pOIxMt5ftgXazsYaBQzK3Rbmq9U1KmxYJRetn
	f4es3CWnngDGOHSN0IjqtOf5DayZaFDo8L/PazkdsTUUh9tnrm8qb2dYnn3QpWwUZRZ/eVcMm8H
	MQ/DKRx2jHyMfa1nSZor6Kl9vrwOM0ZstH+fxRgrc++0dEroSsYy9m13AnvVH5AKwddtrWoAR
X-Gm-Gg: AZuq6aLUTHlPsvwKoIX5qOeCeippoGuC9MQT33psKWZLDGthaNzaDPF7llfqOZXJoFi
	e+YcgUDXHttoL1CQKIhyjNysIxBlCgfCEiHmcFQ48QNwGxJOsm0yn/hMZWZ8Qt3T+fSqMnBub/T
	w56AztqrK6+Q+mv6XYSJkJIJc3yTuVD6ZJlVBp2NJLZURPBu7nRkC2jkpstZ5LxxsQj0tdDlCII
	PYof0ij6RSyjUbD3B+fiDLxs/Zy0N8FTmWBwzPuvGK1EnOdyBACJ0yZ4VtTb7eZZyMzyHGtsXPg
	41ojUZJvZe98E7/JI7+PDRfnPG00bOX3+/9HvoqGY4XcyyyFDFgV+eVTrV8+ZR4Popy2Nl7ZtOG
	R+OkFv2mg1f1+89GLVihUmWEV3WZMtC3pf7UsW+BfkY9BObGPRKVikSzGUoGLMU4kwFdrWg==
X-Received: by 2002:a05:7022:f97:b0:122:8d:3688 with SMTP id a92af1059eb24-124a00aad75mr3507982c88.22.1769614245533;
        Wed, 28 Jan 2026 07:30:45 -0800 (PST)
X-Received: by 2002:a05:7022:f97:b0:122:8d:3688 with SMTP id a92af1059eb24-124a00aad75mr3507956c88.22.1769614244895;
        Wed, 28 Jan 2026 07:30:44 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b906sm2993776c88.4.2026.01.28.07.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 07:30:44 -0800 (PST)
Message-ID: <9c2e80eb-1585-46eb-a0c4-95c0b50f25fd@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 07:30:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 ath-current 0/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
 <74176aab-03d4-4095-890d-7ef1739b914b@oss.qualcomm.com>
 <32845805-5758-4c35-8818-ebccbfd9546a@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <32845805-5758-4c35-8818-ebccbfd9546a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5yYiIqZ1LnePtVeQY-hVN7G70H0iw862
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=697a2ba7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Zvf348k4SDH0cqSWWfIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEyNyBTYWx0ZWRfX7QW+16m5j0C5
 xmDim1VFZAwp3TX1uMdmBaqtYs+RrvztzmGB/cP3F9LP1srqIVp8x5ZA8rmLXKTad6iB7XBVXcb
 UOvElgeoChw/C3rZZkqYSq0GgcYzzVvvn3XfieU5Z9GFGfKJw0fGEkb8ty7KWuBkmYw+6VZEji4
 iNBe1w3NG/Aognt86NE2HCwIRtnPjwQ2D5RcctSV3EDO6+gkBhU2B93bScPF2KpHSMOHb7QJf1G
 ffkdfj3e9mSTndb3Sxec+5dD2ekBMwTnPNiCVeLP3i1pmnTb16vIzSi3Oz8d2j4m7HwnpdfHksv
 E/SwIFLVdW2ZQctvCTmqZIoJRmHDkeozYN97DP2ZBmeQkeIT/reaEWbU1bFqdEEYrKf4+A6sDdE
 zeg3KFGLNup997xP8mWDrFZIPCx3qTXXLZcMRB5Mlj0iRmuIiyQ7PsH4MSN1g8INVOQGbPuucgj
 Z5OJUk5tLai7dlKJg0w==
X-Proofpoint-ORIG-GUID: 5yYiIqZ1LnePtVeQY-hVN7G70H0iw862
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_073048_317207_98CA7B38 
X-CRM114-Status: GOOD (  15.67  )
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

On 1/28/2026 12:01 AM, Krzysztof Kozlowski wrote:
> On 27/01/2026 18:31, Jeff Johnson wrote:
>> On 1/21/2026 1:50 AM, Miaoqing Pan wrote:
>>> The 'firmware-name' property was introduced to allow end-users and
>>> integrators to select use-case-specific firmware for the WCN6855.
>>> But for M.2 WLAN chips, there is no suitable DTS node to specify
>>> the 'firmware-name' property. In addition, assigning firmware for
>>> the M.2 PCIe interface causes chips that do not use use-case-specific
>>> firmware to fail. Therefore, abandoning the approach of specifying
>>> firmware in DTS. As an alternative, propose a static lookup table
>>> mapping device compatible to firmware names.
>>>
>>> ---
>>> v2:
>>> - Drops `firmware-name` from completely.
>>> - Updates the commit message to clearly state that the property is
>>>   obsolete and the change is ABI-breaking but safe for upstream.
>>> v3:
>>>  - Deprecate 'firmware-name' property instead of obsolete.
>>>  - Keep the ABI backwards compatible.
>>> v4:
>>>  - Use of_machine_is_compatible() to simplify the code.
>>>  - Add back Acked-by tag. 
>>> ---
>>>
>>> Miaoqing Pan (2):
>>>   wifi: ath11k: add usecase firmware handling based on device compatible
>>>   dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name'
>>>     property
>>>
>>>  .../net/wireless/qcom,ath11k-pci.yaml         |  1 +
>>>  drivers/net/wireless/ath/ath11k/core.c        | 27 +++++++++++++++++++
>>>  drivers/net/wireless/ath/ath11k/core.h        |  4 +++
>>>  3 files changed, 32 insertions(+)
>>>
>>>
>>> base-commit: d8e1f4a193101a72235416f189b01131a57e26e9
>>
>> Krzysztof,
>> Since you previously NAKed this series, can you confirm that your review
>> comments have been addressed?
> 
> 
> Binding looks fine, but I did not check the driver.

Thanks Krzysztof for your re-review.

Although tagged for ath-current, we are too far in the v6.19 release cycle for
this, so I'll be taking it through ath-next for the v7.0 merge window.

/jeff

