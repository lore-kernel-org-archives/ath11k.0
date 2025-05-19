Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27583C3ABD8
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LbTrNkXD9stKUmmWDKrhG6l0dvFwmdG2Jc6yxP/TOw=; b=viAGEbomkyzpQB6aezQdd0pPBX
	uk/fGgb7jU1UjcY5bTFO5wmqWLpjxCWAOCTLYmdgw+9hQvDrhYNGWMAAimCirEtaQSA5BBNR3cC6V
	H0i09IcidVBDs06e/ggxj1dxmZgry7S5RaFohwRMpLaKa/dkOBYglnnakMDXg+Jnmpgv60z6Ub/lg
	NkCXY0lsRUbUdb+MH7IBTf3Slg/OMb0LuGOurbAN0tIGODZ22EyPkbizLQCnfDTDb06a2yq0BZx/C
	9mw5ZjabGiMwSYt6QoBKQR40v//Lhp3Yuj1eHPE1KSxRT6eh5XxxD41Egui5Zn8WvU+srwNGpc4je
	f8GsCtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0ZO-00000009I3e-3pe3;
	Mon, 19 May 2025 13:30:18 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0ZM-00000009I2L-4AEC
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 13:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747661417; x=1779197417;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=jn8+LqZ4HK4vBVVQqZdDv+ihoDP6BFDKfhN7yPeNEac=;
  b=bdLivsjcZIbXFb12rA5qTFfC8ULrfiwkmI5UbXK4Hm0Ex8RaWy3e5hSd
   bZlroHQ0RRQt9Ie4uEykAiYCkUWi0TpbGMeXspnsnUaGr2SzaTINC1fPm
   NAE+5ydaaBcithnFqD6fbYzIrW90LBpKyopyc6kJCn6w045/ApkXynNL5
   qsU+wVHqR+wGTTyMBnMtT7z6WUw7x5oDlbmBqdSGxLrASmr7E0uxmFekk
   BYKaG04/fWM/PtdJRujup1shvWTsaVO2Gcwn4UHYn+qMFt4ZRWqXXyqRR
   HizutpeNoSr7vOvO/ZMuUESa2hFvQv0kV26MZ8T3ysraFlUZU6JgeWktp
   Q==;
X-CSE-ConnectionGUID: FGmXjCEZRbW4fvAtjRcDYA==
X-CSE-MsgGUID: J/0qdJUXSXO2gaRNv1P/qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49625765"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49625765"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:30:16 -0700
X-CSE-ConnectionGUID: /UHagtsZQ2C0NZ93j31Igw==
X-CSE-MsgGUID: ZOmbe/ZFRBOhjbuGEFihvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="162659044"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:30:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 16:30:06 +0300 (EEST)
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
Subject: Re: [PATCH v3 09/11] PCI: Export pci_set_target_speed()
In-Reply-To: <20250519-mhi_bw_up-v3-9-3acd4a17bbb5@oss.qualcomm.com>
Message-ID: <bfba6d6a-1880-a824-6418-f0f6ef6ff6f4@linux.intel.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com> <20250519-mhi_bw_up-v3-9-3acd4a17bbb5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2092066973-1747661290=:928"
Content-ID: <ff8a6aeb-140a-fed4-c46c-3edcece60150@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_063017_106511_A4127429 
X-CRM114-Status: GOOD (  11.10  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2092066973-1747661290=:928
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <fef147ed-603d-e261-927f-91ab601d3a5f@linux.intel.com>

On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:

> Export pci_set_target_speed() so that other kernel drivers can use it
> to change the PCIe data rate.
>=20
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/pci/pcie/bwctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 3525bc0cd10f1dd7794abbe84ccb10e2c53a10af..02c544c6186b8c6b87730d1c9=
24f07858571d2ae 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum =
pci_bus_speed speed_req,
> =20
>  =09return ret;
>  }
> +EXPORT_SYMBOL_GPL(pcie_set_target_speed);

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.
--8323328-2092066973-1747661290=:928--

