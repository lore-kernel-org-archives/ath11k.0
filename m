Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03514C433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ap4mJ+J/ZvskHeGehkjsoIYJmKkx7BL7x0UL2L8BrZA=; b=dpVlUJW83yFcXY
	3AS6/hPmHJf5tsPzth0G9kQiMo35cu+uEjFMSpgDg8oB4/kOAB5tvn2HIpi+1bNY4OJEjeVo0uo1U
	n4UgUjzf5ISvoaV5mgG7UaTAAIqUaIATNqLdRTilW44lsEaEpgRZiLeZdETXjqL/L0z0yIq7b0RSw
	3QgEarFGK6FDWefYVAxl5ytr2hWbEadjpvCgi/2vWGcATp9YI683UQo5RuKjEN6Gl3llWJtI2gjYu
	/AETlxrNAx55XTXM1y0MN0a32e97rUlgz24sYPerqOopVSTXon6UXr7KAEAqbMAldubOCre7iQX19
	1ynKlJM8ToWdYEf8u/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nviAK-007c38-6F; Mon, 30 May 2022 16:22:48 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nviAH-007c2C-5V
	for ath11k@lists.infradead.org; Mon, 30 May 2022 16:22:47 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 14274202C7;
	Mon, 30 May 2022 18:22:40 +0200 (CEST)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 0F16120260;
	Mon, 30 May 2022 18:22:40 +0200 (CEST)
Message-ID: <7f93d9d5fcbce1ae8d2e87069c27bf86a610303b.camel@freebox.fr>
Subject: Re: [PATCH v7 4/9] ath11k: Add register access logic for WCN6750
From: Maxime Bizon <mbizon@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>
Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, mka@chromium.org
Date: Mon, 30 May 2022 18:22:39 +0200
In-Reply-To: <871qwbouzq.fsf@kernel.org>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
	 <20220429170502.20080-5-quic_mpubbise@quicinc.com>
	 <bd6d97a4cc6665d0ee632444f75e3480160387ec.camel@freebox.fr>
	 <c57e8791-b6ce-0752-52ca-a1cb938187d7@quicinc.com>
	 <c1c3472427080716c69ad99ebe5d1954db44f03f.camel@freebox.fr>
	 <871qwbouzq.fsf@kernel.org>
Organization: Freebox
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon May 30 18:22:40 2022 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_092245_397783_15614327 
X-CRM114-Status: UNSURE (   5.40  )
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
Reply-To: mbizon@freebox.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Mon, 2022-05-30 at 19:17 +0300, Kalle Valo wrote:

> Looks good to me. Can you submit that as a proper patch?

I'd prefer that patch to come from someone with actual knowledge of the
hardware, I basically did a blind revert

-- 
Maxime




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
