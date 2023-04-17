Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685C7C77B72
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ugFCk6/zSPH/jZz0a7jhVEtccICjT+N35mOBRAc6P4=; b=l72JHNpsWOpOz2
	dOQGq2tCeillXLDCO7HSTLhk2YzeboQfNA5LXU2gH4UMBiIo+WpQA6MBVKV77RdVeKZHB8exNc62y
	VgBlEyVGzQj3dLinDaiRjPj+l2FRfALDs2iIo7pnpjEtZd3TXBsnsW+IeFvp98SZT7lQYKbe3N1l6
	Yglemz/y5BTeZGKM+x9cOgF+mgmuBBIY+CvDZzfY1h6pSM9YbTsJFcOJivcwi4oAihg3ejN0iabVK
	pFbxXXArsw4YABVto62y8CBspcWDDbxT2vczMHMhQOIEk+ksH+O0yCjKfur1Dldu4585KaRf9dqWZ
	Tpb9Y8wBTBkW79rQR1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLx1-00Fi8m-0G;
	Mon, 17 Apr 2023 10:19:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLwy-00Fi7w-09
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 10:19:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C88D621E4
	for <ath11k@lists.infradead.org>; Mon, 17 Apr 2023 10:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3C2C433EF;
	Mon, 17 Apr 2023 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681726746;
	bh=HM9nC8PljvBOotxdB6u1S7tyFSUTY+vaSTJETjjfhr8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jEQUt1Ic7aUNjQ1OCKF0RRsXmLvv7TE3wot+pjLVb01tb3pxtua6Yv8zvwseo5W0u
	 /OJ4X7Wp8cKODn75vEi0baFsFxpmVKY/K604t9d0eY6sx6lL2o8rx3OnV5xw/BMePd
	 dPEYix6SCterJR9xbD1p7yri7Y/w7ilG3IBTJERFnC/eaQFQxFvP5Sm+1TduGzwGcn
	 2N/Ryqx1rLGx9uYUftqDUYafjj1Cs2ZBjFFrp2nV3gxYOzRWU9mlOkSgapp2bova0i
	 YDobCX+aHKhobRtDKY67pRVjaNoSKJv6Fqnlle1sQxjM34PR1kU9EC8k9UIEwFPgGo
	 oqh1NGtsXkZeg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: print a warning when crypto_alloc_shash()
 fails
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230405090425.1351-1-kvalo@kernel.org>
References: <20230405090425.1351-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168172674407.12889.5186313051600365683.kvalo@kernel.org>
Date: Mon, 17 Apr 2023 10:19:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_031908_121957_6CF673D3 
X-CRM114-Status: UNSURE (   7.19  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Christoph reported that ath11k failed to initialise when michael_mic.ko
> module was not installed. To make it easier to notice that case print a
> warning when crypto_alloc_shash() fails.
> 
> Compile tested only.
> 
> Reported-by: Christoph Hellwig <hch@lst.de>
> Link: https://lore.kernel.org/all/20221130133016.GC3055@lst.de/
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a87a9110ac0d wifi: ath11k: print a warning when crypto_alloc_shash() fails

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230405090425.1351-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
