Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB3DCE8D65
	for <ath11k@archiver.kernel.org>; Fri, 14 Nov 2025 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IZF97taFsnmh5b8jmQL9+OMw+OoZEfr16LawJYCtrc=; b=qONSIhICEURKUepT1ZYNyauzB8
	Ckom8X9IDQFlWyozaB2lM/1kAT0t1q23QLwfuMaXFbKZ30unUOKgRBamQwDNQbpMYq24J+0VIsCQj
	K+q2LxJG9w+CIh4FuKxX3T1q83RGs1DzAwyAYEweS6/CJse7DFR6TtP8TiSbdA+VnM0Y0bFsEiB4A
	LyXfWywj7UL1C0yhEd1npxx+WpA7aTe5ZhBvDT/7/UMRp9NpVOF5g2RDIPr0GShz27RNU8BfUYisl
	XusCEHSsC53NBLKaJETAiBzvzhTertB0zMhRzHN/mI/mS2KfRErcXVmicFrHIYEfLtc2sfy3YGX+Y
	SrjYkV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxcU-0000000Cqh7-3kbK;
	Fri, 14 Nov 2025 17:29:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxcS-0000000CqgS-2MfP
	for ath11k@bombadil.infradead.org;
	Fri, 14 Nov 2025 17:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5IZF97taFsnmh5b8jmQL9+OMw+OoZEfr16LawJYCtrc=; b=q43lFCga5ak70JpZrCoJUJV5XI
	johGHsCUl6FEcTwV/pGMTe2tcc0mavsZVGMa64H5m4BJ/yhNk/g5SgWgfmG1Bf6rJ49xCRqB2KCMo
	brUHYMycyo7kvr7BYldhHRL8H/1DN95WgWBW+EAWV9qvfD8zW4PbbxBQ5BucLThuV43k1ZoxNBUtd
	UxNX513Jc4Xxx9XHOMHIq+kZNPVyfjUJjS4TZiW6gtzJ27Q4w05OUuaJF2r6n3SlrX/W56a1BZ8i4
	f3jNcj4nsbGRN6MJ2WQ9yyIwvrjfkwQMZOY41DcAACL7exvFIh+I86q9cx4IBrkjFwS7ZOWaY3YVG
	zT4okOmQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwkk-000000038XL-3G9Z
	for ath11k@lists.infradead.org;
	Fri, 14 Nov 2025 16:34:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEHSt5L316967
	for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 17:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5IZF97taFsnmh5b8jmQL9+OMw+OoZEfr16LawJYCtrc=; b=EaLiE5v06eBoNWRH
	8f56DbeDfkYWz3OMQBUgnuNoeXpa4G65cGHMTg9RxojgAFMuFkYgwuidOeagGRXc
	RVSnIxxvJJN+VugWx4yAZnSlaqeW2iwL606y7mSR+t3Mdx8+XXBJmUwNK4CHqbqA
	d2uU7vQYBnkKWfNYTNX/9E1kiOf8BkJuxj8jznKreL37Kk1N+5llyRfaGL+DQINS
	ip4JRKdc5lwg5cC6q2sZslmo/CNfsYEivSETJR+Hz4Q/ks+VsDrPTLDGQvkhXAlN
	PCWDo1WqvwywPl/lNl7LJX/P/qVy8fZZh9elm/WwXLKYZbPQI8VJ3tflDRCUNsCW
	JyJ6yA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae7cv0a59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 17:29:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29848363458so55106345ad.2
        for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 09:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763141389; x=1763746189; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5IZF97taFsnmh5b8jmQL9+OMw+OoZEfr16LawJYCtrc=;
        b=McQPASHgKpJV5rNRu2WzzhDLeNQKhWQobBa55qPfEaM/w+gvLRVPQAiY7fwdPeyGoN
         cttcXJokPTqUywU/OWsV0sContlBv6HJm4hG9zdK5fhN23RPNgkY+R+2h9kb8h2VPYrB
         /1C79KpBMzoIlBrVzyv2R4m6SNPO4hoEWhRX9vdgqnQPMSy1WiaDqmlTZGN9q96QbEZg
         V8jyjSmulXuUWGKgH2YaOrf+281Dbh9pEDj0E1azZ+IgpKTjWhuNrN6Hfoh9fxDO4Dx8
         5sJpf2IViWvmCWAHN0pyrpaVlseQOugZou3QI3//0g21xYBwVWKKAAlRk1v2vmWsJ8GS
         mN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763141389; x=1763746189;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IZF97taFsnmh5b8jmQL9+OMw+OoZEfr16LawJYCtrc=;
        b=RVVxOhPdKKXye3HPjkws8e7ueS9bSk8l6clb1G1CgXVEBnzFv3oHQuUJJ41Fba7vM0
         xawXh+jLmvWgUd00djXAKzyPOW0ndLwSK61MpoJkLAN+2ur3RMalM7yc+8K8wHcekp5a
         bM8/NvsyryQIMhi5503IU4nm8nBydgPLXMWkv2l1pKJxyXue61nfqliIg0gJDYKj94wC
         F0nPxP2EigQiL6IcedVSzA1QuWRVP2JbTR7EwwVArcvj8oEd2tvF4WtusPoZWKp7nN5r
         TIePTwp28dpGPHr27Z17uklh69qwSLZsG3G92YinmeA4OWzfIbPGVzEpSWbQemL4jwjL
         Dn9w==
X-Forwarded-Encrypted: i=1; AJvYcCXok7/rE1wEGpeDXQ7idVuWGFbyl/0n3pziKSpC3MiTLlyY+kg6AGBLVcE1dZ1B2jXoH3MBVOs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+66gQgar+mKoTI3tyfpd7Vc1dUXshVVaBUH+U7JimidmAZGm
	Fc9gYVFUPe0dqSZ4SHZjreteIvVjdebWwdXjrY0fLeLKRDncsUt2pQrTKJ8ysBbVEkHi7x90dvB
	dfIChYrLbbusrA60IQocyS4JrMHrA0exjLI7aPytqkTzvNZM4KrulU+GBHIpRuw3Z
X-Gm-Gg: ASbGncteeolbUnJc8goW9dxFbbn/FKJOB77Ll1czigReFRK0DsaFd+Aj8LZtaCdMZ2l
	MC6oItfrJgWfvviK4TdXFOuProSYeyroxoJvtJq+M9p/Fu2mu0uMWw9hnsMnzhCbqD/sHMvT366
	F/W+NT4IOqCteb9SZS5vPI8WA9AR3YUf4C5WYyAoECpH3h7WxA7WiQManbhapOx6yk7kglL5E2s
	s97MxrrNg6qbAqRK31mnYFtXqt8U04Z8H3NwwvBuvayrlQPr7w/BVzcmk4rZh4lDqNFaqA+A6RR
	G2MhysaY8c8+8nEXGaxFUKrgXNh8TfLS2GloNAI2pCuSwv63d2txBg0uYS+Cwhr70t/N05N//8I
	HqDj87Yzu5J2tIHTzn1OBFoKvwlq9+hLAfGoOXBCL3ikDNyw3Ct89M27hU7UWY7du9O6Uvddte5
	v+
X-Received: by 2002:a17:902:f705:b0:295:9871:81dd with SMTP id d9443c01a7336-2986a6f3f40mr46121105ad.25.1763141388630;
        Fri, 14 Nov 2025 09:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5PNiK7CQR10eCNgq3oo/oD5kyy0U8463HcRT84zlTmppSmWLyBUIeJxcQWwOn0JbTobSH0g==
X-Received: by 2002:a17:902:f705:b0:295:9871:81dd with SMTP id d9443c01a7336-2986a6f3f40mr46120635ad.25.1763141388095;
        Fri, 14 Nov 2025 09:29:48 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c24941csm61501935ad.41.2025.11.14.09.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 09:29:47 -0800 (PST)
Message-ID: <7757501b-2576-4f5d-a16a-40e06f12cb5f@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 09:29:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: wireless: ath: Deprecate
 'qcom,calibration-variant' property
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
 <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
 <1703d8d7-5105-4585-b8f0-82bb54809718@kernel.org>
 <kve3f7zkywwsfkylom3jp4e3ejlspnlvnmlkuq77uy6fqsy5dt@gaitvppj2jcw>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <kve3f7zkywwsfkylom3jp4e3ejlspnlvnmlkuq77uy6fqsy5dt@gaitvppj2jcw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M8FzPUbMLnDDGjRx47z7GGKz_1BkT0Nb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MSBTYWx0ZWRfX0aEQEbKf9z2v
 Qvax4E8tbdfswjO39oRvpDZfP8iG1eR0QrGNJa5g3U8b+EBKPF+bm2jQlnIaKnm6QE17GNBEEBX
 1uXByjMN7SXEeEnejvQv+7r0xc3iePHs7H7Pjih9H7uA9QTiR/v1MQgYMceSBA+19eyBRl81IU1
 bdiQvmV6nuuEeeBSuq5C37kJDS83Wd5R6bCLGeXbKT+CRVF+IKa91vL+MaLVF6iZagKOqsdCcGu
 JiKbwKPnvOVMG0cIlTgfMB3C8m9GKpLKhAq/I1fz72nYz19EEUHR7iPs2OFIAdpfpqRD5+Vda2U
 l8jtReMa7sCU3U4igv5IZZRoEufm7dipBpZ3f49HiuF4ujPEAarkNxxTVGARA4qLS/tLFnku+QG
 67v/uy/s1rqY/TOU1WSBhP8Dcj1a8Q==
X-Authority-Analysis: v=2.4 cv=Y+z1cxeN c=1 sm=1 tr=0 ts=6917670d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LHIKCdfOQfCGPyi8WdcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: M8FzPUbMLnDDGjRx47z7GGKz_1BkT0Nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_163427_125022_65E1D012 
X-CRM114-Status: GOOD (  16.75  )
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

On 11/14/2025 3:18 AM, Manivannan Sadhasivam wrote:
> On Fri, Nov 14, 2025 at 12:04:55PM +0100, Krzysztof Kozlowski wrote:
>> On 14/11/2025 12:02, Manivannan Sadhasivam wrote:
>>> On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
>>>> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
>>>>> On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
>>>>> 'qcom,calibration-variant' property to select the correct calibration data
>>>>> for device variants with colliding IDs.
>>>>>
>>>>> But this property based selection has its own downside that it needs to be
>>>>> added to the devicetree node of the WLAN device, especially for PCI based
>>>>> devices. Currently, the users/vendors are forced to hardcode this property
>>>>> in the PCI device node. If a different device need to be attached to the
>>>>> slot, then the devicetree node also has to be changed. This approach is not
>>>>> scalable and creates a bad user experience.
>>>>>
>>>>> So deprecate this property from WLAN devicetree nodes and let the drivers
>>>>> do the devicetree model based calibration variant lookup using a static
>>>>> table.
>>>>>
>>>>> This also warrants removing the property from examples in the binding.
>>>>>
>>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> The problem - visible in one of the examples here - is that one board
>>>> has multiple WiFi chips and they use different calibration-variant
>>>> properties. How do you find the right calibration variant for such case
>>>> based on board machine match?
>>>>
>>>
>>> I suspect the legitimacy of the example here. I don't understand how a single
>>> machine can have same devices with 3 different calibration data.
>>
>> Me neither but I am not the domain expert here.
>>
>>>
>>> AFAIU, calibration data is specific to the platform design. And I don't see any
>>> upstream supported devicetree having similar properties.
>> Deprecating these is fine with me, but I would prefer if we get here
>> some clear answers that mentioned case cannot happen. If you are sure of
>> that, please mention it in commit msg.
>>
> 
> I'm pretty sure that this example is wrong. But I will wait for Jeff or other
> ath developers to confirm.

As discussed privately this is a valid example. This is a single-band chip. So
a tri-band router platform will have 3 boards, one that is supporting 2 GHz,
one supporting 5 GHz, and one supporting 6 GHz, and each frequency range will
have different calibration data.

So we still need to support slot-specific configuration in cases where the
slot to board mapping really is fixed in the platform.

/jeff

