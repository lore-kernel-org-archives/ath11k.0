Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F947C369D3
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utSRlvWwaJPUba2da6V5YeBrAL7QiUQpMkQtkrVxrps=; b=sdNpkydIytP1MOfSDGjcPtKIZF
	j27thIJUeMRk4uT0lHAcw9vGR9OW/Phk+iBt/FmfF5ffZcsj+p2OgD8KOZ5uSTp23amhBoQVGzc3l
	+TkB07tnVwpl4zY1THOpJ2OtWXW27rJQX0VacwOR2rbXblgQaVMn07yGNSDXfIdRUcrDZ9CVnqQ2v
	6h31M7roxaRv9vlhqAHkshtkGfvKHzfE6eCFoUnabiynQuTB3RK4azHo7+rf3tcW2pm1/5qZctnXw
	Rn/3ra30ZVKwwRVDpAilWUPPXYeEeU8GS895gwzWXE0ETYSvGOibRQzgELFt0k9tQl5rwXLh7ykSW
	C9eLWHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MWA-00000000KnQ-0d1b;
	Fri, 25 Apr 2025 17:07:14 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LQq-000000007xc-2swX
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 15:57:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736b98acaadso2448191b3a.1
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745596659; x=1746201459; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utSRlvWwaJPUba2da6V5YeBrAL7QiUQpMkQtkrVxrps=;
        b=V+2QSvmjQpTcMVBVszxlBZeUW761GNW3+sk4kVAXx4WoY4xNRDCuucw4efW1dergNi
         9nDIs2l0dOS2x70NtArup+/zjKL1HXqz/OP63isouJWsUYjX2Wcn2ZaKrun+7dESrtO2
         1x9a+3fmc0CNOSITRszja2baUzNaQADzmYt0dRmQw9Z5w0R8wLWzut1NKHjtXg2H4qr4
         pVtRMfTaXyOIgz+hmo/tOczx2qTCxgD9UTXHvItujiSj1s3dlXbi3Hl0Cgt+0aAlPG34
         /oU6Bw2xv7UhsllGsq9rFZt1UFOVP6wlJUEkzoOrSJ9BAqPeKEsC+4BNvdI5ZAuIF3nQ
         r6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596659; x=1746201459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utSRlvWwaJPUba2da6V5YeBrAL7QiUQpMkQtkrVxrps=;
        b=Y2XKMKhqzwQGXq1pRCvXjCjs3tCX5evW41TUQ5cC533/1O1zRT1daoZ0YelUyVXS0m
         LVkrSZlqYoClSjMhFJ20cU9siAVs7wHgb9pevK8qbI39tDilLIxYxEEjoENdMkto+wts
         f9Ek4WOZAdz448xWHFB5cEo37TQopDTZttk4UsiarUaI706zmXaSCnVc6g2kF6WW2vt4
         zVewClG5UAyV6M3J7+Tb9qkqOY/+uIlp2QimhUze/e1e+pxFuZYACwiC4imxeKms7Lr5
         eVk9hChCVWCQDzvayUYVdi3xi1tv5UuVPrHyie5AmuHzRbdak/+QIXB/pJvd6WGCXQzU
         zkRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9raldkyhzP573GFhsNNV/engfH1NI+Rt7MiS3VezFvbmWNWCp8iEB4GtdK6JGmvJk7RnEPQU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbJI0bCLXBxet6aYrMPmUI9+3g0+azWtx6JzW8uEsiCfXdTX5T
	6/YI65AxX7Nye23/QW2LDn+9CUNLk2dHsfEOera8tGiWSqp3BnvEBcWzxICUvw==
X-Gm-Gg: ASbGnctoPWKezxrJkgBtcceXltHc5hU+5eJLxDhE+0jOjKkK8Jtj9CiygdVjYNpjyuB
	Pd1xgmqkQLWK6srgIBXKEViayZ3iJqnbKvgDX7M5SU+reDpTinsx1Ckj4z0w7/2UekfV0CLNE3j
	CYLn+HUp/VkVO43iGBZ1y0pHRU5NnCsZRl2fIF8KSOhJw3kmbdbw+fj8kCCUArUY14Q0/3DWxmY
	vq25yk12hjduFrk4TxiUBN9uRk26CputZlR/GOyq7cskrp6ak9vhZxFAWFPKzCUckxQSiRNhfSC
	1TCV7JnD8tS4udHMF8nnP2Kb72C9U1d54G0LOCJfoObhDajjMJ1G
X-Google-Smtp-Source: AGHT+IEv9WTyD1hNXstYJB7wgOh80HyepKndFk0b9Nsc+PbCz+wAO+jxkDebi/3q0xjNfV/24gj4Tg==
X-Received: by 2002:a05:6a00:b93:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73fd8b6be23mr3721308b3a.16.1745596659476;
        Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912c94sm3344436b3a.3.2025.04.25.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:27:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <7njsbucxngxc2eninh57oexywiqsyysrbesyige5zwr4pmxf7t@rw6657lheg4j>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_085740_733494_FC658481 
X-CRM114-Status: GOOD (  27.37  )
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

On Thu, Mar 13, 2025 at 05:10:09PM +0530, Krishna Chaitanya Chundru wrote:
> If the driver wants to move to higher data rate/speed than the current data
> rate then the controller driver may need to change certain votes so that
> link may come up at requested data rate/speed like QCOM PCIe controllers
> need to change their RPMh (Resource Power Manager-hardened) state. Once
> link retraining is done controller drivers needs to adjust their votes
> based on the final data rate.
> 
> Some controllers also may need to update their bandwidth voting like
> ICC bw votings etc.
> 
> So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
> the link re-train. There is no explicit locking mechanisms as these are
> called by a single client endpoint driver.
> 
> In case of PCIe switch, if there is a request to change target speed for a
> downstream port then no need to call these function ops as these are
> outside the scope of the controller drivers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>  include/linux/pci.h       | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 0a5e7efbce2c..b1d660359553 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  			  bool use_lt)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
> +	bool is_rootport = pci_is_root_bus(port->bus);

s/rootport/rootbus

>  	struct pci_bus *bus = port->subordinate;
>  	u16 target_speed;
>  	int ret;
> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  
>  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>  
> +	/*
> +	 * The controller driver may need to be scaled for targeted speed

s/controller/host bridge

> +	 * otherwise link might not come up at requested speed.
> +	 */
> +	if (is_rootport && host->ops->pre_scale_bus_bw) {
> +		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>  		struct pcie_bwctrl_data *data = port->link_bwctrl;
>  
> @@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  	    !list_empty(&bus->devices))
>  		ret = -EAGAIN;
>  
> +	if (is_rootport && host->ops->post_scale_bus_bw)
> +		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 47b31ad724fa..9ae199c1e698 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -804,6 +804,19 @@ struct pci_ops {
>  	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>  	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>  	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
> +	/*
> +	 * Callback to the drivers to update ICC bw votes, clock frequencies etc for

s/drivers/host bridge drivers/

> +	 * the link re-train to come up in targeted speed. These are called by a single
> +	 * client endpoint driver, so there is no need for explicit locking mechanisms.

You need to mention that these ops are meant to be called by devices attached
to the root port.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

