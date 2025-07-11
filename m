Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C697C8303C
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBto8+nkBzC3SIB5+AQtnfGYPNuUEuMvL0M4sbENf7M=; b=SxLnGRniPwI0ROoielDU//a/Tu
	M7s2jx6xWgd5lv6jg+qH0pq0xxLZohiJ58AfEo6zRrGYCYoaZWl+UUUGcyNwY0KXiPiZt+iiPCLq5
	zXcY9fiKHQtrAgdmVlLL/+lxqZVqx3b/om+zbW/OZgjyjtWtHl8XS/39VFN/ayJCh1PCGxyQMjRZl
	/BS/kTd6DrLPMAs6dYGcM3rGr8ryRPuk/GwzdIbPKiVrvuDfea2jmvweabIo/r1vQvRNL3Xo7Ydne
	Kdh5JbHxxANpukmy3z5cVjx4g06tPV1YY0Wabx5DQ0HK2Ky9v30lzuzCtnT+QXI2Oatf3VycpGAfZ
	B4/F4rJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaC3R-0000000Ebod-1PJW;
	Fri, 11 Jul 2025 11:36:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBPQ-0000000EXB3-3zOY
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 10:55:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X5ID001259
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 10:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBto8+nkBzC3SIB5+AQtnfGYPNuUEuMvL0M4sbENf7M=; b=Bz+QdSKwQl5wal/U
	gbg+0WNw8MtXdTa6Uj7kikkL6LG93PVtd1ukrhBBNo+7sDT8LDNirMEIL8DpW4l2
	yhwwHsETVlCt7X6wCyeE+hfmdhGU9ur//FySrA3jehGFrSYHOtPL+fXo8rSaHq1l
	VJNcEuAPbd9W0KONfQMPj1D6fX2Tk7oAOjrntUj6IXeWm8WMFdt2CKpBfxP/1Bo0
	5c+v8w1pNWFWASpvoftVHdLNHFRbYUmvTVSaYwbXtK8tdTQ3E7N0P98WEVO5F+2d
	xB3GTzJhrD6lMeyiTNyHVAMMROAPUbrPt4jvHM0rRiwD24R7bgS8OAMZmfXVVRMt
	AsSTDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucnbrs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 10:55:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-237e6963f70so30063665ad.2
        for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 03:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752231314; x=1752836114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBto8+nkBzC3SIB5+AQtnfGYPNuUEuMvL0M4sbENf7M=;
        b=qSVrzWq+IQkedRwJQE7cnZTOBZCJoDEx9pMBdA7gQ/YChb0D8J82J1GWlpjXbZ/ZSy
         cOAudSruQMEj5Beb7l5G5MJCP1yFX+lz3d+6owwfVes9ay012EsAbDLEu1ZhrnfnhQYM
         CgEJtpAIc3FKuDey+mH4NDf8YcPGkGr6kAqOtbTCTxD9XrE1BB15tw64fKQ9jExbjIak
         zj6Bcft2nmBAiRbix4t1wLvcLGcW6Q8YPh0z88qnjmnrzm+65JA8LpaB0xlqbw32Wlu0
         oe+jV1KtACbZs2OFWNvGE6V0swTh43tssjaGBXdWft0p7pk+fT2VFaol2KyXwEhIanx9
         JIJg==
X-Forwarded-Encrypted: i=1; AJvYcCWPnsHRu0QlBwQJzkmHj9Ul8Zadnbu6Sn7cBL0e1MRcKNokmojdL4TmWxpY34zzl7QPOUFgQGY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzSMxNrsB808Jbh72dH+azFP/YnHipQN5GRE4CldXAtrvuTDi0
	GRSs1e9k9LrZkMESTg0GyO/KTrbVRnAApp8dIxmG+wjoCqSQKtgtkG8lozy/zjClTiRRfHCw0Fe
	dwjn8eMuuMuPPhZDVmOB1gT9zMbnGTejox9IHc0stpjLMXl21v4pyaQP6RhgWWbeN
X-Gm-Gg: ASbGncv1JjAc/mHh8mcRuaf97EOGVh/9Y5ngTJJ2EHEZF2T3G1HnOspu6wz/uP56RA0
	JwiG9FBJaX5GD6VVZ00RygPJhGC0jRwWwqD1I8x4W6QPW5rWCdYdXwSlMDd8R6N7qdeLrmh0tFo
	ghuCG/bDWN/WUl0Zzy+44b0TqQ+seCAhajB292tq4RySLiJ7SSeidGDVjI72aDlJzpxhG/3BpY7
	Bflj+OIBjlSNy4UQ1JM0hjON6IhRVI5ZsZy+4ntn4B6Fxs4Y9FTU5/w02ti9AGHVUxt9TTUlVaz
	hPkQ7QcWud/+fUlJuwBEYx8Qai/Vmzj+8j7ejCtV0YL8ZRo19eEwhHdkf4S7apWnfilX
X-Received: by 2002:a17:903:19cb:b0:23d:da20:1685 with SMTP id d9443c01a7336-23dede2d1fbmr41332585ad.4.1752231314424;
        Fri, 11 Jul 2025 03:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO7zVGoYd5Gn585ClIUPh1ymONaAtRPnkgGM+Z60hbp5/SJEPrqzqHuoCurum2APuuK+XViA==
X-Received: by 2002:a17:903:19cb:b0:23d:da20:1685 with SMTP id d9443c01a7336-23dede2d1fbmr41332125ad.4.1752231313936;
        Fri, 11 Jul 2025 03:55:13 -0700 (PDT)
Received: from [10.92.212.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aef8fsm50345125ad.76.2025.07.11.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:55:13 -0700 (PDT)
Message-ID: <35f057fd-9aa0-4de1-a6cc-0d17ffb99e23@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 16:25:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
 <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2>
 <226bab3a-54e5-94ad-9d84-0b82f9dc4e2f@linux.intel.com>
 <2a18cf9e-1dd2-4e09-81f4-eb1d07324c8e@oss.qualcomm.com>
 <irnkdlrmlozp7joydgnawfuivl2nnuxsb2t4osgxzbtyrfzd3n@7dhzjcd42aiw>
 <c7d4288d-4d0e-a3c2-83d2-c3f1b282d4ac@linux.intel.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <c7d4288d-4d0e-a3c2-83d2-c3f1b282d4ac@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6870ed93 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=9wcXyvJq732FR575IagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: T6tLJVHT7SnxwAH_1yfgoe0uMjLKYbxz
X-Proofpoint-ORIG-GUID: T6tLJVHT7SnxwAH_1yfgoe0uMjLKYbxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3NiBTYWx0ZWRfX/ERJq0o3KknG
 o7GpvgOwHt29gvtMPov8G5zuZWaYRTozCqFOruGzLoUto7WcrvuE0TXw1gYAW2ZaXUAwXdM4Fhv
 x4gVytt2SDne3l/PuIerUX1RAwtKL61w22QJM5Oa4oTTJStxfpPY703F78ax1Hvzqf33DIGZIi2
 RF8jKXx1IfU3E6Wxy3ka9mpPMLpxOs0Mks15eQ74ac/ypfo0aQbo+bD7j7x3aaVIBf+KbfT/L/K
 4D7zsd02LPEBaX83sbQZGdoTxoDHb+wiRxBlJWuop3gJICnpHOPoLOws9XMTjrlwJ0GFQW2yc3N
 5cjNb/2HT+7w8kacOx22Pe3mZuINxHoUBUR5P3ZhWL2kUpmwyjwzhQF4b36WUOuQcJon6Uz68zQ
 S/ej5QXRZd1WPFO8sAXrQ/ec0sAOwubnDJE/QEkmvLhaGXxSFFAfPYPGxA6CWq4kTkE5Cu0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_035517_118277_A0B7E029 
X-CRM114-Status: GOOD (  37.66  )
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



On 7/11/2025 2:51 PM, Ilpo Järvinen wrote:
> On Fri, 11 Jul 2025, Manivannan Sadhasivam wrote:
> 
>> On Wed, Jul 09, 2025 at 06:01:22PM GMT, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 7/9/2025 2:40 PM, Ilpo Järvinen wrote:
>>>> On Tue, 8 Jul 2025, Manivannan Sadhasivam wrote:
>>>>
>>>>> On Mon, Jun 09, 2025 at 04:21:27PM GMT, Krishna Chaitanya Chundru wrote:
>>>>>> ASPM states are not being enabled back with pci_enable_link_state() when
>>>>>> they are disabled by pci_disable_link_state(). This is because of the
>>>>>> aspm_disable flag is not getting cleared in pci_enable_link_state(), this
>>>>>> flag is being properly cleared when ASPM is controlled by sysfs.
>>>>>>
>>>>>
>>>>> A comment in pcie_config_aspm_link() says:
>>>>>
>>>>>    /* Enable only the states that were not explicitly disabled */
>>>>>
>>>>> But the function is called from both aspm_attr_store_common() and
>>>>> __pci_enable_link_state(). So I don't know if this is behavior is intentional
>>>>> or wrong.
>>>>
>>>> Hi,
>>>>
>>>> I think it's intentional. Whether the behavior is useful is another good
>>>> question but the current behavior aligns with the explanation in the
>>>> comment.
>>>>
>>>> My understanding of the situation is:
>>>>
>>>> pci_disable_link_state() and pci_enable_link_state() are not symmetric
>>>> despite the names, never have been (this is one of those many quirks ASPM
>>>> driver has which should be eventually cleaned up, IMO).
>>>>
>>>> It might be appropriate to rename pci_enable_link_state() to
>>>> pci_set_default_link_state() to match the name to its functionality (and
>>>> the function comment):
>>>>
>>>>    * pci_enable_link_state - Clear and set the default device link state
>>>>
>>>> Note: "the default ... link state".
>>>>
>>>>
>>>> I've already raised this concern earlier! As you see, my comment are
>>>> not getting addressed. I'd like to see the author does one of these:
>>>
>>> I replied to your comment on v3 patch[1], and I feel instead of having
>>> new function() we can use same API to our purpose.
> 
> It's not about what "feels" something. One should clearly write down why
> such conversion is correct/acceptable when it comes to existing callers
> if changing an existing API. The note should be such that it remains a
> permanent record for future (in the changelog).
> 
> I don't have answer to what are the expectations or intent of the existing
> callers. Convincing a patch is fine is responsibility of the one who is
> submitting the patch, not reviewer's.
> 
> Unfortunately, it is usually quite hard to figure out for existing drivers
> we're not familiar with. I'm not saying your "feel" is necessarily wrong,
> but the existing callers need to be properly investigated if you choose
> that path, not just handwaved over. It likely boils down if the
> ->aspm_default and controlling it are useful features to have in the ASPM
> driver as your patch would take away that ability.
> 
>> You replied to Ilpo, but never got an agreement. Please try to close the
>> discussions before posting next rev. If reviewers forgot to reply to your query,
>> feel free to ping them in the same thread itself.
>>
>>>> 1) Renames pci_enable_link_state() to pci_set_default_link_state()
>>>>
>>>> 1b) If pci_enable_link_state() is still needed after that, a new function
>>>> is added to symmetrically pair with pci_disable_link_state().
>>>>
>>>> or alternatively,
>>>>
>>>> 2) Changelog justifies very clearly why this change is okay with the
>>>> existing callers. (And obviously the function comment should be altered to
>>>> match the functionality in that case too).
>>>>
>>>> If approach 2 is chosen, it should be very carefully reviewed when it
>>>> comes to the callers.
>>>>
>>> I am in favor of approach 2 which you suggested, but lets wait for other
>>> reviewers feedback on this. Based up on the response i will make
>>> necessary changes in v5.
>>>
>>
>> I would go for (1). It is always going to be a problem to change a legacy API
>> like this. We might end up causing regressions. So it is safe to rename to
>> reflect the purpose and try to come up with a new API that does what you want.
>> If callers want to migrate to the new API, they can also do it in the future.
> 
> That's my recommendation as well.
I will take this as learning, we will go with approach (1) as both of
you are having valid points.

llpo,
In the previous patch you said you have some patches on can you send me
those or shall I proceed with patches from myside.

- Krishna Chaitanya.
> 

