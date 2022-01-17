Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5668C433FE
	for <ath11k@archiver.kernel.org>; Mon, 17 Jan 2022 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGDqT5iQnIIGX9/vbH6DpvUM9YTbZWuPWoLfjBvU1Rk=; b=j7tj8giieW0U0L
	bQC7w0IPQVQWhSOwb3rwW1ffoOBtXxvK717reac5xlxX4trOSaHduWp317nCbQHQlcCdy0HCwZrLb
	bPJyplss2k4UgrvQbgIPgdaZGArTkdyQKMkFceRFqM6hWj1vnWxOFU/J25Qte3gZ2PiNj6L4U5SSg
	Ysnu8DY+sGPMhstZH+d5+48Iu0W05jUDbOS2UhP2Psr7RG5pDhW7f3ZqikLRc9THfkBfqsShCF2w8
	1VC7CVJEDpLOdXzz0GMV64QK8XH2PIMnU45+FLT5p0NYPoH/cDRf2XcnOrXLSc3HHgaiOuvt/efxp
	ENVSnohGpPXMz/UrOU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Rcf-00F07E-Uh; Mon, 17 Jan 2022 13:00:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Rcd-00F06h-Iy
 for ath11k@lists.infradead.org; Mon, 17 Jan 2022 13:00:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE842611C6;
 Mon, 17 Jan 2022 13:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7707C36AE7;
 Mon, 17 Jan 2022 13:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642424430;
 bh=3S0Ctk48yPY97wks1dFDFxCroL+JI9L03ZRiPTjDIP0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=vHcl/fastd0J7QDqzul7f7BJIM6UUDwlRAL6kbYsf86E724PGa5b9JOZZNL6mlauz
 AnAn5jxA8O4OXwZWpAO0ZoIRb0UCJQ/5P1o7DRv/VQLjgMGC6Q2fck23u84squf0/k
 bkvsQ/3HY00untoCkCH2Ue5egj/aiiRmDDmt+P+CtZHijve+FmiJGNSkI3q/ch6iFQ
 mqqNCSv8ixjWr0IKzdiXFGcyTjrNzOoRaPwVO2KQ6D5KzM9JQyDVu+tq3EfY9dXvR9
 6xoHbvckOOtN2ChG1ATEy1DQui8RY/8lNt11PIHBFKD7aJVwIrFS+YruGfBm7C171O
 9bytcJg9wepZA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix error handling in
 ath11k_qmi_assign_target_mem_chunk()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220116144206.399385-1-trix@redhat.com>
References: <20220116144206.399385-1-trix@redhat.com>
To: trix@redhat.com
Cc: davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, akolli@codeaurora.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164242442618.16718.73054650971271178.kvalo@kernel.org>
Date: Mon, 17 Jan 2022 13:00:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_050031_703508_4F6E0435 
X-CRM114-Status: UNSURE (   9.24  )
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

trix@redhat.com wrote:

> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> qmi.c:1935:5: warning: Undefined or garbage value returned to caller
>   return ret;
>   ^~~~~~~~~~
> 
> ret is uninitialized.  When of_parse_phandle() fails, garbage is
> returned.  So return -EINVAL.
> 
> Fixes: 6ac04bdc5edb ("ath11k: Use reserved host DDR addresses from DT for PCI devices")
> Signed-off-by: Tom Rix <trix@redhat.com>

I just applied a fix from Dan:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=c9b41832dc08

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220116144206.399385-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
