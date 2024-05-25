Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B821DC25B78
	for <ath11k@archiver.kernel.org>; Sat, 25 May 2024 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWyC0Geef04sy0uSDU+KKMFfTiCtbAGuMAdBBuMK81M=; b=Vxxi8t85aVFCHJUNH531PipkzA
	SdGzi++I1QpE360xa/khBkvD3syX5TvxpKvvyr8slAsm12ylm8ZmHwLHMGP9pH52P62jiZmkv/l7j
	C6q7I1/wvm3EtAlGMkfzAGSF2DYaHcqRJxmnycnK5+jlpsArSDwUZoUhebrGHFupJqQXnkO6r38cp
	DxluD7gHU9y0tf2DidffYtd3h+8HgOiQwsNBQ0Bum4Hsq9AvDWKWtrYq6o3qByVdKauTqp1Vr7VZ+
	mhriJo1wogKGcFZ+LVqtrCv9OEtvT/yK+rkxzqrNPiqt7ZpY3axwPiMn8LE0k9Et0DQgemwXtEacL
	VWRxsVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnBv-0000000Aeg3-29EC;
	Sat, 25 May 2024 08:55:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnBr-0000000AefQ-2XTY
	for ath11k@lists.infradead.org;
	Sat, 25 May 2024 08:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58631CE021E;
	Sat, 25 May 2024 08:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981F7C3277B;
	Sat, 25 May 2024 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716627343;
	bh=vRlLiGVQLYkGHgihrU5LRwI/0w5cQxdSPkQgFhFx2y8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OmXL8+v1UpLuh1mxY5YBCvz0TAJuxjscoKET04bhyxnrQArPQ88Q42NlnppXgxcv0
	 P/Se8l/5ozWx32BQnh2qXcCQ+Pqm9c9JRIDNFFZ/RSANQwRJ+vbSO35GFzIJdQZy5o
	 7QGLZJ7dirfQTu9WQQ4AlaoLCX5/vgU3YeroxXpwdexyEztQWNyGY9vUFYz2H2yYh9
	 l9ErEsgkhscXrFnjCaS3fTjIIGqNIX/0DkJP58ck8gQhoWh+TaYdeAeXhuWcqmFWjk
	 JnB7K8ExttfyvBqR1nTqUwqEM0C6M6SGuwX1jOAnMGu5laE+NkC1S7LM3ZfRkARwy8
	 SWxyEwaK1MIrw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath11k: refactor setting country code logic
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240520024148.5472-2-quic_bqiang@quicinc.com>
References: <20240520024148.5472-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171662734104.564311.15000751988973105599.kvalo@kernel.org>
Date: Sat, 25 May 2024 08:55:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_015547_931001_DCEC881E 
X-CRM114-Status: UNSURE (   5.56  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> ath11k_wmi_send_set_current_country_cmd() is called in several places
> and all of them are just simply repeating the same logic.
> 
> Refactor to make code clean.
> 
> Compile tested only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b363614c0c80 wifi: ath11k: refactor setting country code logic
7f0343b7b871 wifi: ath11k: restore country code during resume

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240520024148.5472-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


