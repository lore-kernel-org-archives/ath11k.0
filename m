Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D67C83F22
	for <ath11k@archiver.kernel.org>; Thu, 17 Jul 2025 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B723+r5BA8byBPbGDEYFQhUBH8gC/ULM8G4kkMzp/9M=; b=nc1tz2KWB88ve0wMtFdF+F38O2
	QdwvU5UjUR1hdZVgDC8AJw9zt7eYS4/c9cHSee/caq8rV19cgAxXh61nwBU2FmEjwSP76jWSHmKXH
	W2+dIqrcSuVscRCe/yiCSDxHyRwvpJOt8UvWzG+U4v9c192E90qurjq099IwY66JNjYbPSG5g177n
	fFryifuRFkCXGGQPUk0pEotY5Je9rz/+gTl+sqNBoivNfi7295nAUv+cLLbeqYJx1g698eKEeIGPH
	LEyRD6gxrEg60cqiCjWtJcot28EeC3EmFF8m0V3zO7q8+CwAEr38i2W8z9KW/2bJI6lHlxx7CYZVq
	Sp53BBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNOS-0000000A4Rv-1E9D;
	Thu, 17 Jul 2025 12:07:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM85-00000009szS-0K9D
	for ath11k@lists.infradead.org;
	Thu, 17 Jul 2025 10:46:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4Qm3D021601
	for <ath11k@lists.infradead.org>; Thu, 17 Jul 2025 10:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B723+r5BA8byBPbGDEYFQhUBH8gC/ULM8G4kkMzp/9M=; b=fhwLQQSgwvLCf9ab
	+C/qprDc5R9QOC2pu3ZcWhRDBjWWi9PTbsx2XUyhTnsVoAJagIZscIRrl+VMH6yi
	sr107eM3f2aBaXIya40TniFoJ0BXK0V4BYXl/qIkW5BznQeH1pmTPZC39Drv4IbT
	wDwhOzBz1a3xuhpb1cv916N0bBN4RuI4Q9UT7rSlnTWHROHcRhGUk1YqEnIyjTca
	ByOCxcESv6JrlX3Fsb3JzVI9KfSEK2uaQaCGYNNYcaa6KV63dAtCGY6fJNRDy8mM
	2iqd2A7QiZlZUeMCrFC2TnelAQsUmGKXZ9MV/goKKXXBp6/0Ocf/HlDBuPFkuqQ3
	ur08+Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpjauy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 17 Jul 2025 10:46:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747ddba7c90so804021b3a.0
        for <ath11k@lists.infradead.org>; Thu, 17 Jul 2025 03:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749179; x=1753353979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B723+r5BA8byBPbGDEYFQhUBH8gC/ULM8G4kkMzp/9M=;
        b=BQNmntYNOWW7uKjrqf/hEg3SjT09HRTT5XfsnO6YyPbO6j3zwm8y/DDjjwnuhKUmsm
         z+dbg+ueD6ut1+8x2SHND3qXByX9oXsTpOECbcYzko8CcI8LjtQp+aDk8Xo73Z15RKF8
         iDQZ6s4PfWWDp6z4gPgDtq8sDkZd7r2J5JwVQzAw/5yRC2Np9tW1qUWNRzZzjeHWji6f
         b0wUKzHwH6ivNXIFBw7Gr/6Qw0Z5dMwstN1Y27+MzkW0IVFNo42UP7L78etVD7uocFwY
         SJr/bm+Gcfj8LwRSx5lwybw7kRH3UCnMFA5SOxrEfiZaVkO+sL7tamfVWQBI7wEdoXUB
         6Rkw==
X-Forwarded-Encrypted: i=1; AJvYcCXK13fUHEEK4g5sqQ1xu0qT/PhZlTq+REdD3DS9KOXAy+SsKlV55mGC3aj72pYCn9n1NNNPeYs=@lists.infradead.org
X-Gm-Message-State: AOJu0YymEVhMnuTwCYd7Q/TnKozuZO0rGLpoAo4P0jNSYIwj4zBDdxtQ
	LWQ9JH0LzOqLpdxudC5xm0nrtKsG3S4dnoomUizPZG3TJKdojD3gK0dDabbfJecjx/nXXgyJiBf
	bOGCEfth1IJ9S8eLFeTf++JimfKe58hch2RQJyQV8IZ55qRMwfqdwUPq6IKTSx/q9
X-Gm-Gg: ASbGncsDvKWYjLGzySl0rFqXnvSxWKZex8LppYdbSiX6TznkHwqD71eY1LQJ87fYoAs
	rxDUVEkWR6QYYn1zKjYN9g0FURVuGcSQWcZMdjDLpzd2NjwTL+F4X7SUsUtrywvqoQV1pkORzEW
	yp2ZSd5b7n+t70LEKfCl+NyzAmh7awrkkKhv7ELaWiAGLJIMyegdfsPkS5fNUJeIKMTxbTyKJt7
	KyFHcg0FCrgZit/vUGgu5lr0QOBeK3X+A/np3dAFVVQzSAx0o6Y/4VhSQ4q9dXt6jI0pAidB5ge
	oU2Xq7IOHZVAHMusKhLSSPxL/9QWOT5JeqgFD56QOwDT5Y5UjXBbCLl2+caIhX+Y5J/xq54U3dg
	4gmDc3Zzi3gJesQeVDObxcn3l7N/zl0Q0
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id d2e1a72fcca58-75930138e54mr181450b3a.18.1752749179237;
        Thu, 17 Jul 2025 03:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJuVslIFv21m6ImazfJSUw6oMv57Mp8930u7+QPOdytv2k43uhEySGP6kVYQgfWfa8cNhOpw==
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id d2e1a72fcca58-75930138e54mr181410b3a.18.1752749178734;
        Thu, 17 Jul 2025 03:46:18 -0700 (PDT)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f25269sm15886150b3a.107.2025.07.17.03.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:46:18 -0700 (PDT)
Message-ID: <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:46:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Manivannan Sadhasivam <mani@kernel.org>
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
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NCBTYWx0ZWRfXxtAW/Dkkn4Oj
 DrvI7Hirl615kKG+vVYENRlZSm5URbJEhDxm6zF/c96S17A7rkkyFIF7XsW3sL+NSAfqDkpiBFt
 j9u/tPxXYZGOAQeqz6kTwU6RzKIz4/3jY88Xob6Rx8XeubSpBnJKKVfc1iJ0CQX3lcT3kLVk630
 SZWZ0cOmU15oUb5HNd0RjVgt401o4PvowUCk9/J3q9bVrsr9ZiaPFpi/lPpQ/jPfp4kDBkVmIiF
 sPaU07faSpmx2rmtKXP8LmIW+NM5wWmFpAMpNcRfzfbQX5doH7UIj43oTdAbTuNCAZKSJhf/qPV
 Yn1mMRZBuVCdo+BVNk/GWlNrPSRNILeLLVFEFWlln5OBgOhjTRi6ZxPSbIGfp3DLnnJdujwgQfK
 QSMWdpw83klJu+NmbOyXXsMewNuXqESXS0B3EZDAFNl2uBswlFPPWjGyJ8/PFUTg9K/poPLa
X-Proofpoint-GUID: bSt2hr9_Dz1wJfaQcRF-GY5T7FK9sxhJ
X-Proofpoint-ORIG-GUID: bSt2hr9_Dz1wJfaQcRF-GY5T7FK9sxhJ
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6878d47c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=oqDAYNfCzTduPHUzJrAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034621_171358_7C775500 
X-CRM114-Status: GOOD (  18.97  )
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



On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
> 
> [...]
> 
>>> @@ -16,6 +16,8 @@
>>>  #include "mhi.h"
>>>  #include "debug.h"
>>>  
>>> +#include "../ath.h"
>>> +
>>>  #define ATH12K_PCI_BAR_NUM		0
>>>  #define ATH12K_PCI_DMA_MASK		36
>>>  
>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>  
>>>  	/* disable L0s and L1 */
>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>
>> Not always, but sometimes seems the 'disable' does not work:
>>
>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>
>>
>>>  
>>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>  }
>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>  {
>>>  	if (ab_pci->ab->hw_params->supports_aspm &&
>>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>> -						   ab_pci->link_ctl &
>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>
>> always, the 'enable' is not working:
>>
>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>
> 
> Interesting! I applied your diff and I never see this issue so far (across 10+
> reboots):

I was not testing reboot. Here is what I am doing:

step1: rmmod ath12k
step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
the issue)

	sudo setpci -s 02:00.0 0x80.B=0x43

step3: insmod ath12k and check linkctrl

> 
> [    3.758239] ath12k_pci_power_up 1475: link_ctl 0x42
> [    3.758315] ath12k_pci_power_up 1480: link_ctl 0x40
> [    4.383900] ath12k_pci_start 1180: link_ctl 0x40
> [    4.384026] ath12k_pci_start 1185: link_ctl 0x42
> 
> Are you sure that you applied all the 6 patches in the series and not just the
> ath patches? Because, the first 3 PCI core patches are required to make the API
> work as intended.

pretty sure all of them:

$ git log --oneline
07387d1bc17f (HEAD -> VALIDATE-pci-enable-link-state-behavior) wifi: ath12k: dump linkctrl reg
dbb3e5a7828b wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enable/disable
ASPM states
392d7b3486b3 wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enable/disable
ASPM states
f2b0685c456d wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable
ASPM states
b1c8fad998f1 PCI/ASPM: Improve the kernel-doc for pci_disable_link_state*() APIs
b8f5204ba4b0 PCI/ASPM: Transition the device to D0 (if required) inside
pci_enable_link_state_locked() API
186b1bbd4c62 PCI/ASPM: Fix the behavior of pci_enable_link_state*() APIs
5a1ad8faaa16 (tag: ath-202507151704, origin/master, origin/main, origin/HEAD) Add
localversion-wireless-testing-ath


> 
>>
>>>  }
>>>  
>>>  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
>>>
>>
>> In addition, frequently I can see below AER warnings:
>>
>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>> 0000:00:1c.0
>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>> Layer, (Transmitter ID)
>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>
> 
> I don't see any AER errors either.

My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
never saw them until your changes applied.

> 
> - Mani
> 


