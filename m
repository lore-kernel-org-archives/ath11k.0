Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0015FC83F3E
	for <ath11k@archiver.kernel.org>; Fri, 18 Jul 2025 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=; b=XflQFY66giqxiW0RUmrDs2h0PB
	IDSV02K4frvzj/mfTzPkD2PXhvADcT1fIB8qVpPb4iN7XzHZq0LENGVynnQxqoakJmX3J35lNqJOY
	PlvmUTxvM9NYNIoOrQ1gw0yPCnO7tG0NOMJ0LMuBLo+SM7yYfkRgBFLkqJGBivkjtDImbY+NOehY2
	An7kCQasg8PRfZOS5fnG26C90VsI5y5ocHxl4j+zU7i+P/I5Fjp846MApmzLb4U7gXU4x1K4d1OMt
	IkFUzfTir9bAD4WyNftm+tO0PuFmAFtJOgMUwl4SnxSXoML26+YZLhhGf2n4qZBDl3ebZweFLVs92
	MIoKageg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgT1-0000000C28o-0b0C;
	Fri, 18 Jul 2025 08:29:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgHG-0000000C07w-304B
	for ath11k@lists.infradead.org;
	Fri, 18 Jul 2025 08:17:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7BQ2h016170
	for <ath11k@lists.infradead.org>; Fri, 18 Jul 2025 08:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=; b=YS6d4pEWNQ86kyze
	B3uKrZ6/ciQRyaccGTChUVg0jamBZrUYwPUhJNunx8nOA6Rc8Hy9Dh1TLmubbPPD
	M7hOEZxmAoCjybdFStKqwHaGOEflvdyjZOEVi2vGVbjx7F1UntJ9P2mNfyPj51CH
	wHTiVWtJA/Y0HR+gwbtwsZGTz/OqQUDAA2J4Rgmkb2BdbljzYnaur4blmMYLC9Ua
	FPX1pIsu149aJ+XJYKXTDbBd1zQzVR5/BzFJBjlVEVdtojT5MFcs3mteqTJaXTPU
	4nzsIBjxnFHeVVXhvFFSw3VpF/xzzjJmAOihDB9YpkPPQdjAlx8F+JKaWmRtYPsN
	TTeg5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dywnub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 18 Jul 2025 08:17:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b39280167fdso1368992a12.0
        for <ath11k@lists.infradead.org>; Fri, 18 Jul 2025 01:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826629; x=1753431429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=;
        b=wqE2RKCLaG2lLTiDlUZfUMCqj1dIIHsQl3BVQb79dH6+YvpMegkz1QLccqyX/Jij9g
         eTlDEPGn1qvq3TAjZ6YAIErkeO18Iq3DQ8scrrI2tN333RmrVOi8OZgxQ4VfR+0Y0Ets
         szRksa0FKRkpUvcwJba4gIRSnZ9/Hs9BHUS8TJxg9wY2jk0sKdoyxuc22OyXYKIGx/un
         Vr70zMfIrI2wWafUoSkCcCcMNNWN84rs6UJSLS/u2/MVElqY0FK2mSbnQ2qC4ULzbNda
         Io3s+mZkbHPL2AA4M/zk6x7JGbfl67lBR+/+aGgASjFYsflagWcu5uL8Td39GJMf9sVX
         or3g==
X-Forwarded-Encrypted: i=1; AJvYcCUz/w4HWbdVzAnmwHm6YL4KqpIiFoGhZP5N0ekL5z2KN5+QKsHaIt18H3vRFYzkbN0wz+kEfaw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEylaURus5SO9ntgEUxrAd3tpfer7cVgQMTNISynhAQsI6uG5d
	Z0EqDKDDXZgkfWpzweVurG4ozT3gnJlQQEzB4LpfR+qG6/uzGx85co4B4/n5ixyTvKqTRJK3pFC
	ssslgt3zXyLBA1JqCVNFGxSmuPQh4Sa9ST1XyQTjPF+hsWzboAFB+TGEsISLi7JY8
X-Gm-Gg: ASbGnctrf45g2i1S7YydiVnyiKYnKkd+xt5Nzx+hY2DhWZLPvUP6BRIv6v6WJ5Bgiey
	pPkrXAdp+ZGGBuJs+NzK46/ZLw49TW3Trw/4tTzyO9H6oGeipwwTbCplQ2rWzxKcyeXbYJ4/Tee
	oM/GdGVe4c60D9dCa14oRMcip+iPN453oJA+e0agINbzWRNsCg711Sa2rAK76aUvL6k/MjPkpDr
	BV6/yvoiKA70FW/Fy+OxqTGXHabQpYRgjX1FGVNUj0+Qu6sQrvOVm2Zt6xk1eO1ko/bRaeURw5R
	ITJVU5OU7r1+WHGcn8YtNqRFPHaWJ1N/NMc4icA4YlgUSj1dMcinMoyImJXAAfqd258zcQ==
X-Received: by 2002:a17:903:182:b0:237:e696:3d56 with SMTP id d9443c01a7336-23e24fbef08mr150794685ad.32.1752826628973;
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTX0ICCMvqiCRiHCtB0fXgHKCePe7G4D1Ocxr/5VJZponrjW4cuIj/Sc2rud59/D0HbeHIPQ==
X-Received: by 2002:a17:903:182:b0:237:e696:3d56 with SMTP id d9443c01a7336-23e24fbef08mr150794305ad.32.1752826628462;
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e400esm8408515ad.47.2025.07.18.01.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
Message-ID: <94944e2f-545d-4185-8679-65404cd01951@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 13:47:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Manivannan Sadhasivam <mani@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
 <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
 <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
 <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
 <aa2f6350-3235-422b-be04-a03bd3a1010d@oss.qualcomm.com>
 <wbmxxpmcjhsxbracfpvaoishnfz5foqy2rdbp3syqrd377koon@t56m44jvdyft>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <wbmxxpmcjhsxbracfpvaoishnfz5foqy2rdbp3syqrd377koon@t56m44jvdyft>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: faBtg-b-QDO22A45ZB0APIpKZ_HqbHSH
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a0305 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Dy8vuA9QIKNjNhFCyMYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2NCBTYWx0ZWRfXwpYttSUyJQQb
 jSHUSUu18QwHG8aPSYx0JRW0IYlF0PNm+6HWOTqSn+G0G4JK8/itnyelELdYo9wE6XDSFJR/rbB
 1l1ofbEYVG5Z0ijiV6J/EY4MaWU9GNDrwuO1Rv5/DKp9mQvsrGFBMiqq/21+oUHiLUf6dl+o/8G
 IRJQJuY+3WsDBGE5IlyF8QzU3JW/Kg9RTBEu709uViKzI1/QG3VdbzvhfSMbpY0/qiqtUUgU3ex
 hfyDSulw+M01r7BMCJt+I/bgh93N0AcncESc8I0nMVRHQd3s3w5r+qrtYkDFsmeSgQXULkZrg04
 v5PWjIPwfq7JkSrXywTAae8rBczrnzaS2QE7Efue3GsOynpQ+atICbSSyWno3jVg73AVNeYV4kx
 2gOXKiqMCUO2+gtdXsj8+J4t2fAGTN518d2DzHWr7LQ/QZl+SCcxUou3pq42OA6T4JoyrDcR
X-Proofpoint-GUID: faBtg-b-QDO22A45ZB0APIpKZ_HqbHSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_011710_799536_91789119 
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



On 7/18/2025 1:42 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 01:33:46PM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/18/2025 1:27 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>>>>>
>>>>>>
>>>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>>>    #include "mhi.h"
>>>>>>>>>    #include "debug.h"
>>>>>>>>> +#include "../ath.h"
>>>>>>>>> +
>>>>>>>>>    #define ATH12K_PCI_BAR_NUM		0
>>>>>>>>>    #define ATH12K_PCI_DMA_MASK		36
>>>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>>>>>    		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>>>>>    	/* disable L0s and L1 */
>>>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>>>>>
>>>>>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>>>>>
>>>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>>>>>
>>>>>>>>
>>>>>>>>>    	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>>>>>    }
>>>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>>>>>    {
>>>>>>>>>    	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>>>>>    	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>>>>>> -						   ab_pci->link_ctl &
>>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>>>>>
>>>>>>>> always, the 'enable' is not working:
>>>>>>>>
>>>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>>>>>
>>>>>>>
>>>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>>>>>> reboots):
>>>>>>
>>>>>> I was not testing reboot. Here is what I am doing:
>>>>>>
>>>>>> step1: rmmod ath12k
>>>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>>>>>> the issue)
>>>>>>
>>>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>>>>>
>>>>>> step3: insmod ath12k and check linkctrl
>>>>>>
>>>>>
>>>>> So I did the same and got:
>>>>>
>>>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
>>>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
>>>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
>>>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
>>>>>
>>>>> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
>>>>> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
>>>>> reason why the drivers should not muck around LNKCTL register manually.
>>>>
>>>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
>>>> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
>>>>
>>>> How many iterations have you done with above steps? From my side it seems random so better
>>>> to do some stress test.
>>>>
>>>
>>> So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
>>> didn't spot the disparity. This is the script I used:
>>>
>>> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
>>> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
>>>
>>> And I always got:
>>>
>>> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
>>> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
>>> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
>>> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
>>>
>>> Also no AER messages. TBH, I'm not sure how you were able to see the random
>>> issues with these APIs. That looks like a race, which is scary.
>>>
>> How about using locked variants pci_disable_link_state_locked &
>> pci_enable_link_state_locked give it a try?
>>
> 
> Locked variants should only be used when the caller is holding the pci_bus_sem
> lock, which in this case it is not. Unlike the name sounds, it doesn't provide
> any extra locking.
> 
Got it. Thanks for the info.

Qiang,

Can you narrow down AER issue if it is coming always while enabling ASPM 
only. And can you share us lspci o/p of the endpoint and the port to
which it is connected before and after.

- Krishna Chaitanya.
> - Mani
> 

