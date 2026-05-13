Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB27CD4F24
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8xyVsUpHPXn4T/u2Mf9yC6F6ntOlKRKp+UlGa6fsCs=; b=PUiN4f1h2nwBxsuWu9axIzKQGr
	5d6h52QGWNh30mCAWX3uXtW+xac7jbPiZPnS8vSGZtCJhmnGu7DdWloTTH26Vrci52ytAH1pssuxK
	2+kNfjionnRlvXxx7pwiLYS+hc/ZrMmDJSHkeyMtcoUhzAAl3VEcT1uxUbLirAzqX939w8/b+npAo
	4TSTAtVt8hq+O2rli8kJabmC+0V3tWOixQ3zVO5aDFM+VwenTxi686EyPn9S87rFkHmCqwNxje0au
	IOEkIFVFK3wrur4MOYJFIX7/P4xqYYuBSskBt+n6r2/HYoL35k+EB/LmB9/KQOCcZSVQ2lfJavxTP
	xrLPg3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6aP-0000000280g-05Oi;
	Wed, 13 May 2026 10:13:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6aJ-000000027z5-2Njd
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 10:13:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6FJAc3324677
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 10:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8xyVsUpHPXn4T/u2Mf9yC6F6ntOlKRKp+UlGa6fsCs=; b=kSReqp0s41252hf7
	cFXDYCCVJvlI6bMjgxtFVH+/mk7JDj5XGBW2ak1l8uHEaJbL4H6/7JULGgSHjHlU
	lchHar52UBEj94jaTsLulA6DF9dnxlb0KC67Wbtlt7hrPZPgBYt7hs5dyGyBk1Vj
	JIXT0KSmN+ge+d1by+87QpBN6b6Z8D1E4MEvBBM4lM7KKB9bNkHiD1AwOw99GP7g
	AS/xHj+ISzEuv0RYwur/DNsYQMzN7g+iBEKtP4YQtXeIN5EO5HCxpyxsUi4SEv/v
	Qt/gnjM61iXPELAJeNYrDIrYUC+uvv7/QP+5EQeIOA7/621oL4LWP+JjRTG+8gvG
	NKI/gQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd8y1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 10:12:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso2377022a91.2
        for <ath11k@lists.infradead.org>; Wed, 13 May 2026 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778667177; x=1779271977; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8xyVsUpHPXn4T/u2Mf9yC6F6ntOlKRKp+UlGa6fsCs=;
        b=eWr91hSCRb+l4Py+TZVOpHBCxb6ACOjERD7TI9efBvHyXz/9WfnJLoaIyvp8ukBswg
         GTM/lYxZzL0FX2t3Mb4MbnHnXlaLl9lMN4csrFiGDDbBPdUwMNCNJ/aGyCj6UqGuN1wW
         yloiHnK4C5D22g328bLr7YoiTydQOuAIuuWHFFsjRNaExeYb8sl64Rr/1b8RQiN1hPFW
         HImXCJwv3oTZ73mtJn90HSH4hL0TpVJKB/S4sAwhORA2rNbkzCT9dYT2FJJQwO48m1Ah
         B1DpLghBnPyy5XqPaxzFCspD2IsZJ2rJovJo5NEumNW2kBSmW0I0e93t7VYEgcX/SMB+
         GPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667177; x=1779271977;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8xyVsUpHPXn4T/u2Mf9yC6F6ntOlKRKp+UlGa6fsCs=;
        b=YxACy0tx6rf33SH/tteQgsOAKd3qfrOcpj9+bA7xz9Oxn+0SgZAFqjktTqDnwqll8T
         N8CXoCTxZ4BCfxyr62OXJX+1HMoI42SYWSNGGWfL3e4nIEmnFicXCUAhcbRx/BazfK50
         3iqFy6YUmbvGyKlVYl316GS6jduVkMVKnZyDmX0weCcgZiDZlRFDcMuw13EWTMtuMPeq
         r16xbqFRPVqpxy9x4xF2jAbgJSPSVgRvYLIA8QdPf+X91xZGRrhJUex0LUHmQbFNGl1v
         1O3LP7sVD4CrKskx9XClZivRHw3QMW1ljpaHgkejj0uCFjbSKU2bj5mbk93fEG4SJXJw
         5+Jw==
X-Forwarded-Encrypted: i=1; AFNElJ/Jp1fPxJCVV/Ewod/D2psdO5X0YOnRIKySiDImZV1qHf56IbxFnpooLd8oQV8C5yg+0YbyI8Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwORLW/0ltEmt07GzkZNq/NoUi1EfsZXW46mqwIm5zSZiiPD3Z+
	0jtJAtQYopBlOPTgNUy/yHERsC/1mt7ZSu6J0xKa0z/xbIgzltpZI48CqTFG2Y9cPBuQG0+X0UF
	e7EPdDsP3bfvsdwazIILCA2wBNmEqZq/x1ZoXiWZ3ompvgkCYpEsu/r6ocIa0n72cQ2eAtRFN
X-Gm-Gg: Acq92OFjgdot01nOCXtI8xEiUpWnJsfVfWlqLl/3is5Zmxr6o0+SLZHgF/eCHegdmYM
	Km9m5BEDRwGHqX8PJ3dBi0y2aLBzJ9LiQk1eoh2VvLkSv8DSKRk6GZdPVprx3N5mwqSrlpLcPAq
	0u3OAMTWD+L0vjNru8rWARDcX43AnrSA2pz8XAOdf4Zoid9Rq/J5KhohwhdUUgqGMJLhY5KVh0P
	BF/WhBDVYjog6KbEHLQN5sDFYeVBeJwoxPpKwIM3OPyXbwqjR7FFn+eyvPsl9HstcxvBZcZRca4
	dzLfhd7Cx2aKFMDKDiSBsqbnDtC/iPS5mtTKGwK1PiPgjcla1uCENrGoRa2qUJrebyAV3EugiHa
	lKaBFdMhQWnndrkvgTxKzd9+zsoE4njb6wF3WJpP1MqaaeeRKI7qFQYL8PVmxF2xrylvd/4QzYY
	VwIcNa4/8OgjSAiwb6X+o=
X-Received: by 2002:a17:90b:1b0d:b0:35f:b5df:453 with SMTP id 98e67ed59e1d1-368f79cd1dfmr2161080a91.22.1778667177179;
        Wed, 13 May 2026 03:12:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0d:b0:35f:b5df:453 with SMTP id 98e67ed59e1d1-368f79cd1dfmr2161052a91.22.1778667176683;
        Wed, 13 May 2026 03:12:56 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711513sm14415900a12.16.2026.05.13.03.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 03:12:56 -0700 (PDT)
Message-ID: <688defbe-de3a-43d1-b17b-70e337749032@oss.qualcomm.com>
Date: Wed, 13 May 2026 18:12:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath11k@lists.infradead.org
References: <20260512204851.2634163-1-s.gottschall@dd-wrt.com>
 <17060e4f-f0f9-4842-9460-82422d23a8c1@oss.qualcomm.com>
 <d4a6da02-632f-4bc0-b8dd-6d3b001e4350@dd-wrt.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4a6da02-632f-4bc0-b8dd-6d3b001e4350@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hkJcFwJlRgdGy8ZiFerUlrGjgqvVoPOM
X-Proofpoint-ORIG-GUID: hkJcFwJlRgdGy8ZiFerUlrGjgqvVoPOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwNSBTYWx0ZWRfX/Fc0JaLqoK5d
 s+AFFPZpe0Skkaom10Za2g+Z5MSQf55pevRD5eamAcOEzdVAANACLUFymIeidaGrLxzg+Izsf6f
 GtOwPxi0pkKtmPVnVizPe0rG9neUIU4xujXcDzo5R0m0tBTsTsTkATgb1LTrnJDMD+InBk4RNvG
 EsLnfCr0sP3tg+uRxhmHZN1dqdLRow3N1rjMWC6VLW/N6cgqmba6i+zJ+QIV2DnTGHe23dYZl0/
 WptZW2ie7vtnAD9RuZSHbuhpQ2xk1GqYi+8i/69ed8pHSAfzV53VTXm+2tUetWDZ3XgDPSCpiF2
 B8WSybJo39DQ9PNtpMwPYPlFc947TP4zqbfcv1Z4EY5DD4BJICSvgycb8AcxnLMryxXmuILU7IL
 iz4oA3bTJhbOwHdiJz1WzJRHz1DdAj016hwxRoW9OH+18YCtyiScx4hG9Im4UR+IVZpR2I7/+h4
 MJ3jKYfwAc61ZsNDmGw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a044eaa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Y5XITzagAAAA:8 a=COk6AnOGAAAA:8 a=vvi2Yzhm0a-cLb_1SdcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=dfzBCs9aBJshU-flp7fy:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_031259_723114_A2C9330B 
X-CRM114-Status: GOOD (  21.27  )
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



On 5/13/2026 1:20 PM, Sebastian Gottschall wrote:
> 
> Am 13.05.2026 um 03:56 schrieb Baochen Qiang:
>>
>> On 5/13/2026 4:48 AM, Sebastian Gottschall wrote:
>>> there is an issue which has been discovered a while ago while testing
>>> which killed txpower to 0dbm once scanning is triggered in AP mode
>>> on QCN9074 based chipsets if 6 Ghz is in use.
>>> ath11k_wmi_send_vdev_set_tpc_power must be set in AP mode in the same
>>> way is it is for STA as it is implemented in ath12k and in the
>>> qsdk version for ath11k.
>>> this patch must be considered to be backported (i discovered that issue
>>> already 2 years ago)
>>>
>>> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/mac.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>>> index a48b6bf1f29a..dc192152b2e8 100644
>>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>>> @@ -3497,13 +3497,14 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
>>>       return 0;
>>>   }
>>>   -static bool ath11k_mac_supports_station_tpc(struct ath11k *ar,
>>> +static bool ath11k_mac_supports_tpc(struct ath11k *ar,
>>>                           struct ath11k_vif *arvif,
>>>                           const struct cfg80211_chan_def *chandef)
>>>   {
>>>       return ath11k_wmi_supports_6ghz_cc_ext(ar) &&
>>>           test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
>>> -        arvif->vdev_type == WMI_VDEV_TYPE_STA &&
>>> +        (arvif->vdev_type == WMI_VDEV_TYPE_STA ||
>>> +        arvif->vdev_type == WMI_VDEV_TYPE_AP) &&
>>>           arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
>>>           chandef->chan &&
>>>           chandef->chan->band == NL80211_BAND_6GHZ;
>>> @@ -7647,8 +7648,8 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>>>       /* TODO: For now we only set TPC power here. However when
>>>        * channel changes, say CSA, it should be updated again.
>>>        */
>>> -    if (ath11k_mac_supports_station_tpc(ar, arvif, chandef)) {
>>> -        ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
>>> +    if (ath11k_mac_supports_tpc(ar, arvif, chandef)) {
>>> +        ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, ctx);
>> is this intentional change? I doubt it even doesn't compile.
> in addition. i compile tested it. and if you talk about the change from arvid->chanctx to
> ctx. this valid
> arvif->chanctx is not always set. the only trustworthy source is ctx and represents the
> current channel context.
> there was never a reason to use arvif->chanctx

my bad, I was referring to a wrong codebase.

Yes, you are correct. Even the upstream ath12k uses ctx instead of arvif->chanctx.

> 
> Sebastian
> 
>>
>>>           ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
>>>                              &arvif->reg_tpc_info);
>>>       }
>> the ath12k patch has additional changes to hardcode power_type to LPI for an AP vdev,
>> should it be done for ath11k as well?
>>
>> commit a44958c83e52238996a48e7d604167c9b9d0a529
>> Author: Hariharan Basuthkar <quic_hbasuthk@quicinc.com>
>> Date:   Fri Jun 6 16:53:16 2025 +0530
>>
>>      wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD for AP vdev
>>
>>      [...]
>>
>>      For a AP vdev, hardcode ap_power_type as IEEE80211_REG_LPI_AP, which is
>>      filled in the WMI_VDEV_SET_TPC_POWER_CMDID sent to the target.
>>      Currently, LPI is the only supported AP power mode. Since there is
>>      no method currently to set the AP power mode from user-space, the
>>      power mode is hard-coded to LPI.
>>
>>


