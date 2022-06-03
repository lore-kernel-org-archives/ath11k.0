Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091FAC43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiiE28cEWoT4tKBmR6t7lYbY+csriSzCphY3qri3qgU=; b=YtGg2MH2h/DLhW
	KnkMaVjzrojxgRADoBY5128cp/jX/ClTBm1LVPNV6A25tqxL0W9FEq1cvaz6IHxo+yBPbjv2GyyMZ
	yePaSnpnhiosq05esVSNKSFLNTRzLlmI0RwU7pNMgX6RkzbBEXDQHoFHJA1ZhNjPFem02AFSzXzLP
	JfzsuR+GBtIz0ObHA1qTZH4yAJfBmu7wMJwr3xnKmuzNmEnUtax+awG/H6jIE4vsmjl+jOPlhshER
	jHEVuSIHzQESArf8yqPddg0soPkE1CMEPhS+q1RkuJsMpOhKVTYPjIuF2Fzp5IKvV9U1F0Apx1cu3
	qrzEgQsly+BlMBLZ3xXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2lI-006foB-7j; Fri, 03 Jun 2022 08:34:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2lF-006fnj-5o
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 08:34:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80D9A6195A;
	Fri,  3 Jun 2022 08:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F362EC385A9;
	Fri,  3 Jun 2022 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654245263;
	bh=vuM1FijWVf3JLmS6pjEO4fnhUWhgktmQ1f4rrxAKU0c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gTPVpvwVuSLqejphnDn8xIzI9BOLHmAvQeEoznfT5ivYgKpy3T/Kp2t3w/naghmND
	 It+W2MZg1quWqdD98EdN4SWeCTAmFDAd0Lr+ixyW6SMtQOiiB0euR8O97gJzAX0jZS
	 2HxfoDnyfOPEp5KUszZnd3AFsvQb7wr5FyuNbJeBlIgN5Y2LWwqKngB7lO6RCAizDG
	 1k4/BlO9CAh9lKHMUibmO7QNBF5/PICdqxuaG11TLeGFB6eRazp/d1UZIe8cl4UvyV
	 gMPymdNtChI7iisNKCD6QxvJ7FcVkUKFGl9CgXBm0gQY+OMTAEnFr7lbr5PrvZ+NBR
	 l3361krjb05rQ==
From: Kalle Valo <kvalo@kernel.org>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: Add support for dynamic vlan
References: <1641786090-10232-1-git-send-email-quic_seevalam@quicinc.com>
Date: Fri, 03 Jun 2022 11:34:17 +0300
In-Reply-To: <1641786090-10232-1-git-send-email-quic_seevalam@quicinc.com>
	(Seevalamuthu Mariappan's message of "Mon, 10 Jan 2022 09:11:30
	+0530")
Message-ID: <874k12no1i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_013425_310610_1A503662 
X-CRM114-Status: GOOD (  18.36  )
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

Seevalamuthu Mariappan <quic_seevalam@quicinc.com> writes:

> Advertise AP-VLAN interface type for vlan support in driver.
> Metadata information in dp_tx is added to notify firmware
> that multicast/broadcast packets are encrypted in software.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01073-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c  |  6 +++
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 74 ++++++++++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath11k/dp_tx.h | 14 +++++++
>  drivers/net/wireless/ath/ath11k/hw.h    |  1 +
>  drivers/net/wireless/ath/ath11k/mac.c   |  5 +++
>  5 files changed, 98 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 293563b..0b2407e 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -86,6 +86,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.num_vdevs = 16 + 1,
>  		.num_peers = 512,
>  		.supports_suspend = false,
> +		.supports_ap_vlan = true,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
>  		.supports_regdb = false,
>  		.fix_l1ss = true,
> @@ -150,6 +151,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.num_vdevs = 16 + 1,
>  		.num_peers = 512,
>  		.supports_suspend = false,
> +		.supports_ap_vlan = true,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
>  		.supports_regdb = false,
>  		.fix_l1ss = true,
> @@ -213,6 +215,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.num_vdevs = 16 + 1,
>  		.num_peers = 512,
>  		.supports_suspend = true,
> +		.supports_ap_vlan = false,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
>  		.supports_regdb = true,
>  		.fix_l1ss = true,
> @@ -276,6 +279,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.num_vdevs = 8,
>  		.num_peers = 128,
>  		.supports_suspend = false,
> +		.supports_ap_vlan = true,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
>  		.supports_regdb = false,
>  		.fix_l1ss = true,
> @@ -339,6 +343,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.num_vdevs = 16 + 1,
>  		.num_peers = 512,
>  		.supports_suspend = true,
> +		.supports_ap_vlan = false,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
>  		.supports_regdb = true,
>  		.fix_l1ss = false,
> @@ -401,6 +406,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.num_vdevs = 16 + 1,
>  		.num_peers = 512,
>  		.supports_suspend = true,
> +		.supports_ap_vlan = false,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
>  		.supports_regdb = true,
>  		.fix_l1ss = false,

As this is an old patch, please make sure all entries in hw_params have
supports_ap_vlan.

> +static int ath11k_dp_metadata_align_skb(struct sk_buff *skb, u8 align_len)
> +{
> +	if (unlikely(skb_cow_head(skb, align_len)))
> +		return -ENOMEM;

The preferred style in ath11k is:

ret = skb_cow_head(skb, align_len);
if (unlikely(ret))
	return ret;

But is the unlikely() really necessary here?

I doubt this applies anymore so please rebase and submit v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
