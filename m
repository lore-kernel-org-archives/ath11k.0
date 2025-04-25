Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF371C369C2
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma+iGpUn/AKMVwLZapT0W95tZe34aNE+r6szCxKHl2g=; b=ex8YptPpS7II0FzRN8P9gL0NwV
	6uaY+FtFTbogjbnyYOuf6yKCw1eha6BcIFQYcSPq7qOSARFgk0Pqgr4XgMQvYwMB4Ed+CmaNtPFR4
	coRXk0rG3jjjiXredfQf8kfNw9HtrKZBOrNLh9qwEdeCEITj8jEnmPbfO8bHwRqy1WcRvWSoYIhwN
	YeYXQv2MBbB6zWLzbeHAk/UukV5UwROGc4x1eP+R36dr+EAduAwCcHKiRd3HYjs4IYeN53ycaLWHZ
	iKnMsEsjmvt78jR5//fJCtpRRlMW5dte8Dyk6SBiPKWRf1j6vAGu5R0C0aoOe4JQ7qTDfc7ZTWSin
	x/ihLAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MWB-00000000Kol-3g3D;
	Fri, 25 Apr 2025 17:07:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LaQ-000000009Sl-0ZTi
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 16:07:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224191d92e4so28208815ad.3
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745597253; x=1746202053; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ma+iGpUn/AKMVwLZapT0W95tZe34aNE+r6szCxKHl2g=;
        b=fuVvYu9DoUnUAN8FOKG9WweRZkM7QU88wlHBJN3H5Yq5umviz/lHg44JLJE/CmEDD/
         y3fw9ADwdP6dmF7SyxIwNkLKqR0rHUiZuYLu8b+BS3NU5l2A8+k20jSeLFH2+oxiv6sv
         7xdZF5x21MHBf7BIuSyrHOgouNRUT1yoekHKlThfPupHJGLZoXNrE/73UZfoOUnEulQF
         O8WCkR/sfoi6jliwhJN2INjL4X7JPK6RKFhYe1YlOTrpSmyTvP5tV+a6gtR6KwEWIiPz
         0Qa3qH3SA/GM7TAjK5ci0ScsUByzsCLqW28QLa24i4JnzOxOrdpwZRei/oKkhXjFJCZG
         qnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597253; x=1746202053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ma+iGpUn/AKMVwLZapT0W95tZe34aNE+r6szCxKHl2g=;
        b=I7ws4zcl0sMOMtpKGYCw1lS1/PdLY5pfleZYByWTnVzv/EzedzUpDNdadPDbFiR9JE
         gjO6IWSFL3lsQ3R9WUiImfzJe4u6jMRQv2M82b84OZnlfMHBFWGdvnMXPSpzwz+IG28q
         SFaTmyxuSjfhyZW+EWOsEypFJ6U7wY5zVvmEO/9dzqtYiLeaX7lzvBJ4G9aAoTRBiVsM
         8jwoHbLH3uqZgrUuQ+LeBO4HEcS0/7q+iygPLmUHtZjPEuyyXcGI9jssMLgZRWvpJZCQ
         wFHY9wnGJg4DuYeZjvvNvJNaHin0JiuVsddOeCOTVzGUObruwHIDNkAFkRlntwF64UDV
         gK4g==
X-Forwarded-Encrypted: i=1; AJvYcCVjTKosO2HUSx7kl62VVVOGISZXZUBkcUYdp6XMdKbXBi6Aw2IiAlelpE/PYYF24+NYaIRSt5Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh7Cx11K/wwmfUCt651KK1FrGxMR+nqoBsbLFoPZtJVLaMue4S
	wV58HQAUhRfjaPsfNrifyXVhH56mNTgfkpZU3KwRktOMO1SGkd7p4yNqwNIFPA==
X-Gm-Gg: ASbGncuADQBPs5hIVBKTR1Xv1eL6xlzpb/oV8To5NbmJrnqPexkvg7KUhl8r3yNVH57
	QaF3IjrJCIBLhyAvEgjLZQxuM4u4ieaDPcwwt8IjhtOg0mAsJT5s0rh+4sISuGr9IcNaivuQVBY
	rYAIFkZSJNvPm2mFbVEhw6FsTSMWKzVafhKSwxOUhMYyW8w0k4JGnQDv5NmR6Dp2QU6Y3qq3EuP
	9sVi6v6GBv+AhQuvPErfbD343SpYzmWaPfaQH5n7CjeP/aCuPg7AUNspONVgpKsPKOp0J9ceWKk
	9Xif+/2lzTQpDUwUiJHX1J6Wz3roxzuq1qaFdk3F/KNhBmpL9YIJ
X-Google-Smtp-Source: AGHT+IGHuaRxdPoXNwRTHc78Guuv44yqP3/H83BEy2uFRv1C3A22TKg1MCU7FGgOqFZzBgCQSRzorg==
X-Received: by 2002:a17:902:d2ce:b0:229:1717:882a with SMTP id d9443c01a7336-22dc69efaeemr2288965ad.4.1745597253205;
        Fri, 25 Apr 2025 09:07:33 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faee2091sm3098381a12.75.2025.04.25.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:07:32 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:37:25 +0530
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
Subject: Re: [PATCH v2 05/10] PCI: qcom: Add support for PCIe bus bw scaling
Message-ID: <ammo5uyd65xyr2gexp6kgkyout2hezrlqqb7l77dix52wbtehl@ezw2ntaabjug>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-5-869ca32170bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-5-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_090734_182506_E046EB98 
X-CRM114-Status: GOOD (  18.87  )
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

On Thu, Mar 13, 2025 at 05:10:12PM +0530, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controllers need to disable ASPM before initiating link
> re-train. So as part of pre_bw_scale() disable ASPM and as part of
> post_scale_bus_bw() enable ASPM back.
> 
> Update ICC & OPP votes based on the requested speed so that RPMh votes
> get updated based on the speed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 49 ++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index b66c413f1e2b..a68e62422ff7 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1328,10 +1328,59 @@ static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
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
> +static int qcom_pcie_enable_disable_aspm(struct pci_dev *pdev, void *userdata)

qcom_pcie_enable_aspm() since the opaque argument is serving as a boolean.

> +{
> +	bool *enable = userdata;
> +
> +	/*
> +	 * QCOM controllers doesn't support link re-train with ASPM enabled.
> +	 * Disable ASPM as part of pre_bus_bw() and enable them back as
> +	 * part of post_bus_bw().
> +	 */
> +	if (*enable)
> +		pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
> +	else
> +		pci_disable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
> +
> +	return 0;
> +}
> +
> +static void qcom_pcie_host_post_scale_bus_bw(struct dw_pcie_rp *pp, int current_speed)
> +{
> +	bool enable = true;
> +
> +	pci_walk_bus(pp->bridge->bus, qcom_pcie_enable_disable_aspm, &enable);

We do not enable ASPM on all platforms. So this is going to affect all platforms
whose client drivers initiate link retrain.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

