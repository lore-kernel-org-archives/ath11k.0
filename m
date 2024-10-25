Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AF0D0C613
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lspiYDQki/H6lvWnXqRD9t3T6J10j+7zu28STsqRDys=; b=I8VtfT9JAscJBEQ5VV0rCB5tkw
	S3F+CsYoMRlRUOJsWLhFnjG81caDZCr537/jojZZ4QVaWV5iIV/8auSN7iNMAxDEYIZ/8e8Jabvbe
	Jh42XbHnsL5u/MK9VXIdBCTxnb25T8eTfOAUWRp1+3DFsvTI+L0Z4keS1ceqSSgVyKSUm0I2mEmkh
	bACwzcr1Rq+YQqur+P0+1qhhIZXSOjrWQ+EDKVeiVc6I8T3lhazex1Ya+RWKND3neLvB4oQN3slmP
	f9OdMPtjgW02m4Jk3b+aiATiHy3YbnD/5mYCSwKdKBJ2golGkM8rHgAmWPU+waNKtSJ3wE4+sjzRU
	UT0DWwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kqb-00000003uZ8-3lwR;
	Fri, 25 Oct 2024 13:59:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kax-00000003r3K-1YAf
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 13:43:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB252w001000;
	Fri, 25 Oct 2024 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lspiYDQki/H6lvWnXqRD9t3T6J10j+7zu28STsqRDys=; b=mJ1VZ+rU85Rkc+9k
	0QPHWOUsJvH/6dLGRcWq7iH3vO8AV2WslO6FrlyZmiJ6H0qm1JcR5Skt99wi1MXq
	acEaxYiG0zGYxXrE06L0c9C4gn5FgR2iEOyogHO3cXjwXyR1RgYQ4prDOGiVQNBO
	sd10YnGhy54p3RHsPKJYsITp8pbp0+sRMePwZZ8wjYhAEZQVjORCAVaRKU0UembX
	iWV04GV6Eql0a7LzKSP3HT+NVH18SjPm8sNY6hjfBieUthJuUdIjpKOscAbJ+nEx
	aMKgCHiojHMebcOWYpLBrjUSrKJBQODQkPXB9u05nepL8cax0+AYSy7u+BFtSPPI
	TRaUJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s0gh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 13:43:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PDh94I024337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 13:43:09 GMT
Received: from [10.253.77.237] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 06:43:06 -0700
Message-ID: <46b18b39-9e88-42f8-aa88-5b527fc92a9f@quicinc.com>
Date: Fri, 25 Oct 2024 21:43:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com>
 <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
 <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>
 <ig3m3sgmnkgfmwrlglundhqif6rygzl7uh7rzoemrz3yxgvfpc@35a323mw2wbt>
 <46de0bfe-ebdd-4b37-a957-3c64e30a1376@quicinc.com>
 <CAA8EJpr4zgV4Sa4sPdCToQWs+CFJu6Xz6CPcPyHDhDczmuzj=g@mail.gmail.com>
 <06ff37ef-dfda-470f-80f7-0f54bae25686@quicinc.com>
 <CAA8EJppFCXeUAZax+jv42JrKYgLmaPQNpXhn-06q_K_uB9JZLQ@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <CAA8EJppFCXeUAZax+jv42JrKYgLmaPQNpXhn-06q_K_uB9JZLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vii_IZ0ku5j1EbhJ0xhH523yy7Kw26fP
X-Proofpoint-GUID: Vii_IZ0ku5j1EbhJ0xhH523yy7Kw26fP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_064315_478411_C8502808 
X-CRM114-Status: GOOD (  33.41  )
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



On 10/25/2024 8:21 PM, Dmitry Baryshkov wrote:
> On Fri, 25 Oct 2024 at 15:03, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
>>
>>
>>
>> On 10/25/2024 6:20 PM, Dmitry Baryshkov wrote:
>>> On Fri, 25 Oct 2024 at 10:23, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/25/2024 2:01 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Oct 25, 2024 at 10:56:02AM +0800, Miaoqing Pan wrote:
>>>>>>
>>>>>>
>>>>>> On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
>>>>>>>> QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
>>>>>>>> IPA, thermal, RAM size and etc, so new firmware files used. This change
>>>>>>>> allows board DT files to override the subdir of the firmware directory
>>>>>>>> used to lookup the amss.bin and m3.bin.
>>>>>>>
>>>>>>> I have slight concerns regarding the _board_ DT files overriding the
>>>>>>> subdir. This opens a can of worms, allowing per-board firmware sets,
>>>>>>> which (as far as I understand) is far from being what driver maintainers
>>>>>>> would like to see. This was required for ath10k-snoc devices, since
>>>>>>> firmware for those platforms is signed by the vendor keys and it is
>>>>>>> limited to a particular SoC or SoC family. For ath11k-pci there is no
>>>>>>> such limitation.
>>>>>>>
>>>>>>> Would it be possible to use PCI subvendor / subdev to identify affected
>>>>>>> cards? PCI Revision? Any other way to identify the device?  Please
>>>>>>> provide lspci -nnvv for the affected device kind. Is there a way to
>>>>>>> identify the RF part somehow?
>>>>>>
>>>>>> It's rather difficult, for WCN685x, there are multiple evolved subseries for
>>>>>> customized products. e.g.
>>>>>>
>>>>>> QCA6698AQ/hw2.1
>>>>>> QCA2066/hw2.1
>>>>>> WCN6855/hw2.0/hw2.1
>>>>>> WCN6856/hw2.1
>>>>>>
>>>>>> They have the same PCIe ID (17cb:1103), the commit 5dc9d1a55e95 ("wifi:
>>>>>> ath11k: add support for QCA2066") reads TCSR_SOC_HW_SUB_VER to enumerate all
>>>>>> QCA2066 cards, it lacks of flexibility, as the list will become longer and
>>>>>> longer. But it's the only choice for QCA2066, as it's customized for X86
>>>>>> platform which without DT files.
>>>>>
>>>>> I guess, this is closer to Kalle's expectations: being able to detect
>>>>> the hardware instead of adding DT properties.
>>>>>
>>>>>> So for MSM those have DT file platforms, like SA8775P-RIDE/QCS8300-RIDE both
>>>>>> attached to QCA6698AQ, we can specify the correct firmware to
>>>>>> 'ath11k/WCN6855/hw2.1/qca6698aq', so it's not per-board firmware, it depends
>>>>>> on the type of the products(x86 windows, IoT products or AUTO).
>>>>>
>>>>> No-no-no and no. The firmware used must not be specific to the product
>>>>> type.  This is what everybody here is trying to avoid. Please try
>>>>> following the QCA2066 approach instead. And note that it could use new
>>>>> TLD as it perfectly shows itself as a different hardware kind.
>>>>
>>>> Actually, TCSR_SOC_HW_SUB_VER is not SOC register, it's a TLMM hw
>>>> revision register in BAR0 space, it's hard to maintain the list.
>>>
>>> How is it so?
>>
>> I think QCA2066 approach is just a workaround. Different batches of chip
>> manufacture has different value in TCSR_SOC_HW_SUB_VER.
> 
> Ok. So, subvendor / subdevice?

The 'subvendor' is fixed to 0x17cb, so it's useless. And I don't have 
enough samples to decide to use 'subdevice', it's a risk for existing 
devices.

> 
>>
>>>
>>> And if it is hard, can we please get to the _normal_ way how vendors
>>> handle PCI hardware differences: the subvendor and subdevice? This is
>>> a usual way to describe that the PCIe device is the same, but the
>>> analog / tuner / RF / etc parts are different.
>>
>>
>>>
>>>> We're going to have another problem to enable NFA765 m.2 card for IoT
>>>> platforms, which has different feature sets with X86 platform, so also
>>>> new firmware should be used. In this case, QCA2066 approach not works.
>>>> Seems DT approach is only choice.
>>>>
>>>> Could you advice ?
>>>
>>> Hmm, The first question is _why_ does it have different feature sets?
>>> What exactly is different?
>>
>> Yeah, for IoT device will support SAP/TWT/UL-OFDMA/BSS color and etc new
>> features, and the existing x86 firmware mainly for STA mode.
>>
>> What if the user plugs a normal (laptop)
>>> M.2 card into their IoT device?
>>
>> If there is no DT file to specify the firmware, IoT device will load the
>> default firmware, it will affect SAP and WiFi-6 advanced features.
> 
> Can we get all those nice features into x86 world instead?

It's out of our scope, we will not touch the existing stable firmware 
version, also it's not allowed.

> 
>>
>>
>>>
>>>>>
>>>>>> 0000:01:00.0 Network controller [0280]: Qualcomm QCNFA765 Wireless Network
>>>>>> Adapter [17cb:1103] (rev 01)
>>>>>>        Subsystem: Qualcomm QCNFA765 Wireless Network Adapter [17cb:0108]
>>>>>>        Device tree node: /sys/firmware/devicetree/base/pci@1c00000/pcie@0/wifi@0
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Could you possibly clarify, how this situation is handled in Windows
>>>>>>> world?
>>>>>>
>>>>>> X86 platforms use standard m.2 PCIe card, and it will only use the default
>>>>>> main firmware files, as they without DT files.
>>>>>
>>>>> So QCA6698AQ cannot appear on an M.2 PCIe card?
>>>>
>>>> No, but no m.2 PCIe card so far. It depends on power sequencing module
>>>> to do power up.
>>>
>>> You are describing software (power sequencing module), while I was
>>> talking about the hardware. Nothing prevents OEM from adding fixed
>>> regulators to drive necessary voltages from the PCIe slot.
>>>
>>
> 
> 


