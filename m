Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4113FC433F5
	for <ath11k@archiver.kernel.org>; Sun, 21 Nov 2021 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjQdwi4kDtK3gnEtPSnXTsgWcfkth+tcaNZbRYvsyF0=; b=Ii19162Ql6FK0P
	ux3HaQoNGULcoNg6522IMvGzagBnyKf5SXGym+u9UkE3TCvJcQkoFIdK9xbPXBlo3kuZ711IngyAM
	HuphdkNNCGRUVHOmC/eouptF4nVkf4iREEYQcw8tAewfAtdj/Xf/z8axAjSeIApLiS0wnZaWV3r+c
	cOUzu252Kz4CkdlsKdsDauceFVPZKS+aekvE6IDrbSJZzXRj2YgHFBhJ9maiCsgUAr78U/6xmreCD
	q2TtUKEW12gy33u24mJrE7t+gEXu7C58HhmTYZN0tXgBT4u5NGuMZLYlZlGXaKtQUtZVlZsByGArP
	n7dsJX4PyLo1l6X3zKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moo68-00Do66-La; Sun, 21 Nov 2021 14:45:40 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moo64-00Do5C-P6
 for ath11k@lists.infradead.org; Sun, 21 Nov 2021 14:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637505932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4ovVeGWykiyQqLdOt+pg9u4rBbCXU8KwSKQ8XinB3A=;
 b=vsUBEawYM4Gp8jWqxtG3NKpkZcXp94og/56/aGYt+t9cNleA3gadxoAoqywr3kzp/TYUUl
 JL2MuoAWC/AhwSCmXjAX4qyzSLWdOOcoFoT4bLbgpSdc7nOEc7I/vqOMqQeBD5Zv22sJ1l
 Gq5piBcC56JZ88615JgZzp06qIUppYc=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH v4 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
Date: Sun, 21 Nov 2021 15:45:29 +0100
Message-ID: <1724585.GBsqGgcNsD@sven-l14>
In-Reply-To: <1637504521-30997-2-git-send-email-akolli@codeaurora.org>
References: <1637504521-30997-1-git-send-email-akolli@codeaurora.org>
 <1637504521-30997-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_064537_165734_AE470833 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Sunday, 21 November 2021 15:22:01 CET Anilkumar Kolli wrote:
[...]
> +static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
> +{
> +	struct device_node *np;
> +	dma_addr_t start;
> +	u32 reg[4];
> +	int ret;
> +
> +	np = of_find_node_by_type(NULL, "memory");
> +	if (!np)
> +		return -ENOENT;
> +
> +	ret = of_property_read_u32_array(np, "reg", reg, 4);
> +	if (ret)
> +		return ret;
> +
> +	start = reg[0] + reg[1];
> +	mhi_ctrl->iova_start = start + 0x1000000;
> +	mhi_ctrl->iova_stop = start + reg[2] + reg[3];
> +
> +	return 0;
> +}
> +
[...]
> +			ret = of_property_read_u32(dev->of_node, "memory-region",
> +						   &hremote_phandle);
> +			if (ret) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get hremote phandle\n");
> +				return ret;
> +			}
> +
> +			hremote_node = of_find_node_by_phandle(hremote_phandle);
> +			if (!hremote_node) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get hremote_node\n");
> +				return ret;
> +			}
> +
> +			ret = of_property_read_u32_array(hremote_node, "reg", reg, 4);
> +			if (ret) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get reg from hremote\n");
> +				return ret;
> +			}
> +
> +			start = reg[0] + reg[1];
> +			size = reg[2] + reg[3];

See my messages for v2 [1] and v3 [2]

Kind regards,
	Sven

[1] https://patchwork.kernel.org/project/linux-wireless/patch/1637082058-6398-2-git-send-email-akolli@codeaurora.org/#24605391
[2] https://patchwork.kernel.org/project/linux-wireless/patch/1637244892-27267-2-git-send-email-akolli@codeaurora.org/#24605417



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
