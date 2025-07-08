Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B3CC83F09
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01lM1aMXwB8MMO0qW04v1WJgsckcyAykmLcNvq19j4k=; b=XtYt+jAiJUob0B+m6hnmGwhpr5
	YBgBD0jZnqajfPT5oHmQ7Xa6Y7rsW2/dAecIKqooQ5ltdgv0KIeg+CNkVuZ2QSPLMRl3N5jgAovOs
	W3yZ/c0Q4Qto2wuEEn5Lr+pWI8gzbngUZwbP5zti9MYn63PCA6/86cqEdoDViUmV6wQj0v7jT4/2Z
	7t7TTuyoqGGiV50R/gMLmq0XJW0Xq+ljF48vpyBEYvj0xBvq5uWJO1c0zhjOgxBX38OErS4ecoLdk
	nuh2FrmDI4gNP7Xz5wEJ+X2s0SgKxcn3QFjqplyNMyf9/QZiDg6Ly/+QcFWEoGfPdJcBD2n2iktq4
	2Bqj4clQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCVp-00000006AqL-2RMl;
	Tue, 08 Jul 2025 17:53:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByW-000000066Ad-1z57
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0789449C4;
	Tue,  8 Jul 2025 17:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A3EC4CEED;
	Tue,  8 Jul 2025 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751995163;
	bh=YjcSIKwzWx+y59NsLqb2Sq1rlWrfeyHEI74U75VzYhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YupQ0fRi/jd248RnYSxckJ3rI2Hf7dDwKl1r73wmizS7K7KfOLHWYV504AV1bbsNh
	 w8LiJveWIkC/BLUH4MAsjSnm0ku09bjxacHWEdv6YD9vLsGTgMDRRtWWQe1MpmJLjS
	 2Xj9hic0l4Xue5wlumPmdDCaFntf1fO/6uJ9rtug0M4IX36ByRwDgnrXO0xBJDbPW9
	 bSIfOvMsR8eoBFSFTGVACrrxIk9zrCPTIe0KKgP870B7qeBSoELObNltlqY9xq3b98
	 GS4axDNb2GGyG1a1wbJlC01tnZlrCgbtgiXpw0xujDEiqvkkY9u8ztDuqRH5vd4fHV
	 2fo64+sL6QOqw==
Date: Tue, 8 Jul 2025 22:49:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] PCI: qcom: Add support for PCIe
 pre/post_link_speed_change()
Message-ID: <6awuzg6leintuqmbrn2hztjmimtvbokpiivui3lfzlscx33odu@mkh5jtfszi5r>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-8-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-mhi_bw_up-v4-8-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101924_578598_42BE2604 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, Jun 09, 2025 at 04:21:29PM GMT, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controllers need to disable ASPM before initiating link
> re-train. So as part of pre_link_speed_change() disable ASPM and as
> part of post_link_speed_change() enable ASPM back.
> 
> As the driver needs to enable the ASPM states that are enabled
> by the system, save PCI ASPM states before disabling them and
> in post_link_speed_change() use the saved ASPM states to enable
> back the ASPM.
> 
> Update ICC & OPP votes based on the requested speed so that RPMh votes
> get updated based on the speed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 02643579707f45fc7279023feb7dbc903e69822d..c4aa193bbdcc928603ae50e8d7029b152d62f977 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -276,10 +276,16 @@ struct qcom_pcie {
>  	struct dentry *debugfs;
>  	bool suspended;
>  	bool use_pm_opp;
> +	int aspm_state; /* Store ASPM state used in pre & post link speed change */
>  };
>  
>  #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
>  
> +static void qcom_pcie_post_link_speed_change(struct pci_host_bridge *bridge,
> +					     struct pci_dev *pdev, int current_speed);
> +static int qcom_pcie_pre_link_speed_change(struct pci_host_bridge *bridge,
> +					   struct pci_dev *pdev, int current_speed);
> +
>  static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>  {
>  	gpiod_set_value_cansleep(pcie->reset, 1);
> @@ -1263,6 +1269,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  			goto err_assert_reset;
>  	}
>  
> +	pp->bridge->pre_link_speed_change = qcom_pcie_pre_link_speed_change;
> +	pp->bridge->post_link_speed_change = qcom_pcie_post_link_speed_change;
>  	return 0;
>  
>  err_assert_reset:
> @@ -1328,6 +1336,61 @@ static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
>  	return ret;
>  }
>  
> +static int qcom_pcie_scale_bw(struct dw_pcie_rp *pp, int speed)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	u32 offset, status, width;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
> +
> +	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
> +
> +	return qcom_pcie_set_icc_opp(pcie, speed, width);
> +}
> +
> +static void qcom_pcie_post_link_speed_change(struct pci_host_bridge *bridge,
> +					     struct pci_dev *pdev, int current_speed)

pdev is the 'port' isn't it?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

