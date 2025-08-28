Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF38C8303F
	for <ath11k@archiver.kernel.org>; Thu, 28 Aug 2025 11:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqgurbLM0i0b/3Fa2GVuloXpJqW5YZENzWf48Jlvkps=; b=X/M+wC0dr3Trf1p53D6D6Mcie6
	ObgwduIBrZ/B5gwwxLKPUrErtBIuIPEyV9npa4NBhyYjLo1KD0BPkG/NhRPci5uox5SnF+qjXNWE+
	J10CqspSNoQj3PgVeu0/PhJUmeGCLkYddhS1ygl3Ldo9reKTrEYkK2KaQR79KrdLUnrlUYXxMshmb
	XqbcivRHg/Cjjwv4HURsZufmMW1jYKpfKgLqe86bTS3AucWVr+uT6YuJfU1lKAZ1NdcJLvQjQTJz0
	FSNQyHW8qfAnOAfFo1ESdTg81Av7ayF/hnbpbVAPogl53zRKRnzCC1BxrKX8K7COcox/cbXSMihSf
	itH0ZPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraYO-00000001Iuu-2bnJ;
	Thu, 28 Aug 2025 11:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZZv-000000015rV-41TR
	for ath11k@bombadil.infradead.org;
	Thu, 28 Aug 2025 10:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UqgurbLM0i0b/3Fa2GVuloXpJqW5YZENzWf48Jlvkps=; b=X0pyne22iE4JVqEjNmC8TYrV/7
	wlOWV3YnzPGehJzz1MfvOJyvoNGNe68M7aaq+hhhUwkN8xBRY8Imm+T/vEuGS2BJVJGU+AFtKfGgF
	ip7QU7pjjc7C0PeyHea+bsdKpSXRMJqU37gamVvFEF/m3RCAY3DrnKIthE/rpf6SRjwyn9hIre4Jb
	WzGrwhcbWoQSSkn9HBZUcEF3Guf4kqgN8RXCzvBmnehzmy/JdN+Ys6s6SEHR0px2CuWdTQ3oh1+/i
	L89MCSalP6xJNLiO0saLe7CQ64bXRd3agKMQ8ntL/NlhLZn1vfu1RnZdYaNzwAMsvYIKEsa3kBx5g
	UM9To6Eg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZZs-00000002hUC-1xxl
	for ath11k@lists.infradead.org;
	Thu, 28 Aug 2025 10:09:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S3EZf4000385
	for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 10:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqgurbLM0i0b/3Fa2GVuloXpJqW5YZENzWf48Jlvkps=; b=eijA1TPgYaih5vQB
	NaGOA2QESdZmvxbfhzSoCjhL4XLqQhuEevGFAv9OtWR2tdjZGcNez6RNXCUBpgsx
	oKv/pYyftp+y+lawwgTSLEUbrbl2fJIlQMlf6MUaffahzF276B7IIXdZExsq+jBc
	sHoelQi61InRyIuVJVGylqG0nXgFRRZhWXkTgvZd91X33/pVjVJJ9CptYiBuw2m/
	kI5RSnCUhhF2MdUGZQE7Tcszqc31YQ1ybvExhQ39u/jPDjCV6zb86wQ0zUu7jpIW
	dhwdQBQgUKqiNUmF5LO/b6UYcUQpopwESQuoQIJ1vFJB8gJD5l9SIrsfNo6g9EMr
	CV4n9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48t47baus1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 10:09:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7720b00a313so799682b3a.1
        for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 03:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756375790; x=1756980590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqgurbLM0i0b/3Fa2GVuloXpJqW5YZENzWf48Jlvkps=;
        b=WumBEb5naRHgZv5CwdNkTBCAYu0SQgqZ0aJZFF7hw0kZj5j4NiBCuLq2GDDVabrhH8
         7prgPotXWK6nMfteOlQn7B6Eippo3RyHndKDbRQEaGHf/0EMC/u2B+AdBb2LXxK8czlB
         3uOTIBI3OGoFEVtWXeOvdh1NpTc0uYam/InA262bG/ZpDs5+ioQxgQJ+zpd4ZWWP6XEn
         BZx3MmP7J0oUvD3MXAxE2Zgi+OWSKRZ5NTrtW7AVDqfjg8htoefZme8NYmwXbatFEflt
         vEK/ewJl8ClY5nH5Hwx7oiLbf7h6HUhcKt1hQgF3dabApR+6PJaFTDKZPiVAcyMLVMJ4
         tFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOhiXWl9qbocP5FYOyhOwnFsP7+vK3BFU44jps6N0dbTR0nllu34+No3Imifh7KTgTPJRy5UE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiTBmm36aR4SUkuDR/fj6OwN9y955OYuG2KLKldour9Qo0D1oX
	XwhGPCSxd9Gr2UO3K31pJ/jWk/grDnBv5+zLuM5zZqW3cuq2dQ4AbQbifWnIXd1I/mU6jOrawY5
	6Y7NdBmOWY9vr6l1wQjl4gpCUXN0WxXLK/jX5Ast2IAMnuKBhmlrfUl20eLSs6W8e
X-Gm-Gg: ASbGncvA/CmXEJdfp35SCeUMqNEBMBSdp7bu4zq4VH1i5KUNVO4nqCnITIrnk9s7FWi
	waGJJMzK+h8c+BfIda5qXeE2i+JjIHPulfe7qALcu3bDS/9GUKPOGKRR261oKkh2Uca92K5jq8c
	SNcEQrNxSfk44BwT5+LDpu7r/x4KMKEXwaHcd6puddQvCoSDptUwjIGP1Ndcfln3Tx80m3GgFT2
	5dYOEeeNE+SXpDl5b6I2NaUrNdFH9RdcjZQEmbqszC4nPG/NI8NFWehBfy4AqlHlF6leG86kaEI
	6tN320aLvKhkfbpHu0zI6tIQ9d+gmlPQwvx4u2Yyy8fSc6R6TO3WxRL+rw29GLT67Y96IClJcsA
	+arK1/w==
X-Received: by 2002:a05:6a21:6d86:b0:240:2320:abb8 with SMTP id adf61e73a8af0-24340d41e97mr31450702637.41.1756375789982;
        Thu, 28 Aug 2025 03:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGd/G7ozi3KZV/7PLE6HbC3cWaXqvdWVhYagfcOS7MRIktudGIq4g870oYMHelVYJKVihrnQ==
X-Received: by 2002:a05:6a21:6d86:b0:240:2320:abb8 with SMTP id adf61e73a8af0-24340d41e97mr31450669637.41.1756375789512;
        Thu, 28 Aug 2025 03:09:49 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77058df4db4sm12267790b3a.76.2025.08.28.03.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 03:09:49 -0700 (PDT)
Message-ID: <53cd155e-f59e-c961-be7c-a80cea8f63cb@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 15:39:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
Content-Language: en-US
To: Balsam Chihi <balsam.chihi@moment.tech>
Cc: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
 <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com>
 <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com>
 <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
 <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
 <69f3fef9-017d-86fa-8fbb-2ac2a1df8ae4@quicinc.com>
 <CAONkfw4cQktTqR6e3PGfVhGQPsqPctwjwLSPjdiAvm45tq5qEw@mail.gmail.com>
 <127cb2e9-5371-21fa-1f09-586e6770afcc@oss.qualcomm.com>
 <CAONkfw5K0v7UJ1R8NmW1jVnukF9zsS38JAaV==j0_YXB3RynBA@mail.gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <CAONkfw5K0v7UJ1R8NmW1jVnukF9zsS38JAaV==j0_YXB3RynBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1kke5oUZW85NOWt0NCJuMuvbrp_BH9mK
X-Authority-Analysis: v=2.4 cv=CYoI5Krl c=1 sm=1 tr=0 ts=68b02aee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4SYc7Gc41Xra_dyHz_sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1kke5oUZW85NOWt0NCJuMuvbrp_BH9mK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDEyOCBTYWx0ZWRfXxEWKGjLGMsE+
 oT3PSfrE6wIAeqlRgwLrMpsUSBP7Qn7dxVoO2sjXuQBebeuyueDDq1ScMsryEVlqLW0T2mlp5rI
 RSpbGAe/nbPvRILJozC/OC6gcDCmagp6s8v4PNbev3OVjiPsaUYs/LRUclhFngD7NwqRRBPN5p4
 Bt0RMPQzsrOFn5b++0/S+7xrZCpdwmA8Rpy0tU7nLs8Qlz6dnv61XqlYFdHySFR5dNEL8wiiVv/
 tdjrF8qQQOfgOPxHF3h0CmsF6845JsIQrtbKv9YCMoMJb3hax25+tWeost7khwlZC6AEjuFmzPB
 /9OTLhayGvnxE1ltFIljVjxExSWd6ZKjYG0KQ6JMmjoyHY61rm0RBjNwH+gP7p5gHeOjjrKh0xH
 SzW79+VH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508270128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_110956_947330_447054A1 
X-CRM114-Status: GOOD (  15.99  )
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



On 8/27/2025 7:07 PM, Balsam Chihi wrote:
> On Wed, Aug 20, 2025 at 12:29 PM Vasanthakumar Thiagarajan
> <vasanthakumar.thiagarajan@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 8/20/2025 2:03 PM, Balsam Chihi wrote:
>>> On Wed, Aug 20, 2025 at 10:03 AM Vasanthakumar Thiagarajan
>>> <quic_vthiagar@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 8/19/2025 2:20 PM, Balsam Chihi wrote:
>>>>> Hello,
>>>>> I Have a question on the same subject but not related to the bug.
>>>>> I have many identical PCIe WiFi cards on the system and I need to load
>>>>> a different board-2.bin on each one (1 adapter per frequency band).
>>>>
>>>> So you are using multiple pcie devices at the same time in a system
>>>> with ath11k? Wondering if you are using any private patches to address
>>>> QRTR instance id clash issue [1][2].
>>>>
>>>
>>> I'm not aware of any issue of QRTR instance id clash.
>>
> 
> To clarify: my setup is based on an NXP LS1088A SoC hosting QCN9074
> PCIe cards, using the ath11k_pci driver.
> The cards communicate directly over PCIe, and QRTR/QMI infrastructure
> is not used or enabled in my system.
> Therefore, QRTR instance ID clashes are not applicable in my context.
> Maybe QRTR is only applicable for SoC AHB based integrated WiFi IPs?
> And I did not use any of the patches [1] and [2].

QMI is applicable for PCIe WLAN cards as well. not sure how this works
for you without any of those patches.

