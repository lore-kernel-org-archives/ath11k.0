Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFFCD32D75
	for <ath11k@archiver.kernel.org>; Tue, 12 Nov 2024 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lst636w5r6ghzD3cK6XSoFPqB2w6WUODgKoCLr5Vh14=; b=qPQvE7Ccv3qY2YbyMuDpBbSvqo
	n2GTwADxCkTAvByL2ds33rjpmOu0YXUenKcD1MmIR2ZsbMg2WU36bBA7suZ2W2yF+enqcfwJChZQ1
	ndwnXcZ3Q+8gVVZTsvWYR7Wp58/zDcczmBRMSSifoNyifmZxU4xZeQm9TAKeIBLTFMWv5lGC1JK7F
	pJA6Dc3Ej6q8Hx9vjsJBD4oIM3AEe/Mu4N0fexLVXkWG7A5s8XQomwTb+U1LTbJ/Uge7ae0BogRxy
	rOoowyQJy7eCRTVRPA1AIj0d77VvQrdpGiP+51CQxXvqraiDEcQmSEWOcfqiLP/Ii59qlWerPE9lI
	IhPdzeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo7p-000000032oh-41kz;
	Tue, 12 Nov 2024 10:27:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnxi-000000030UJ-1lzj
	for ath11k@lists.infradead.org;
	Tue, 12 Nov 2024 10:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99AAD5C4B00;
	Tue, 12 Nov 2024 10:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6985C4CECD;
	Tue, 12 Nov 2024 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406649;
	bh=XWmn24pqEPofhFjs8lrl+hPSdZSxeKaJt9Se7NbgBW0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cKKDas/zpQdOak9itVtHzqbH6UTuJHMPoHop8sWlodS2g9ZCWIFMQ2H34TtOyfjzk
	 wdZ4XROZG0+L4ewXHcC+dyT80+50EEJ62/0uOOLYWSrxIzshlm+1w7gHOhuf2YA6Js
	 6pUCCA+o4Ndq3nhxv3xutYG98I5j//X3lIn/WI6zQr0gRytC5TREai1awliy5Vk5av
	 k/g9HS87SeZ6Hma449Xke1KtczVBsK5i6VHdb+ITXSq2wTUEskwLjeV4h3OFTAxVeb
	 Ixekeme0Ea6mGMESDgmvLRDkfdH4r8QPy0nKyg5kyIcDYyHr/AXYWSfszIcIF5JNiP
	 zOLYYJ4c7IzpA==
From: Kalle Valo <kvalo@kernel.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: Fix unexpected return buffer manager
 error for WCN6750/WCN6855
References: <20241030114625.2416942-1-quic_bpothuno@quicinc.com>
Date: Tue, 12 Nov 2024 12:17:27 +0200
In-Reply-To: <20241030114625.2416942-1-quic_bpothuno@quicinc.com> (Balaji
	Pothunoori's message of "Wed, 30 Oct 2024 17:16:25 +0530")
Message-ID: <87bjykwybs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_021730_520347_ACDFF0B3 
X-CRM114-Status: GOOD (  10.21  )
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

Balaji Pothunoori <quic_bpothuno@quicinc.com> writes:

> The following error messages were encountered while parsing fragmented RX
> packets for WCN6750/WCN6855:
>
> ath11k 17a10040.wifi: invalid return buffer manager 4
>
> This issue arose due to a hardcoded check for HAL_RX_BUF_RBM_SW3_BM
> introduced in 'commit 71c748b5e01e ("ath11k: Fix unexpected return buffer
> manager error for QCA6390")'
>
> For WCN6750 and WCN6855, the return buffer manager ID should be
> HAL_RX_BUF_RBM_SW1_BM. The incorrect conditional check caused fragmented
> packets to be dropped, resulting in the above error log.
>
> Fix this by adding a check for HAL_RX_BUF_RBM_SW1_BM.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00258-QCAMSLSWPL-1
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>
> Fixes: 71c748b5e01e ("ath11k: Fix unexpected return buffer manager error for QCA6390")
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

