Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F0C41513
	for <ath11k@archiver.kernel.org>; Wed, 24 Apr 2024 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=317GPnD0XiodRRLiBJGXgBpY5wN4nQ/nzSbnGwjnpyw=; b=aelHWmTZ1X587H4x5/5WMzFI8g
	PucKu0f+2EnO8fppfinomekcVsUKoVqXYFgtQySk9UUg1h7t7wJ7TAOfdPFhNZD46lz3hYI3e3WRS
	ubm0Mo88C9IuTyIEpYS3MNBBEQj98oNe433W82CGqxznZ2AvJ8kd2+DdRLYQnOdd9g7uxE+fAJ+d8
	LmWBOZpR1HWvRhncAGX77ONwvKBskp4I/EgOmZdlOjUkN9M/4s/yOm/62gNhjZoekVTWtY1VbeUgd
	wEpjRNMVClSE7he0coZKsVYfMHKISeCtu0xZjN8+sqe75gWtV4YHBYihad4ZyKK3SdYH2V12rH3uj
	KgTj97eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbcB-000000042Qq-1SZN;
	Wed, 24 Apr 2024 12:20:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbc8-000000042Q8-2B77
	for ath11k@lists.infradead.org;
	Wed, 24 Apr 2024 12:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F051CE16AC;
	Wed, 24 Apr 2024 12:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F347CC113CE;
	Wed, 24 Apr 2024 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713961237;
	bh=9z/dwUBt/YCH6nE7fyydHYHQPhYb6AEbu6BFuSqaymM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZMhX2I3gXmMQ7JSi6/Ly0yFRG20ERwQ0ArAC/hUF/uqzZdoSG05c2Gf4IOmQGMshw
	 z8k+/r793R87rcMkDS+JmrPUJcqBsZ1HJSbwJdfpsiaGEJgBG8vU+idOuLjj+bNCOO
	 FT03CEop59ISQ5QuLu35EokJuExwYEU4bx5RZ4liI3elxND+chWjVyyu5nXnoQCbMY
	 zQd4R8N7P/gnNgao26yBajyQctcLuGcS1t0iw5IWRTSgHTIHxQYe/iwiNduNYncQyh
	 0BQHq30wnEZtTn51TVg3/Aad15d0onQZaitDXQpG0v4TEMEeomL9181KRaOL/djDRX
	 P9CVlzOjGKPpA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when connecting to 6 GHz AP
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
Date: Wed, 24 Apr 2024 15:20:34 +0300
In-Reply-To: <20240424064019.4847-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 24 Apr 2024 14:40:19 +0800")
Message-ID: <875xw7t0j1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_052040_762098_499B480C 
X-CRM114-Status: GOOD (  11.69  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> ath11k fails to connect to 6 GHz AP.
>
> This is because currently ath11k checks AP's power type in
> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
> However with above commit power type is not available until ASSOC stage.
> As a result power type check fails and therefore connection fails.
>
> Fix this by moving power type check to ASSOC stage, also move regulatory
> rules update there because it depends on power type.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>
> Fixes: bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> v2:
>  - add check on 'arvif->chanctx.def.chan' in ath11k_mac_op_sta_state()
>    to avoid NULL pointer dereference.
>  - add 'Fixes:' tag.

Thanks, this seems to fix the crash I saw.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

