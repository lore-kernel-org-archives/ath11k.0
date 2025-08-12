Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DFEC87FCB
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 04:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVdaV7O5QbbmRET9jFm6kPgE4pGSGAvlJcTe/DiS6tc=; b=m0QwcTDWIsFUZNnnDQgEbAvLst
	h50bzCMsrvbfzf1gGgBTetZMbd1g6J9cLRnXSq+/+/wzKFq+sHB49sy39Jwh9g6T75K7pb34XZ+vj
	EL+KMEL+ymPwISUW0oLFnmwbt1qIqWBMTNhQLm1Duvc0fcuSADGZyY7fq/AKExj0XXbYZh7IScyEY
	tzCXwF47+7sipNg/mr1w7gAUj/ZP6Y4EnmvwAJVGb0zTJKb0Vy0ECbEpAXvWa3kJvNXpmQ5fxYWvq
	hR8ZSrQuR71c5w9kOVx35fSmgWbfuxhh0YDZM6/ZoCI7BYYakLfAH95cD3jWX9B/DFW0gZ4ydqTxd
	OISM765Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgH0-00000009lcX-0m4D;
	Tue, 12 Aug 2025 04:06:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgGv-00000009lc3-10L5
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 04:06:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJl084008756
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 04:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVdaV7O5QbbmRET9jFm6kPgE4pGSGAvlJcTe/DiS6tc=; b=YCQyUwCo8ud3Hlpb
	Z+pLydzPldhjjQuanYvej4qNij+OKrtrtcINy6rdFrCDiN1i4Fn/QYRB1X2Odbww
	CbtafMcIIQaP8KN/nogqHFaKbqiyhnv2sAc0p2iwRakDEtt7pqO1yZAHGoIM41Mv
	RfRj4MToOyady+6MqfAxuf+Xu6UIvP57D9MV4t0cu5QWrWXPZguHZj2RYuEbSUDf
	6rbFHera3SLa1IKluTBqmiFa/5NvyzqNrsu1RcF8UMpyG6IPsbaBJWXhelvooHt6
	TR+l5nn+1zjJFqLw61eTxoucAUpi9Nh3DJ7Digt8dIHh2UU24ekPxAzCmiUyLC9d
	6u1AVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjjht0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 04:05:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b46fa1ba6fcso139848a12.1
        for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 21:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754971557; x=1755576357;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVdaV7O5QbbmRET9jFm6kPgE4pGSGAvlJcTe/DiS6tc=;
        b=uhI4V/7XYD6MUr61z/5stnDpkIlyV1rWHxQ7G9o38H8lvPeej4wpEvUvWeebsvJb6V
         Ca2noUpaHsgtICmz6x4jdAoswvwD2VhSmmCo1BngJv7vJC0ahuFKWiQXOckB4a75W7+v
         1Wh0jrI2PwS2+pbHKy/B7YxB4Ihg2gO/2+5uG/0UrjUxLl+JO9XXPXqunJNeUI3iRcRQ
         o4S8v9hmUMubBRtzneKKcqt+deznKugkEeBJb8R22K5+fjuzQpjmDQiEucbODmp97e8k
         JVQfhQXpx1g3872TC6P5BDCkWUyCsOnMDtwxbJt/4tmbzFqIfkNH0P24LCoPaC3h3+HT
         LGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWOYkA/Du41YafB2b9ytr2xUR3V2oNMsn75/lGf31mVk+VAa4W58ef9cCDomEzyCtzT44VMTk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwstUjvcok9xqiKnjrUh+qPXfw8nNmDp/lY7r5AkdkMQMaa0K5G
	dGotql3ZqU3L5qvt/EZsrGXKNH6NJ9zHkFUF97mAmnEHVWcKOoIwSMOjg+r4xOVqIiwE93LhPKs
	Em1lBbIJVZMxfr4JJogAjgJ2u1PINzQNF8JjFsm+h/mm2mm/in9Qf2fhPHCjM0SAJ
X-Gm-Gg: ASbGncsuoxj5yaKrQuQAoH1vkl4HDOpKyS6bAgZCOjgXuOWE6h14Q/uA0pHzEjjZ6xO
	z5h/ppgoSpQvv1YwNeu6rdXqHBKZ/aGs7E7ejg+Bb7zdmj8bLoF51Dk3u6Zr5uid8fNV7/6bKId
	t+pw+oFeMQyQ7BABw2Wpnb7ksUzAZVvtyvL/i0vlaAiLkbUClLhCI1/iuuCXMiU5IAMtu68f4VX
	qr1ax/PTSJ6OHYZ9R8ZwN8yw34X7r9y6aCtoQpU9/JZsjAp9/D3n+ZfnYmDOQinSrQZQom6kUL1
	wfjdNrgySuuH+jSRFdEEspTmDwrax+LjjcClkl7sA4D9/1yPvK0yCCScyRll+DmI3TGlD375cw=
	=
X-Received: by 2002:a17:903:2985:b0:240:640a:c576 with SMTP id d9443c01a7336-242fc232fa2mr27392855ad.15.1754971557493;
        Mon, 11 Aug 2025 21:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWpOgn5/oSzjBCGtryF075Bdr0I0B0VxEDiPRvky8kDJfG/nc/HyC5WphsedOMXvkIvnZC7g==
X-Received: by 2002:a17:903:2985:b0:240:640a:c576 with SMTP id d9443c01a7336-242fc232fa2mr27392415ad.15.1754971557017;
        Mon, 11 Aug 2025 21:05:57 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef67aesm288305795ad.6.2025.08.11.21.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 21:05:56 -0700 (PDT)
Message-ID: <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 09:35:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711213602.GA2307197@bhelgaas>
 <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
 <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX3ipY3uO8pz+l
 HPowQZVpCTlYDpy97Mf+1OKI5aCkwth0iC+PjWMxsHMrBrwP6EvM+L3m6Lmu4Jmf+BKBKHetflD
 rpEOAq/6k2WR0RzF1Ny2ADWCT3VNHEeUMP0wdubbluug/DAA7UPNa7kwKBw9j7qc0uVuJXfw7TX
 +vw9tekgMowa8TFcZ6F+4JjCidoIqz/KwoNk0ttRCtV6qjT7rbOk9BdmVQYo3mKTZsDiWyHVd+v
 hlkLSa+8EgtuRg4gSJKbp7Des2kxXrnu2jGlSVmNwsS6n0VJqMv3FpjUeP72sFPFM4x1LOzFRko
 xXoF/bemMxGndkhOlVuxDEEIRCjoeLPKC+I413BRVyHago1zDt35BaT/zgOAO5cY5D4xby31ICr
 APs1NtAi
X-Proofpoint-GUID: Yi6TMYac1c2PG8hyvJg0l-0RHYb3s_Nj
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689abda6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uIe58MKiAmNDZ2YlfJsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Yi6TMYac1c2PG8hyvJg0l-0RHYb3s_Nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_210601_451991_F9EAD663 
X-CRM114-Status: GOOD (  27.29  )
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



On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru 
>>> wrote:
>>>> If the driver wants to move to higher data rate/speed than the 
>>>> current data
>>>> rate then the controller driver may need to change certain votes so 
>>>> that
>>>> link may come up at requested data rate/speed like QCOM PCIe 
>>>> controllers
>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>> link retraining is done controller drivers needs to adjust their votes
>>>> based on the final data rate.
>>>>
>>>> Some controllers also may need to update their bandwidth voting like
>>>> ICC BW votings etc.
>>>>
>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>> before & after the link re-train. There is no explicit locking 
>>>> mechanisms
>>>> as these are called by a single client Endpoint driver.
>>>>
>>>> In case of PCIe switch, if there is a request to change target speed 
>>>> for a
>>>> downstream port then no need to call these function ops as these are
>>>> outside the scope of the controller drivers.
>>>
>>>> +++ b/include/linux/pci.h
>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>       void (*release_fn)(struct pci_host_bridge *);
>>>>       int (*enable_device)(struct pci_host_bridge *bridge, struct 
>>>> pci_dev *dev);
>>>>       void (*disable_device)(struct pci_host_bridge *bridge, struct 
>>>> pci_dev *dev);
>>>> +    /*
>>>> +     * Callback to the host bridge drivers to update ICC BW votes, 
>>>> clock
>>>> +     * frequencies etc.. for the link re-train to come up in 
>>>> targeted speed.
>>>> +     * These are intended to be called by devices directly attached 
>>>> to the
>>>> +     * Root Port. These are called by a single client Endpoint 
>>>> driver, so
>>>> +     * there is no need for explicit locking mechanisms.
>>>> +     */
>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>> +                     struct pci_dev *dev, int speed);
>>>> +    /*
>>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, 
>>>> clock
>>>> +     * frequencies etc.. to the updated speed after link re-train. 
>>>> These
>>>> +     * are intended to be called by devices directly attached to the
>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>> +     * so there is no need for explicit locking mechanisms.
>>>
>>> No need to repeat the entire comment.  s/.././
>>>
>>> These pointers feel awfully specific for being in struct
>>> pci_host_bridge, since we only need them for a questionable QCOM
>>> controller.  I think this needs to be pushed down into qcom somehow as
>>> some kind of quirk.
>>>
>> Currently these are needed by QCOM controllers, but it may also needed
>> by other controllers may also need these for updating ICC votes, any
>> system level votes, clock frequencies etc.
>> QCOM controllers is also doing one extra step in these functions to
>> disable and enable ASPM only as it cannot link speed change support
>> with ASPM enabled.
>>
> Bjorn, can you check this.
> 
> For QCOM devices we need to update the RPMh vote i.e a power source
> votes for the link to come up in required speed. and also we need
> to update interconnect votes also. This will be applicable for
> other vendors also.
> 
> If this is not correct place I can add them in the pci_ops.
Bjorn,

Can you please comment on this.

Is this fine to move these to the pci_ops of the bridge.
Again these are not specific to QCOM, any controller driver which
needs to change their clock rates, ICC bw votes etc needs to have
these.

- Krishna Chaitanya.
> - Krishna Chaitanya.
>> - Krishna Chaitanya.
>>>> +     */
>>>> +    void (*post_link_speed_change)(struct pci_host_bridge *bridge,
>>>> +                       struct pci_dev *dev, int speed);

