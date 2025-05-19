Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B909C2D0CD
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBKgpOa9LIacTDKsf1EmuveY+HAYax+1ctIymIVDhcg=; b=0Cxn4DDABGrxcaRuF576Z1XaHU
	FxtVnQioGSfnTXld+bwv490frXaOvMQCJgX0jbK17co8srTzGf8/BA5Fz4eeMYnelFabcPRyMPKSe
	gDcbrm5IuuKUoGB09yMUE9Iz8uHVAYqT929+6t6yckXIw/D+LOqHSG5u1RTtHRtprCGz6cOtEy6jw
	P81tkB2NX0HEuEmnNN+Mht5CF+EF8SRNkBDNvbERvYmRHWZnz8BDhiAyFg9tnR57CM9pxitpC8p3X
	VOczR4QgTB41WaZLjw/Yp+abdaEJFAoGvixLO2aHeSB4jo+kHqpDXFX9UjAfYFZPkYmyKAWklddaS
	cyRn1+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0R6-00000009HB4-46OD;
	Mon, 19 May 2025 13:21:44 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0R4-00000009HAb-2C9j
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 13:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747660902; x=1779196902;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=69JNpM5fMS+HBTIz2jvNUWelHCPlrISQpoxsagPaMK8=;
  b=mp1wwhucw2hWCe2W1qLf2wKTnfDrQRE9kf7N8sp8EHHn1NAuXRZgXcRi
   i6uwK3FF4/2kyCPWjzErkwihW0Bq0wd/ncajjAWCv/7LeOKYTw/V6+3tL
   BHeHFsfd4o0IT4ArtfHzevOUl2UMJTg0euweFR0RSEZdmpB9ZqOZwGRAv
   L4aDzgqDSPcQJzWyfcbyTwLI94w3Ci91J0ZWALcIuJZh+A+4FHzduqkxX
   8mF/pNf+cQUblXvo3CpenGWZoRWzXrATD/Qw36njOsYvzZvZsjsL9LqRG
   62zQMKUJAQohwtsDeLBrhHSH3kfbGWjeFtcBZUXDw2ead5qy0AuCaNBtB
   A==;
X-CSE-ConnectionGUID: vFpIoo9cQk6UmKqxKDAEjg==
X-CSE-MsgGUID: m2orZC79SC+ZHYCjtSLJ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52191988"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="52191988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:21:41 -0700
X-CSE-ConnectionGUID: AV9u1qR6Q8m54A5siYqt8A==
X-CSE-MsgGUID: UA7qCkRSR6y54OVukpdkBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139208350"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:21:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 16:21:32 +0300 (EEST)
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
    Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
    linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
    qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
    Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
In-Reply-To: <20250519-mhi_bw_up-v3-4-3acd4a17bbb5@oss.qualcomm.com>
Message-ID: <649c2bb2-d9a3-66ce-8bc5-2735195aaa5e@linux.intel.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com> <20250519-mhi_bw_up-v3-4-3acd4a17bbb5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_062142_567918_407FF304 
X-CRM114-Status: GOOD (  15.90  )
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

On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:

> If a driver wants to enable ASPM back after disabling ASPM for some
> usecase, it is not being enabled properly because of the aspm_disable
> flag is not getting cleared. This flag is being properly when aspm
> is controlled by sysfs.

This sentence has broken grammar/is missing something?

aspm -> ASPM

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pcie/aspm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
>  		down_read(&pci_bus_sem);
>  	mutex_lock(&aspm_lock);
>  	link->aspm_default = pci_calc_aspm_enable_mask(state);
> +	link->aspm_disable &= ~state;
>  	pcie_config_aspm_link(link, policy_to_aspm_state(link));
>  
>  	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;

I disagree with this change.

The problem currently with ASPM driver is that pci_disable_link_state() 
and pci_enable_link_state() are not symmetric pairs despite their 
misleading names. pci_enable_link_state() should be renamed to 
pci_set_default_link_state() and if the symmetric pair is needed for 
pci_disable_link_state(), it would have to be added separately.

I've some (rotting) patches which try to do that, in case you want to try 
to solve this inconsistency in the ASPM driver (I can send them to you)?

-- 
 i.


