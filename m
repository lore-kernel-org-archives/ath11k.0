Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EF6C433EF
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/HptoMAx8QRaWAFNh10ymWMEOP4qO4CLzW4ekVGQ6Y=; b=KznMLi7dvAQtcx
	3XoEgLlmlCtCHXv0jCGyJAk9u9FMCMmZgZXQTgYJwI5WmHkhPCDgnBIO3zbNUoUwImtg6t40yIP21
	Ez1P8wnFUVYmitBn0Ds1OJ2egKweNeYXkFk4CrHgicmUvfaRNGuKsrgsxgiFlsJnoXGnqr1wjje++
	OqFVZgKLZ7XGYNhrrEsY+h1GUIMl0QewbyAv9Bsh4HPIaJ9uY80iWMAdTC6+5LJ9jl+MLaRr/gCPg
	kyEZfd4tVB/OcPYqGDcbm5/q2aReDjUaBuLx4P6eRZIFrsFBJr0t7146Ud/JuOvOT1U5KVlItDNJn
	6DV8ERZdn/XM4CCP5Kcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYlVv-00812B-4M; Mon, 28 Mar 2022 09:18:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYlVr-00810X-Jv
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 09:18:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE17160F0D;
 Mon, 28 Mar 2022 09:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E641CC340F0;
 Mon, 28 Mar 2022 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648459090;
 bh=pZuoXFadrtCx0LhURtPkckMaeaJRTSgMwySm5XoP3o8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=rpfcRJbfbTQ/1PWK72CZFH/DNFfJCz/bTGavrkpjhpIzf9YriL5/44KTVk/9MJb0f
 30+Yax+oghiwC/s/Eu+S7Q/MJzsJH+bP1+Q0I5B4DAZaobi/m8JJzP6SNt3CSmm/n4
 YwC70m2oBxxXr/UXFbc4l754Jb6YbyQPfkDTGzgAnBikNYrp+su8K4BXwf3LrBRqKJ
 WYeWneNYcgo+LSl9Ubi5El48m2qaQwVfYvpEa2N+SZf3xrvgl1tWQs19nj/w76e+zq
 oWrUX6koNSMYOlqS9XGkJJ341g8eJATfsj2aJahjCh7hmC48UTd9UcKKRW4xBfIC4i
 y4qhMruXV1RHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH v3 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
References: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
 <20220328060937.16738-2-quic_mpubbise@quicinc.com>
 <0256a6c6-088b-a7d5-68c4-b99238bbb0f4@quicinc.com>
Date: Mon, 28 Mar 2022 12:18:05 +0300
In-Reply-To: <0256a6c6-088b-a7d5-68c4-b99238bbb0f4@quicinc.com> (Manikanta
 Pubbisetty's message of "Mon, 28 Mar 2022 11:43:47 +0530")
Message-ID: <87sfr2zb8y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_021811_718095_F8196355 
X-CRM114-Status: UNSURE (   7.22  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Sorry for top posting, missed to add device tree mail aliases.
> Adding them now.

IIRC DT maintainers use patchwork, so adding them to CC in a followup
email won't properly work.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
