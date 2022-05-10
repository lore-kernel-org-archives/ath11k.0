Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F591C433F5
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 16:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skLZIlN6EZ+DzqFTBlIsaPAHiF1fwMXtXMOImGgBHqU=; b=pQ9vyaREsLKxsi
	GtwB871HcHLjgE1BDetaT9/qKXV/SN8XBv7x806GqKZSKV/dpqa364IUUEgJNjQsbBkkp41v2ZbKa
	0gl+VHpoysXukSK5okHH3ZtpXUkBuGX7H9yPmsAuACSv9W83m0dGTyaPx3b5RRn0lF1XuZD67047T
	lv6xOny6foXHNQL50m2n8E4c5L2jj1B0Pk8PQ0SndLLXzM57NZN6jSvCwFWeimLRv6j++Nut3orym
	G8wtB4xRxJoCLtzcse3N+gMTJx8KSTE/3qZo/x3SS24F5z8Q4PpMp7lJs+tHc1bnibkCcdde62nOO
	U4FWDR1R0Ajkx8EeHtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSoh-0037oQ-Ie; Tue, 10 May 2022 16:34:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSoe-0037ny-Af
 for ath11k@lists.infradead.org; Tue, 10 May 2022 16:34:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D475D617ED;
 Tue, 10 May 2022 16:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7204C385C2;
 Tue, 10 May 2022 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652200467;
 bh=VODkbTVf3Dt1eFAC0XK/q51ZYmsgxWsx2okbVq533/I=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=FMONo6rKpM/kM/FTdTbOVzHXvhfPaCSQuBlJA6PJDkdaTs5h3XnyCI+NkpUOL5Bcf
 6vqZbmrkamiTOK2a+wLItHL4hdgi34UVt8c7bxF07yVlQe73/VZJFHq3nYCdf3Ju5J
 5LC6RZ5TcfWOu5qonumaSY+ck3IYMAClNwk6WOSgjjVDcZFCtnE1IMB1vn0Xd319kv
 Dzl9BdvB8Ix8x70doQsw4iwzE25cfc0Ryh6fqclmmTXCvHLzLwM6Yn7xwusH41eZSx
 wbHpHgWkZ8pQxys3c+v7ecTUqDzx4Nhevx3x9Qu7esxtmxW+zOV932j/ciFsM5aIAb
 fBbUbrKzCu7rw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove redundant assignment to variables vht_mcs
 and he_mcs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220507184155.26939-1-colin.i.king@gmail.com>
References: <20220507184155.26939-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165220046267.6768.5493678781221358887.kvalo@kernel.org>
Date: Tue, 10 May 2022 16:34:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_093428_451959_097BA176 
X-CRM114-Status: GOOD (  10.35  )
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

Colin Ian King <colin.i.king@gmail.com> wrote:

> The variables vht_mcs and he_mcs are being initialized in the
> start of for-loops however they are re-assigned new values in
> the loop and not used outside the loop. The initializations
> are redundant and can be removed.
> 
> Cleans up clang scan warnings:
> 
> warning: Although the value stored to 'vht_mcs' is used in the
> enclosing expression, the value is never actually read from
> 'vht_mcs' [deadcode.DeadStores]
> 
> warning: Although the value stored to 'he_mcs' is used in the
> enclosing expression, the value is never actually read from
> 'he_mcs' [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

25c321e8534e ath11k: remove redundant assignment to variables vht_mcs and he_mcs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220507184155.26939-1-colin.i.king@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
