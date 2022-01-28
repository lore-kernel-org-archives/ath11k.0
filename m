Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF94C433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYqZG/s9059O6VxRgLSP13Un1laPi/kwj16Va/SYlcc=; b=RcaSOPZ+cQIWkz
	FRplgpLU3eLzAG0EvZcGgFSdIOOeY0wVQu64O8rWayHEY0LKY6AMBIsTtk9euVzMR0ZhdAMcQITFi
	O6WWSkzLEbf8scjyY8MK+jovY8QD3GQZgN3WIcG6WWtSTYRgz1IQwzVuCUg0K1ESy6+3EvnoMK6gK
	7VijPECk0JIjEZ6GBdtRRqBntQ2F6PyTdtpUsDbPtWTdKiai4J4TVf8c+jGTEkIw7xM1IIY3l+LKE
	3JKBwX2ilvhmzZmgVbAbkG4iEV9aCUonkai2i15mSKGn85GM8gAhwTWIvago37aFs/mMM9EKrQPRz
	k8F6qPoRz64CCBbjwl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDORd-001T6F-H8; Fri, 28 Jan 2022 10:25:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOMw-001RSq-TV
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 10:20:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8615DB82513;
 Fri, 28 Jan 2022 10:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301A6C340E0;
 Fri, 28 Jan 2022 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643365236;
 bh=+NvwaWbFVh8DxNHiYmA/3O9hguNLHMqOSOQUJp5/o8g=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=gavaV0kAHwO2h+hBKiEEnHCvZZcqj+W6+gTMiPEd9pEAX6aBbhITzHt5VZYo//DIA
 5zcIu79tLcucFkRYle07Ac/l+KyaIfzG3e2OVrS5aXOLdL67RIqFxMJaHZE+gde5Vq
 pgsI973dyiUE7XWsWi06Cg2aQhM1JNJC0baaGKIoxMzyBHR6k1FqSEHVzdPrVvsBgs
 UFF9tST6S4ZZRlwWFkk4dCzAYdD6JWK3zTgZbnif7TeOMDIumnUCCsyALh+mng5U02
 wrAhATB+IfIcg/RnHtFHKkPCqTsuJ1OumnX56k8a/K2zOsFYGDtT0CbYt1WnNGl2bS
 sxCizoTFw26uA==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 05/19] ath11k: Remove core PCI references from PCI
 common code
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-6-git-send-email-quic_mpubbise@quicinc.com>
Date: Fri, 28 Jan 2022 12:20:30 +0200
In-Reply-To: <1642337235-8618-6-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:17:01 +0530")
Message-ID: <87a6fggo0h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_022039_131763_CE9D377D 
X-CRM114-Status: GOOD (  14.59  )
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

> Remove core PCI and ath11k PCI references(struct ath11k_pci)
> from PCI common code. Since, PCI common code will be used
> by hybrid bus devices, this code should be independent
> from ATH11K PCI references and Linux core PCI references
> like struct pci_dev.
>
> Since this change introduces function callbacks for bus wakeup
> and bus release operations, wakeup_mhi HW param is no longer
> needed and hence it is removed completely. Alternatively, bus
> wakeup/release ops for QCA9074 are initialized to NULL as
> QCA9704 does not need bus wakeup/release for register accesses.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[...]

> @@ -651,6 +653,13 @@ struct ath11k_bus_params {
>  	bool fixed_bdf_addr;
>  	bool fixed_mem_region;
>  	bool static_window_map;
> +	struct {
> +		void (*wakeup)(struct ath11k_base *ab);
> +		void (*release)(struct ath11k_base *ab);
> +		int (*get_msi_irq)(struct ath11k_base *ab, unsigned int vector);
> +		void (*window_write32)(struct ath11k_base *ab, u32 offset, u32 value);
> +		u32 (*window_read32)(struct ath11k_base *ab, u32 offset);
> +	} ops;
>  };

Please don't use bus_params for this, I'm starting to suspect that we
actually need to remove struct ath11k_bus_params altogether. It would be
cleaner to have separate 'struct ath11k_pci_ops' or something like that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
