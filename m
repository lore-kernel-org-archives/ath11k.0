Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACFCC369C2
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Od8v9uuxXAfd7uGKx+1reVesYOTCW7WP8EaaxY94+tg=; b=xGQ0wfekc24DzN4X7FVTsOK9mD
	g51Ug04lv+7tCKmmvpHA5PG+YROuN7uXClkY+BpnQ9uRu1vrr7rZ8+y66B00gFNCvA2HXU/bbP/MH
	MB8EeusK78vaBKJELUlMjt9gR58id8fn6OddBSV5BDk7zOp0w8doJWj4RbY6pymmJNYxESQF7Am6L
	FD2RalYSvC7/otq3NiTaqT3gQCLcTl16r734jiDzOFfu0SukI+v83cJnrHh4sPiRgB4iDRBaJSdzP
	hDAY4V1+qQ6jhEf359Nv4dlxhM9Yu8m1E0ErdtLU0NV2gDxT2gRvZM2oVP1gScpjHnhhH23ue+YJT
	nlovwO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MWA-00000000Knd-2G9x;
	Fri, 25 Apr 2025 17:07:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LVI-000000008bD-0M0n
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 16:02:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-30384072398so2263602a91.0
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745596935; x=1746201735; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Od8v9uuxXAfd7uGKx+1reVesYOTCW7WP8EaaxY94+tg=;
        b=jzhAwlNjzSUT7P8MTS9784z7zIxZiYqKI2ia/YiZgg61FXps1kNxS853tv+q9HUHff
         ivVYcxwMY6IyZWCa7kyFAIGUJktWY6pZoUZvpp4wTSGNBp5hK0Zwdj3jg560AWQONbSU
         92phCrCe8sTitI/UT1T0ASvCfxbkGLLIM6DSqxBPBwtNs65/HK5xQ+tC/T7tgAxCRx/s
         rfvvhR6lcOB3jvUNj4NbeL2rhE4/RRI8y3P4ot3pqaS+f1pI9HfFPyH12miOG00H9JdU
         n+3fyXswSYy7WO2++//F37CH7nEaqFqo4wNYAQVqBjwsOrHOhcUX4q+/JKiPDD2yeQAS
         VCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596935; x=1746201735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Od8v9uuxXAfd7uGKx+1reVesYOTCW7WP8EaaxY94+tg=;
        b=eCftkLL4hMo+pHVmxcCAWnZGYNykQs5Re01rpS/EtEB46AbKT7vaU2W6zAy5MQEQ5t
         F0wqX7xfPyHHI/ZwmlDZsAZvlGA3EDiRt4g/C17n2y6WUjD5RZ1M7RbymY2cCdJgb/+T
         rMGJslsjkZAucpi+ZCUxcGy9KMQzA2h8NTBFyo/x+oxW9zZvTuk5H43ZwNKS1LWmCKQi
         MQVoY9mZnf6quoX5qzASxLTLc0w2rYPdsG2PParEI2X8gR0EoB7PEDXop/jntcHPuzk6
         nkLWSLMN4R28IlThxIvp1oflkFhBu9yYmO9lzm/zSubShcOLsNj8fj0okA0+PrpO+R9K
         aDTA==
X-Forwarded-Encrypted: i=1; AJvYcCXa/ZYZGo353in2LjjN/iCGKg16jQO20MSf5tHVCsvYrEH7mdoZ2T9vyFFC6WpOGO/NbTEfBtE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/2/ovG89Tbzr/xXW6pP3tPepvcZI52bU71BzKMQjIATeWpkGf
	J4pxMHY8Y9GBfvJfb1IBYtpR1pqxUNbfhjlZ0dyKRzx1jIW3QT37fDMe8GmU7w==
X-Gm-Gg: ASbGnctqpXY1f23S3gNFUhkc4+TfWhZ5T5ytYS+pmHEAtZV0d14G6SdOnEUa62lMIrv
	DIUuuCR2MbScdDPOHKHZ56x8FwxSzd1TK0fx4J1COKn7h5l1dTC80+S+/3Bgcxx6iwfu5jOK+zq
	Af1qaTiQcoy/b8AILQJbsdXiK6BcVyn8Wq5Z4SbJxZFedWggmlaeav3SSkdwULmf94lAckvLcYA
	daXT7DFrM/L4QRWEu82qeTK6innUNFQRMAUazXGFpII1tr2NV4iR3nSer6U12RYsux+R0h011RB
	IsuDEXBWy6hp3lDBd1L4hq2mccWkcXKtwIo9t944ow9fq7yJ5xhw
X-Google-Smtp-Source: AGHT+IHdQ4Ba18bl0q2QrVTsaExU1b+SHdhITO9CRQcmytTANa1AqTjF3k17LH9+AYX+x/7+IPAHdg==
X-Received: by 2002:a17:90b:264b:b0:2ff:58e1:2bc9 with SMTP id 98e67ed59e1d1-309f7e679aamr4543956a91.25.1745596934960;
        Fri, 25 Apr 2025 09:02:14 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f784ac3fsm1806254a91.45.2025.04.25.09.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:02:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:32:04 +0530
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
Subject: Re: [PATCH v2 03/10] PCI: dwc: Implement .pre_scale_bus_bw() &
 .post_scale_bus_bw hook
Message-ID: <6zuyux2emotjxouvo36ijojz4xel7x7aozyem55pmd3xvpbgjs@6abrkkzj3bib>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-3-869ca32170bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-3-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_090216_134437_7D4DCC79 
X-CRM114-Status: GOOD (  16.06  )
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

On Thu, Mar 13, 2025 at 05:10:10PM +0530, Krishna Chaitanya Chundru wrote:
> Add support for pre_scale_bus_bw() & post_scale_bus_bw() function op's.
> Add support for DWC glue drivers to register for these ops.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 21 +++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index ffaded8f2df7..4da4df62c3f8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -697,10 +697,31 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
>  
> +static int dw_pcie_pre_scale_bus_bw(struct pci_bus *bus, int target_speed)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	int ret = 0;
> +
> +	if (pp->ops->pre_scale_bus_bw)
> +		ret = pp->ops->pre_scale_bus_bw(pp, target_speed);
> +
> +	return ret;
> +}
> +
> +static void dw_pcie_post_scale_bus_bw(struct pci_bus *bus, int current_speed)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +
> +	if (pp->ops->pre_scale_bus_bw)
> +		pp->ops->post_scale_bus_bw(pp, current_speed);
> +}
> +
>  static struct pci_ops dw_pcie_ops = {
>  	.map_bus = dw_pcie_own_conf_map_bus,
>  	.read = pci_generic_config_read,
>  	.write = pci_generic_config_write,
> +	.pre_scale_bus_bw = dw_pcie_pre_scale_bus_bw,
> +	.post_scale_bus_bw = dw_pcie_post_scale_bus_bw,

Please do not add these multi level ops without necessity. Just populate the
callbacks in qcom_pcie_host_init(). DWC has nothing to do with these callbacks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

