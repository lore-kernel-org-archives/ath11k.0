Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9F5CF9C69
	for <ath11k@archiver.kernel.org>; Fri, 20 Sep 2024 21:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPvH/KPFI9cFs02tKe4xQrHmrpWIDZy+NVAg7DBI6Hg=; b=m7j1lfD94+QjRr3/g4uzOFkn3N
	r8MevWhmj3xRO6+aJcMLmmy+VCKBp89UZ7hqM2/vWJnr+S4wHEeLG7oN+Az+k2Go33l87Uq5YbQpu
	aPuhwrF0I3l5QDQGXpdDTbRnJ4pQYaVF2uoXVP75gkxaAIfWUz04SPNhf1TGbMu7M+C3tlEqYa3u8
	kERPpDJZq3N41h2HCvTpYue7UF5PaULDcN/Y8Hb2r6nGitAY18Brht1MQo0F5nshSvTSRdW/agqLc
	G/e8CDTWnAoQ/c+8sOzWqa0jtIunTbzzj+H65E1PRb/eEsTgeO6drtB/caLYiTmlpV7Fj3aFRwAOy
	mITH2Ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srkmS-0000000CwBr-2hii;
	Fri, 20 Sep 2024 21:03:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srkmQ-0000000CwBH-0xXd
	for ath11k@lists.infradead.org;
	Fri, 20 Sep 2024 21:03:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KKfhIK021838;
	Fri, 20 Sep 2024 21:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HPvH/KPFI9cFs02tKe4xQrHmrpWIDZy+NVAg7DBI6Hg=; b=nu93tajLBCkg+R+c
	B4qjmmfYtTyocAmggLNlaP8hRdjLcWVFh1Ruj8h2vUi7SuWN8vUhd9NZO3Gt87/u
	92Q5oCdKY+Yx5XZNG/Fo6bjXrdlUe/LHxraDaWD6AC3ViNus/ctcjg97SP+cvXSi
	F3t+OZ17fvL9uiFG4788huCGYcJgD5f6ZNMAJiVOW1PoD7V0tQ+mcZZWdR7fIEas
	NrT50GiMnlOLeAYnvP/js1Te8imxSMFDXZUUDb7fojIF93mI3mT7giAHr4Nh7gvT
	MtymmO4Bn1TubZPB477Fl8dLBWUvhJWgnMqOSRlKW4slAYG2fMKB6XbhP2gwnHOn
	ybhMMA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfafb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 21:02:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KL2qBS008927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 21:02:53 GMT
Received: from [10.111.182.77] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 14:02:52 -0700
Message-ID: <b7fdafd6-5029-4b80-b264-11943740b354@quicinc.com>
Date: Fri, 20 Sep 2024 14:02:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kalle Valo <kvalo@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        "David S . Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
References: <20240814082301.8091-1-brgl@bgdev.pl>
 <83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org> <87msk49j8m.fsf@kernel.org>
 <ed6aceb6-4954-43ad-b631-6c6fda209411@kernel.org> <87a5g2bz6j.fsf@kernel.org>
 <CAMRc=MeLick_+Czy5MhkX=SxVvR4WCmUZ8CQ5hQBVTe2fscCPg@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MeLick_+Czy5MhkX=SxVvR4WCmUZ8CQ5hQBVTe2fscCPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uWrwlgWhzSafXP1o32PKT16s7q-E5LRi
X-Proofpoint-GUID: uWrwlgWhzSafXP1o32PKT16s7q-E5LRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_140306_553469_806C4198 
X-CRM114-Status: GOOD (  34.23  )
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

On 9/20/2024 1:22 AM, Bartosz Golaszewski wrote:
> On Fri, 20 Sep 2024 08:45:56 +0200, Kalle Valo <kvalo@kernel.org> said:
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>>
>>> On 19/09/2024 09:48, Kalle Valo wrote:
>>>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>>>>
>>>>> On 14/08/2024 10:23, Bartosz Golaszewski wrote:
>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>
>>>>>> Describe the inputs from the PMU of the ath11k module on WCN6855.
>>>>>>
>>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>> ---
>>>>>> v1 -> v2:
>>>>>> - update the example
>>>>>
>>>>> I don't understand why this patch is no being picked up. The code
>>>>> correct represents the piece of hardware. The supplies should be
>>>>> required, because this one particular device - the one described in this
>>>>> binding - cannot work without them.
>>>>
>>>> I have already explained the situation. With supplies changed to
>>>> optional I'm happy take the patch.
>>>
>>> You did not provide any relevant argument to this case. Your concerns
>>> described quite different case and are no applicable to DT based platforms.
>>
>> Ok, I'll try to explain my concerns one more time. I'll try to be
>> thorough so will be a longer mail.
>>
>> In ath11k we have board files, it's basically board/product specific
>> calibration data which is combined with the calibration data from chip's
>> OTP. Choosing the correct board file is essential as otherwise the
>> performance can be bad or the device doesn't work at all.
>>
>> The board files are stored in board-2.bin file in /lib/firmware. ath11k
>> chooses the correct board file based on the information provided by the
>> ath11k firmware and then transfers the board file to firmware. From
>> board-2.bin the correct board file is search based on strings like this:
>>
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255,variant=HO_BNM
>>
>> But the firmware does not always provide unique enough information for
>> choosing the correct board file and that's why we added the variant
>> property (the second example above). This variant property gives us the
>> means to name the board files uniquely and not have any conflicts. In
>> x86 systems we retrieve it from SMBIOS and in DT systems using
>> qcom,ath11k-calibration-variant property.
>>
> 
> No issues here.
> 
>> If WCN6855 supplies are marked as required, it means that we cannot use
>> qcom,ath11k-calibration-variant DT property anymore with WCN6855 M.2
>> boards. So if we have devices which don't provide unique information
>> then for those devices it's impossible to automatically to choose the
>> correct board file.
>>
> 
> What you're really trying to say is: we cannot use the following snippet of
> DTS anymore:
> 
> 	&pcie4_port0 {
> 		wifi@0 {
> 			compatible = "pci17cb,1103";
> 			reg = <0x10000 0x0 0x0 0x0 0x0>;
> 
> 			qcom,ath11k-calibration-variant = "LE_X13S";
> 		};
> 	};
> 
> First: it's not true. We are not allowed to break existing device-tree sources
> and a change to the schema has no power to do so anyway. You will however no
> longer be able to upstream just this as it will not pass make dtbs_check
> anymore.
> 
> Second: this bit is incomplete even if the WCN6855 package is on a detachable
> M.2 card. When a DT property is defined as optional in schema, it doesn't
> mean: "the driver will work fine without it". It means: "the *hardware* does
> not actually need it to function". That's a huge difference. DTS is not a
> configuration file for your convenience.
> 
>> So based on this, to me the correct solution here is to make the
>> supplies optional so that qcom,ath11k-calibration-variant DT property
>> can continue to be used with WCN6855 M.2 boards.
>>
> 
> No, this is the convenient solution. The *correct* solution is to say how the
> ath11k inside the WCN6855 package is really supplied. The dt-bindings should
> define the correct representation, not the convenient one.
> 
> Let me give you an analogy: we don't really need to have always-on, fixed
> regulators in DTS. The drivers don't really need them. We do it for
> completeness of the HW description.

Again, since I'm a DT n00b:
Just to make sure I understand, you are saying that with this change any
existing .dts/.dtb files will still work with an updated driver, so the new
properties are not required to be populated on existing devices.

However a new driver with support for these properties will utilize them when
they are present, and the current ath11k .dts files will need to be updated to
include these properties for pci17cb,1103, i.e. the following needs updating:
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
&pcie4_port0 {
	wifi@0 {
		compatible = "pci17cb,1103";
		reg = <0x10000 0x0 0x0 0x0 0x0>;

		qcom,ath11k-calibration-variant = "LE_X13S";
	};
};



