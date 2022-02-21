Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CF6C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v7I1LEFlRAgZf9piS2wgde0XiOUt/odCyA/2geH9Dg=; b=IMhhcWDM6ALGO3
	SIwkIEmegmVlfKrNjnJ7gsNSJuK5OTKQHykd3iCqeaCQkb1aZam6k9DADLchpVWtCWzAO89qtnl0m
	xhlXyjtrwCxwF8GPtiUn55TxqXF4m9jEwo2aKwsMoZIunxNq9jgWRza4h0fjeIi8ZEKCOp+bz8/zb
	B3KF9lDMrwaIMQvAdahF/14drVOXPOJZM63XoIYVm0L3FZ89SykXaRyRGkjuXAfyt5VB55uU7BgEk
	p6dIzNFENOrOdJHwBwGfkkU68I9E2DiVvwEi49X2tEPi2Uvn7YF8ibfiKDFSTqU1rkj0twUS2fxJp
	Uiyrj03+EDTcwGYPAfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6M9-0059tp-8v; Mon, 21 Feb 2022 10:55:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM6FQ-0055rm-5i
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 10:48:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9662B80F99;
 Mon, 21 Feb 2022 10:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7F9C340E9;
 Mon, 21 Feb 2022 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645440529;
 bh=J0KhS6AlqO4yuf9zyX2QAgoBYvw2YeO02ZDAQwuNc8U=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=nKmlHNb9dAoLUWshjyMZUNeOzVvF2ugTA4xWnaka/82HRdHOxSJGft0mpz+lkpTYB
 ZVx+sU5BoBVvYNIEo84qXIe+cQAjNawxgJgxNVeHZvnovJbgOWoKXI52w0pGCXIaB8
 OI8s9MlVIH8M6eCb7/T46pvxfuluEQKQy2jyxb/vZwIXaD4kVSG8qIImA4MCHO2rx9
 FlS3ooyQpay07HUn4o8cdK/AVjDL6I3PVtYzQBoU66ANRsCCzc+gBOkuMeuEdq6Gf+
 yfisRxYItHS/m+7yuXUPRok4xddKGIvXQS9kmx0p5peia4S20YnJa9QK5Gm8c0w6J1
 gVk4f6+Q7q+uQ==
MIME-Version: 1.0
Subject: Re: [PATCH v10 2/3] ath11k: decode HE status tlv
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220217012112.31211-3-pradeepc@codeaurora.org>
References: <20220217012112.31211-3-pradeepc@codeaurora.org>
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164544052552.18502.8389290948480372442.kvalo@kernel.org>
Date: Mon, 21 Feb 2022 10:48:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_024852_434701_D35CE690 
X-CRM114-Status: UNSURE (   6.38  )
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

> Add new bitmasks and macro definitions required for parsing HE
> status tlvs. Decode HE status tlvs, which will used in dumping
> ppdu stats as well as updating radiotap headers.
> 
> Co-developed-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This had a new warning:

drivers/net/wireless/ath/ath11k/dp_rx.c:4859: braces {} are not necessary for single statement blocks

Fixed in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220217012112.31211-3-pradeepc@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
