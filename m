Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17051D6ED02
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9Y+vJ2umFdcaWVq0h/IqxRPB4NzPOMbPEYwlXQct7s=; b=pCJR+CNx4I6JkfqY+DjbpKhgwN
	kPM373vTnVQdHyHmOT00VLx+uY1ga3lVqGRDJwpniBG97O6Dtm9YvuQrB7h2y0NAR3tTCpmH3I/fy
	0pJpAUsdH6jg0Wd+uG5IGyiAlyz0ZQVcOIlv/3Au02X6VNNdVMR3O/d4PDHQXGdzpzR8SEr/rlpFE
	BLYvK14SP/0SIVc7vlgDcyraVYXJOMXxItXeUj0nv5HjXKXoNlh1rW8WMxAh+34q3Kj9MNKlN7rqU
	Q4s/i4oIahPDDUoa7FVnc4UfkAQuqgt8+m58A/a/r8rkF8BBfOexpg+QO+Cy2z47Wo4sPbrxfBdwv
	3LpC49mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4uA-0000000HPXz-4657;
	Thu, 21 Nov 2024 10:59:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4u8-0000000HPXQ-1Win
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 10:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D425A4042F;
	Thu, 21 Nov 2024 10:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32262C4CECC;
	Thu, 21 Nov 2024 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732186759;
	bh=91G4dCwh8mKy26Z3P/fUzZl/SEjBepOn7g6X8McNNJE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fUWGp/EKqJ8onqzByUvTjg6QP0v+zBzkbH23u6I+wDHCkhJD6v6VYl54PeONSaDgK
	 9s6g/P8bhRymJ+yFhoL1kwApHyxcyajJbDil68QFb1Y7Im+90NBDlbuiIYuZWDsaCk
	 Y1UZb5ZcfHLwk0r8GIhJ0xOxIKJMuuJkQPNj7m/XM7OJiqo1WACds9RerrRfYAsFxA
	 CyM2hVLXSYW0In+LbE2QYsXpJS675nPEVUvywZkJXkt0YHcR5VallrRmFkVgOGPlwA
	 MPUBkOAZzG9uKXXGEu+G/9RYQIKDUtB3X9lnHDO+aQwV0oIP9H6VMMA8zcn5Ek3AYu
	 +IWnQcQl3j0aw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/4] wifi: ath11k: cleanup struct ath11k_vif
References: <20241111070152.85140-1-dmantipov@yandex.ru>
Date: Thu, 21 Nov 2024 12:59:16 +0200
In-Reply-To: <20241111070152.85140-1-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Mon, 11 Nov 2024 10:01:49 +0300")
Message-ID: <87o728yhrv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_025920_468111_194E3709 
X-CRM114-Status: UNSURE (   6.94  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Remove set but otherwise unused 'tx_seq_no' member of 'struct ath11k_vif',
> adjust 'ath11k_control_beaconing()' accordingly. This field was actually
> unused since an initial commit of the driver. Compile tested only.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

