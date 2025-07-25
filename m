Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29459C83F26
	for <ath11k@archiver.kernel.org>; Fri, 25 Jul 2025 03:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAgCxVEFH4EwgekZ7jqlaF3NdXCGkoGWDEW1KVwMxh8=; b=XDXNHFhhfrUePZq/JSYTxVCus9
	WDtH3vAR9R667l22zuHiF8/P8IqDc2kgnxSz/d2KVdCPAJFkvuJBWjFHK9uiACU8vQZuF9c1J1kb9
	ZThC51IhA0fxjdv10KYVms9J2IadmFkI9dS/M98dCTnsTzoJ/XGjekPlDsAldAyNTpPeAdMkbXCYn
	ypD2/KLcOg87FOEfeupgPTONE64bFUIJz5LIcfRP9NoFI9zEDPz/Z+uhPGctYtFV9Z1Xd1bOBoixp
	0/5beICk4dl5xPYBAR1VZMCoNZ36v9n87IY42NQmcd/QTBQf725ZkKlHMvenk7CzexzUa8d4oQl+y
	ozJb5U8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf948-00000008yBA-1TPp;
	Fri, 25 Jul 2025 03:25:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf946-00000008yAd-0Kii
	for ath11k@lists.infradead.org;
	Fri, 25 Jul 2025 03:25:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLrGup015704
	for <ath11k@lists.infradead.org>; Fri, 25 Jul 2025 03:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAgCxVEFH4EwgekZ7jqlaF3NdXCGkoGWDEW1KVwMxh8=; b=B9epV11FfCQV+COt
	gJAr7LOIZ4aRCYBQTj8saWj3U8Y0OR55jUoP1WBW+SvDp76jxvLMlTEe6NG0q7Ry
	Wi9xl79T9HVthEeFdiKAnXuujjzon6l7O6WgeQyqJqOr35+Jb3ZbgTZZ3b0hdLFK
	7rSMc46i6wgDeRRxviG0fGrZvyX7GAMxLWyBZBT+4y1IzAzAtoSPf7oGaZNMQK62
	o/v4gCXs9WDQTk5UNomjUKrP9IfXYpGSckILUkKYL8qVVryQHRDqNgi3vAIjgRD2
	ERh5oxK3m/6jABvHbDrd26Z0my3QBQqAG2gM5KZ86mQbbo7O6Az0Ac8igtvRe8Mu
	en1y9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w500mqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 25 Jul 2025 03:25:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74ea5d9982cso1478925b3a.2
        for <ath11k@lists.infradead.org>; Thu, 24 Jul 2025 20:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753413942; x=1754018742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAgCxVEFH4EwgekZ7jqlaF3NdXCGkoGWDEW1KVwMxh8=;
        b=J41/whWY9ae1T7fUs72/LqoEklJPDVH+wHj5Hrg9EIRHmTm/Zp1hlt56x9Lah5QTo4
         OBV1fLJMxZVxHoXUzqyv17Ag6d7Ho8TvtyTTqkhyR+z1x7ZEdj6ZTvVLTgpw3JBYsB6P
         ekcQDuGOPY1trXRC87MUDYdYD7cO+wwxVUHHLgUhQQE0Ewj0cqXgUltVZPMniwPU22ln
         XbUYStCHE+Yka6Ed4Q9NrfqcVXIOLkHQ+Vx08XbYl4+rQIVOAzUxMpqXgzA1rnqlTtvp
         JTnJ2PY3adlgDM/8M8PjJE7LUYKeXAOyFmf+5jMVjFdKWvnETNuL902oQxdI2gSSypD+
         emUg==
X-Gm-Message-State: AOJu0YwijR727wNU77AqhCing7iusE1L8ox5PoF6f2SlVFqCoiE5+Wdj
	7i1AIQ2JufsvEgijB2UINzIpCIyJImkCbb9R8uCdHC1c70LjhQkOIGN+2DhRhJ8DEl4PHfD4eB6
	V551csMU6FT59eWNM/XLcACf6rlwDcudyx+KHxicOMvi9yoH3vhDx1x8UjAOMxKAz
X-Gm-Gg: ASbGnctww1DdsoW4mQRnsk1QfLo3Pv9YfIqNzAwPzaanMuTnO7yhV7l01lVK5HiXM7a
	DGQacebi0bZ9crMnjYCR6UZ0P+WkElaf2xVJVN37UAQX1R3LBpyHgP4lRgFVPWciFfpbdypJxdW
	Gbaj4JvlmnEXGNeE6cYmYXGXbLBAfHn7s+6isXeS7I8FbLFc2hYd8uPI/G7jLZG8aaXgvCVQesz
	hztwdUtkneQixSQbW4W0k1aJ8YGTjUHbTteIMnoyyPO78AOGTEMmK0VO2QCLVCqEX+XupG2PNBv
	K71spJDIJNb/R4uXOchvckNZn1hCrrB40hfCrLANMLoR8TnczoIc+QFFzJKpad1lTAnqba0vxnQ
	o6vsH8Sf738ciEPWZgFzTMIozME2G/Vc=
X-Received: by 2002:a05:6a00:13a8:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-763382d6fbcmr607454b3a.11.1753413942274;
        Thu, 24 Jul 2025 20:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHncZoW5RENbDvszxFyfWEajWqb1Oi9KTnRhml7Lt1AqE/V3LJWkfgGNgBvnGH1vpwvtqghiQ==
X-Received: by 2002:a05:6a00:13a8:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-763382d6fbcmr607426b3a.11.1753413941794;
        Thu, 24 Jul 2025 20:25:41 -0700 (PDT)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b0622bedsm2770417b3a.120.2025.07.24.20.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 20:25:41 -0700 (PDT)
Message-ID: <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:25:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: balsam.chihi@moment.tech, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250611164004.38580-1-balsam.chihi@moment.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: srIyEmfvfwPp2l6LFZZG_btEQPrvP9T6
X-Proofpoint-ORIG-GUID: srIyEmfvfwPp2l6LFZZG_btEQPrvP9T6
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=6882f937 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7G27ipKfusndooSKQysA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDAyNCBTYWx0ZWRfXw3fa2vyjtqL4
 VoabWQI6adD7i3sG15sZ4Uzdj7XhmsPJs7PQ+agvk/neGYmgjk/zrg543BwT03fgVSIj+nnWw1D
 PoLIv1c1nWerSKKwAnmCN9a1AUqUUcd0UzcR0UNH5V0VikWl3IVpSKKVcEhsjg7osLZRdcVbN+L
 75yK8fflp9emIXzttlNPsZsPG8A5/+UN86k5QItHtgBxngOyhn/wGdmLvnacWM8D/P+gDc+0UHz
 SGkZRW+sbE8I3u+Jq65u9w5NwSyMxZnvvh+j6w2W9c99Eo+q6FEvWsvFTLjNCTB/xoRepzKT20p
 MWoRfRgRjHmWBhL5x+MZ+zLNYSany1fzTwao2KScuX0hZ70A64q2n42/IXO/9Mb7+7finxXEcRG
 sIpBNZSR2bHap26ar5h25wWlMR3C5ba8gTTfu8K+wW/QxyRpzx7r/OUENRVkwi/2iaDgUtmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_202546_251164_FF14AAB9 
X-CRM114-Status: GOOD (  26.27  )
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



On 6/12/2025 12:40 AM, balsam.chihi@moment.tech wrote:
> From: Balsam CHIHI <balsam.chihi@moment.tech>
> 
> During system reboot or module removal (rmmod), a crash was observed
> due to a synchronous external abort caused by invalid register access
> in ath11k_pci_clear_dbg_registers(). This happens when the device is
> already powered off and the driver attempts to read debug registers.

What does 'powered off' mean exactly here? is WLAN powered by an internal/external supply
that will be removed during rmmod/reboot?

> 
> The crash log shows:
> root@OpenWrt:~# reboot
> [  343.663492] Internal error: synchronous external abort:
> 0000000096000210 [#1] SMP
> [  343.670992] Modules linked in: [...]
> [  343.842432] CPU: 7 PID: 9435 Comm: procd Tainted: G O 6.6.86 #0
> [  343.849746] Hardware name: LS1088A
> [  343.856969] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  343.863933] pc : ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]

I don't see any relationship between ath11k_pci_clear_dbg_registers() and this PC pointer.
So how did you locate the problematic register access then?

> [  343.870125] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
> [...]
> [  343.950800] Call trace:
> [  343.953241]  ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
> [  343.959080]  ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
> [  343.964671]  ath11k_pcic_read32+0x30/0xb4 [ath11k]
> [  343.969477]  ath11k_pci_get_msi_irq+0x528/0x1900 [ath11k_pci]
> [  343.975230]  ath11k_pci_get_msi_irq+0x1460/0x1900 [ath11k_pci]
> [  343.981068]  ath11k_pci_get_msi_irq+0x1750/0x1900 [ath11k_pci]
> [  343.986906]  pci_device_shutdown+0x34/0x44
> [  343.991004]  device_shutdown+0x160/0x268
> [  343.994928]  kernel_restart+0x40/0xc0
> [  343.998594]  __do_sys_reboot+0x104/0x23c
> [  344.002518]  __arm64_sys_reboot+0x24/0x30
> [  344.006529]  do_el0_svc+0x6c/0x100
> [  344.009931]  el0_svc+0x28/0x9c
> [  344.012986]  el0t_64_sync_handler+0x120/0x12c
> [  344.017344]  el0t_64_sync+0x178/0x17c
> [  344.021009] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
> [  344.027102] ---[ end trace 0000000000000000 ]---
> 
> This patch adds a `power_on` flag to conditionally skip debug register
> reads when the device is not powered, preventing invalid memory access.

why is only 'read' concerned here?

You are skipping several 'read' in this change, could you help narrow down which
individual read instance causes this?

> 
> With this change, the system no longer crashes on reboot or rmmod,
> and the driver continues to function correctly when reloaded.
> 
> Tested-on: QCN9074 hw2.0 PCIe on LS1088A
> Tested-on: OpenWrt 24.10.1
> Fixes: crash on reboot/rmmod due to invalid register access
> Signed-off-by: Balsam CHIHI <balsam.chihi@moment.tech>
> ---
>  drivers/net/wireless/ath/ath11k/pci.c | 36 ++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index 78444f8ea153..0c1b55957557 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -203,16 +203,18 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
>  		ath11k_warn(ab, "link down error during global reset\n");
>  }
>  
> -static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
> +static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab, bool power_on)
>  {
> -	u32 val;
> +	if (power_on) {
> +		u32 val;
>  
> -	/* read cookie */
> -	val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
> -	ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
> +		/* read cookie */
> +		val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
> +		ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
>  
> -	val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> -	ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
> +		val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> +		ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
> +	}
>  
>  	/* TODO: exact time to sleep is uncertain */
>  	mdelay(10);
> @@ -223,14 +225,18 @@ static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
>  	ath11k_pcic_write32(ab, WLAON_WARM_SW_ENTRY, 0);
>  	mdelay(10);
>  
> -	val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> -	ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
> +	if (power_on) {
> +		u32 val;
>  
> -	/* A read clear register. clear the register to prevent
> -	 * Q6 from entering wrong code path.
> -	 */
> -	val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
> -	ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
> +		val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> +		ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
> +
> +		/* A read clear register. clear the register to prevent
> +		* Q6 from entering wrong code path.
> +		*/
> +		val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
> +		ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
> +	}
>  }
>  
>  static int ath11k_pci_set_link_reg(struct ath11k_base *ab,
> @@ -368,7 +374,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
>  	}
>  
>  	ath11k_mhi_clear_vector(ab);
> -	ath11k_pci_clear_dbg_registers(ab);
> +	ath11k_pci_clear_dbg_registers(ab, power_on);
>  	ath11k_pci_soc_global_reset(ab);
>  	ath11k_mhi_set_mhictrl_reset(ab);
>  }


