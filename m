Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E23CA0FF2
	for <ath11k@archiver.kernel.org>; Tue, 26 Aug 2025 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8Cf1CJKboWxP5q6R9op8Umbt3K2i/Dw/P1MbHCzwOI=; b=44m/mwjBJTK1icg9Zi3kGBPkmz
	w8ePElUta3bzKthzMY3P5cPGIulxGNeMl6h/+rUiIaxd3fk/a5BwnLyPIqBBcmLZ1dzJZJ8JjIjex
	EBVgPBf5Xgs52U3D0Pl12gU/bXe+w3j2cnRsOom76lPDpqannWZex9hmsPz0hphjs1U4+pNwC2pWx
	JAAQf8GaCXbxpko2ZW+Nte9zVK6hvKsyWsJyLJvio9IsdBuDK/NoTdVjmn3spzj1D1i19FhEAxsuh
	fDbL2gFTTcMMFHaUwDCzT6JZwdR/rPtBu9fA6FCfWyTHBL4xPtZ4X51GBKzXl3k5bgYtp4wo89PYS
	RecjDQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwlz-0000000CgIo-1sg2;
	Tue, 26 Aug 2025 16:43:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwiv-0000000Cg18-2zKo
	for ath11k@lists.infradead.org;
	Tue, 26 Aug 2025 16:40:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFEkhU012095
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 16:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8Cf1CJKboWxP5q6R9op8Umbt3K2i/Dw/P1MbHCzwOI=; b=G58DRmbuwEUS4o2h
	8tV3cbWxBlhGZysuRweeh60AncgOaM3rPSQVPCZoBEAdLGxK60cKoGCIOuJEcL7m
	Q9mNEve5xv+EfeCXpqc3lWz+dr/U9cV+wYYyO1mPltRPWf2NarpdBrziynk4lUsz
	NeFX+VrObpy/5frnVlzvuOKGstYpF33J3323wdw/xDs9NC6GxCFqOLKk3aG9gaF/
	vX/DA3S0beVvqKryKMVJ+L5EZe/2ZKps8tdsnIKx7+EwA68MhxdGvLDSWLRz3R6x
	YAiQoB857POlABA/DuetPtzzqDFQ7rzMPHPm2rA5kM1xdzqfeXjPaA/ca0Jx3Ly/
	ju7H9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615hkbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 16:40:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457ef983fso118866245ad.0
        for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 09:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226439; x=1756831239;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8Cf1CJKboWxP5q6R9op8Umbt3K2i/Dw/P1MbHCzwOI=;
        b=p4rBgzBiDHsXMpXYb9qR9UUyqCMzwqjbnOTFb21WxFNFwiyEtehFF3nMJg0rAmXhOY
         wyr/EnR0xN33TkNrej2B/x3q0xIyEKnwsbtMsTA4c1QmySLjs5V16DE9BQFhVpo1Bd0M
         SFKqD0yLzOSbnxfGbZTGoeiT6zhaaYyCGSUjuxASz32ntHO+VQ/HmwF3exktWTg2vj5r
         +2FUg8G9MG+l7w1rdmcl7k9nyP/HyBdjlbrHAZ83k0601qOzf+W3YQzO1MOg1I9Hf1cW
         1rhWONuv+XVeGyEhqU5oR7mcVm5Am2fw26Huq4ZoLdVmumc7PzU4TfoF/KBme+SGDeWF
         ijgg==
X-Forwarded-Encrypted: i=1; AJvYcCU4MwjkHdfSAlNoGDlgzGYbycZ4AO3MOJ71uynSvlbYieSH+NUvtXbiXKYgIiStw1d+aUr6nKM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqoB2c+pNYCvkJZlzAmpq7L9YiOPuFhPx8iLjCSCdrLDlQ0Tke
	BQNMRqoluEfc8HH9Z7rDlewLf2xuPxU0JncNJFgk0Kt+43oYAqQxilsqYqYE9tLka3luEQb+8EZ
	/Ro6eUtr2zPeSMVw8pf3DYBOLV3v8htGN3dcvhrUtjncjnP1ndaW8ccxGJbz4jZcm
X-Gm-Gg: ASbGncsv88G+S4yHocPgGhZKm5q8wUFPGRFoggZLZOUQrY/QpAgR8SV92SbtqhFiHZx
	xrXfZMQdyE1XGoqH9XUQ0Vdyof7Po9Ql9N5AlJlYHnZv+obQgDE5NmNEEa2t95KLRnNfUtA+1E9
	s/zG/JuMrLfnzd5YvXYvk9ih/uaILdZriCxdGegZETs3r9trRJpbHuL9NlV2kkiw+kn2rKZqrJE
	XkP835FrUTsRJBTKTmSKdBXRz4MVCcDCG9qG61Mt26wq30vbflBpO/bjmmOI79UW56qYYpIc/JZ
	kW1dUf0BzkGMYgW5z8R+3CK62dfeinUERHirX8aeSIEVpEuc6LwWyUSuuqnqHmS33GqLxbi7NA6
	hFk+DFfzjBBa3PpUv/w0=
X-Received: by 2002:a17:903:187:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2462eded8bbmr208960595ad.14.1756226439415;
        Tue, 26 Aug 2025 09:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkvFu2SKqaYn2g8jSdQZR+kEMDsbfiuYDSgXyjcnbv8H+hGCJesN+r1R0F9BmVI7ktbx+DaA==
X-Received: by 2002:a17:903:187:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2462eded8bbmr208960165ad.14.1756226438902;
        Tue, 26 Aug 2025 09:40:38 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668864a4fsm100775575ad.91.2025.08.26.09.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 09:40:38 -0700 (PDT)
Message-ID: <e4178055-f3a6-4cb3-8c86-731130c6f25a@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 09:40:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] wifi: ath12k: Use
 pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, ath10k@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
 <2fab10a7-8758-4a5c-95ff-2bb9a6dea6bf@oss.qualcomm.com>
 <705a4fe5-658e-25ac-9e4d-6b8089abca46@linux.intel.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <705a4fe5-658e-25ac-9e4d-6b8089abca46@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX+t6AzT54Mxxf
 6w7A7mBdLzEyRfCnPFddipDc2HIiEcMoJspkM8bfqwZeJ4GzgqVVfeH1XdpuSwyp8hXdE4l82y9
 diI2rcpI51pd2iJBAUpBXBwttlChFP0DpfRMLDA5JwPCzu6FHzdSzxHw2+eODD/EYN4h3QRcgOD
 EK24Ridu3+jYg5v0Dxp/6+y7XQNNTdPvDcJaG+HYInq8xvB7cUKOVfeb50XcnZbFK+5ZqJWl5Ys
 dMjtoEkLIcMOv4/cD/H2RngOXMm3GVZnGceW8j59XZrNwkaIEnXHYyuHDqfYtd7rTTPa96qEMkb
 nBdSU3IF2tTguEd/OlOmZJGhGJ1Pqt8K9j0+Px0QmJwi8h5dDhLA0eXlFHKlkUMJJMwqQx2ox7S
 K5os1wbu
X-Proofpoint-GUID: rKVsgGWRbCihMPzKTQ1lVCqGx5R4XFKA
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ade388 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=8JU3Fd4Pt_mHVKaqA_UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: rKVsgGWRbCihMPzKTQ1lVCqGx5R4XFKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_094041_886989_F53C1A79 
X-CRM114-Status: GOOD (  17.65  )
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

On 8/26/2025 9:00 AM, Ilpo Järvinen wrote:
> On Tue, 26 Aug 2025, Jeff Johnson wrote:
> 
>> On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
>>> --- a/drivers/net/wireless/ath/ath12k/Kconfig
>>> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
>>> @@ -1,7 +1,7 @@
>>>  # SPDX-License-Identifier: BSD-3-Clause-Clear
>>>  config ATH12K
>>>  	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
>>> -	depends on MAC80211 && HAS_DMA && PCI
>>> +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM
>>
>> As you point out in patch 1/8, PCIEASPM is protected by EXPERT.
>>
>> Won't this prevent the driver from being built (or even showing up in
>> menuconfig) if EXPERT is not enabled?
> 
> It doesn't work that way, PCIEASPM defaults to y:
> 
> $ sed -i -e 's|CONFIG_PCIEASPM=y|CONFIG_PCIEASPM=n|g' .config && make oldconfig && grep -e 'CONFIG_EXPERT ' -e 'CONFIG_PCIEASPM=' .config
> #
> # configuration written to .config
> #
> # CONFIG_EXPERT is not set
> CONFIG_PCIEASPM=y
> 
>> Should we consider having a separate CONFIG item that is used to protect just
>> the PCI ASPM interfaces? And then we could split out the ath12k_pci_aspm
>> functions into a separate file that is conditionally built based upon that
>> config item?
>>
>> Or am I too paranoid since everyone enables EXPERT?
> 
> One just cannot control PCIEASPM value if EXPERT is not set. ASPM is 
> expected to be enabled, or "experts" get to keep the pieces.
> 

Thanks for the clarification. I now have no issues with the ath driver patches.

/jeff


