Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19E6C433EF
	for <ath11k@archiver.kernel.org>; Thu, 24 Feb 2022 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVeVx0KA2A6xOfa5lUjGYRxbiIvsBSg/10u2jDKOPw0=; b=H0CVTgfW250ODm
	Q1aoOHZWAEFeipfkpWmE+CkyAqGcTtpUMGhuohZY4jgPaKxIOLuZUCfmi0ajytdCyE5yRcva8lz/T
	0jc3e2W9IDDm4IVsoPqtg73s2YFY3R2oRm0VERTu9T2+3cUPc8PME8V26mOOMtwntrvYbwl747Fxo
	nT6R7jIOT1YqKN3nOZMQaKAprAeTqtBFCgWHVem5WVNXu0yy4FMjMWkSaTXKcVW95DtMhsgGC1ddo
	boXCs0qMtSNSJYZ8TJWQm0VNJwCwQEaz95lfSypRQEvlTpy+XVuyZGxXHqkCZgFB0YIax6SdiWYvE
	iB/uan0IAV14lREBhK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAF0-00HZay-3h; Thu, 24 Feb 2022 09:16:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNA09-00HS7c-LN
 for ath11k@lists.infradead.org; Thu, 24 Feb 2022 09:01:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1362A608C1;
 Thu, 24 Feb 2022 09:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B713C340F5;
 Thu, 24 Feb 2022 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645693288;
 bh=iWQ9/XL+XPCbRTAkF64mX9DhFmkRiHGrDG2Zeem6XZU=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=EHa/5lC/sts4ozi3E7clHtypP0AOboxq1sZmlPrTcor6/H3S6zWLkt3Wl7n7YAAnE
 unyS3N2duYhysqo46XhgI70CEWE+s7XEqdy1cX9txd+4F0sLlIRBt06Uel0/fRJxZB
 rQB8hAbyTpmVAARNOUxZeCiHm9UuvyKYwdvJ95IyM4Vn8Ei+WMDJOXhDv+sg6Insx3
 dIvY5TwcK5ORAOIgeb1ZLVaP5C7BopP51WEXDYxpcBbDQB9R/J9hP04ZhpE00vycRU
 LmZVHXhjQpL3rIAVIwdWt9wnj6XuHQAhF1t4BYi74txb4mAywJyI3yfDpzUpmTffLZ
 8mgPrhcNJKG+A==
MIME-Version: 1.0
Subject: Re: [PATCH v10 1/3] ath11k: switch to using ieee80211_tx_status_ext()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220217012112.31211-2-pradeepc@codeaurora.org>
References: <20220217012112.31211-2-pradeepc@codeaurora.org>
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>, John Crispin <john@phrozen.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164569328285.30378.10070902613470760583.kvalo@kernel.org>
Date: Thu, 24 Feb 2022 09:01:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_010129_784274_AC9037EF 
X-CRM114-Status: UNSURE (   6.27  )
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

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> This allows us to pass HE rates down into the stack.
> 
> Co-developed-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

94739d45c388 ath11k: switch to using ieee80211_tx_status_ext()
01d2f285e3e5 ath11k: decode HE status tlv
ab0a9ef605cf ath11k: translate HE status to radiotap format

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220217012112.31211-2-pradeepc@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
