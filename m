Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CECC433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FU3FgWlQw4zjYWxmDrmEYVLK/3DqH7U9/cHegoQOu50=; b=c3ip2fMSI2sKOd
	EE0n7bdqwepjw4FEJm/a9Tgfh6B0jECOxkWQNbnBwPJvwEzR6W5szNzgia3osIqE3o2UTo43bQeiH
	I2sq0zCw4ka0V0GCq8rnMw3iLIiwUnWjhF2qU6mM4WcLE3QH1ll7V46wvFzu67uas0Ay/TJBDWptM
	SPyPiElpqu6iGVDG9xiwrIa7bwHwdXcobkmbwjeS/qjcBS+MKQh1zXH/fEAPu5TH6IXzfQvAk8AAL
	Tz9ZZIqO2pfrebjitACryhn1gdsXX7YIzK9g/A9IrbRHU7+k4TcgYKZYVKIcF1bHbLmQLCEPtS4vb
	65Jnj5Ftbd5hLbuUAPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njaUl-00HVWH-73; Wed, 27 Apr 2022 05:45:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njaUi-00HVVG-Fa
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:45:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DAF36174D;
 Wed, 27 Apr 2022 05:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50458C385A9;
 Wed, 27 Apr 2022 05:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651038338;
 bh=e1m0E8uT5v6eqahgVUqKh9HLOGZHesUqi3Ar0K2hoH0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=rVjDuuPGzoW92hlmlfE2E7MHRgiiaoo/UCvIqkiESlqCwI4xj1j9t82VQeo9K4hES
 hKWHds3VOR9b5M027TFi1s5vXb2to+7Oq9vyrDrNO8DdqT8ossuw2g6lKjsCirpx6P
 zSqUPqzCq6UpIr4wXl5NN+O20QzdymXeTqRthUjSejlcXIy8UxIYcfbn7Kr2nK5tM/
 Uef4jILAB5wPmeqf7OyWq1wPpwBx5CsIuS3ZZ/CasPit9UaVUjfLQ8d54ePGyaaQVi
 vVl3h0gkVVzDvC1UBfGQQVqqrHurXoucTM1ezbfRhhGsPDN9vusRNl1NFZ2HAKPx7y
 kYsfz4hxG5sAA==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v4 04/12] ath11k: Add register access logic for WCN6750
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-5-quic_mpubbise@quicinc.com>
Date: Wed, 27 Apr 2022 08:45:33 +0300
In-Reply-To: <20220406094107.17878-5-quic_mpubbise@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 6 Apr 2022 15:10:58 +0530")
Message-ID: <87czh3gjuq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_224544_633352_B65DEF89 
X-CRM114-Status: GOOD (  20.88  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> WCN6750 uses static window mapping to access the HW registers.
> Unlike QCN9074 which uses 2nd window for CE and 3rd window
> for UMAC register accesses, WCN6750 uses 1st window for UMAC
> and 2nd window for CE registers.
>
> Code is refactored so that WCN6750 can use the existing
> ath11k_pci_read/write() APIs for accessing the registers.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c  |  3 ++
>  drivers/net/wireless/ath/ath11k/core.h |  2 +
>  drivers/net/wireless/ath/ath11k/pci.c  |  4 ++
>  drivers/net/wireless/ath/ath11k/pcic.c | 53 +++++++++-----------------
>  4 files changed, 28 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index d73643e3e8dd..d27fc7276977 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -42,6 +42,9 @@ const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
>  	.fixed_bdf_addr = false,
>  	.fixed_mem_region = false,
>  	.hybrid_bus_type = true,
> +	.static_window_map = true,
> +	.dp_window_idx = 1,
> +	.ce_window_idx = 2,
>  };

Even if the values are zero, please initialise the new fields in every
bus_params structure:

ahb.c:31:static const struct ath11k_bus_params ath11k_ahb_bus_params = {
pci.c:118:static const struct ath11k_bus_params ath11k_pci_bus_params = {

> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -771,6 +771,10 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  		ab->bus_params.static_window_map = true;
>  		ab->pci.ops = &ath11k_pci_ops_qcn9074;
>  		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
> +
> +		/* For QCN9074, CE: 2nd window, UMAC: 3rd window */
> +		ab->bus_params.ce_window_idx = 2;
> +		ab->bus_params.dp_window_idx = 3;

Bus params are supposed to be const so that you cannot change them. If
there are device specific attributes they should be in hw_params.

I see now that both hw_params and bus_params are not const in struct
ath11k_base and that's why you were able to change them:

	struct ath11k_hw_params hw_params;
	struct ath11k_bus_params bus_params;

I'll send a separate patch to fix that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
