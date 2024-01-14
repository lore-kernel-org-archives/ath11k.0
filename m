Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A763C4707B
	for <ath11k@archiver.kernel.org>; Sun, 14 Jan 2024 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3OxrwZkSZ9o4JFB/NbcUhILJqAlcRTT4aveTTQC094=; b=HwKrg0M4XiG1E5DrcWKEUBGZ5a
	9EF9qMu0N/rZzIMz0ofdjk8AJooOaaSYOHlxlkBIr9j7QosRrU9ProC8t1YQL/S8rDPlVah6k4JmV
	K1RBNgQeKEDNcddD4GwoUdUjvRLMX65ruS5DUK4BjksPSX8eoSdtqUx/v5ShDMdbWT1WoBkrUNGAz
	ZXcp0flKKBhSRBuDNT5S8YWA2m6WuJsPdJ1s1NrUCuJHMhDSVLU4/CmgCYVdDQfCb1mjyTWyrm6kh
	dkNN3hTSxzZS6mRfAYxPH3j4yX7YYX/jpPK/V6X1OP0BI5Kjo/Pz8EDQj5JxK5pbiXhdWL55EJMxI
	S2GBx5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP2FA-006tDZ-07;
	Sun, 14 Jan 2024 15:17:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP2F7-006tCs-02
	for ath11k@lists.infradead.org;
	Sun, 14 Jan 2024 15:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5241EB80A7C;
	Sun, 14 Jan 2024 15:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4871C433C7;
	Sun, 14 Jan 2024 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705245462;
	bh=jollSml2+OM4Sa0F+IOmTJVXk53FpYSt8/GqaTL4RT0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jfudFVxBK71G0oW06zEROGpzorXRfUYL12QXEEG4r3NWje6A6JYor4oR7Mj5YhuOx
	 BmZvb5epwfyNICraTP/4Fdmxtw5gyMOdbie4ehD50UPQXfZpwsIyOASzqDM482qMgo
	 3x4a/zMwxSGHmKlJggrPo0lw5l3IaE80WNw64Rujj6oJQAaEpqw9G4HxIxlrF0GRop
	 /FUM5IXWoKICk8QBy+8xOjbOZxSG3BT70cllLbHBGefA/Gi2qloa6bKji1mrKRqswu
	 ZEjhO0QzBtaHjVHUa8YOW+mwDDmq3Y2eI1iNcd3AQhvTeNsNsXknMf3ExQPUvIr+jO
	 dVLGn00aVkIiQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM
References: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
Date: Sun, 14 Jan 2024 17:17:39 +0200
In-Reply-To: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
	(Jeff Johnson's message of "Thu, 11 Jan 2024 11:24:23 -0800")
Message-ID: <874jfg7xm4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_071745_217109_226D07E2 
X-CRM114-Status: UNSURE (   7.03  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> Commit 7636c9a6e7d7 ("wifi: ath11k: Add multi TX ring support for WCN6750")
> added HAL_RX_BUF_RBM_SW4_BM to enum hal_rx_buf_return_buf_manager. However,
> as flagged by the kernel-doc script, the documentation was not updated:
>
> drivers/net/wireless/ath/ath11k/hal.h:689: warning: Enum value 'HAL_RX_BUF_RBM_SW4_BM' not described in enum 'hal_rx_buf_return_buf_manager'
>
> So update the documentation. No functional changes, compile tested only.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

I'm not really a fan of kernel-doc in wireless drivers, it feels more
unnecessary work. Should we remove the kernel-doc markings from ath11k
altogether?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

