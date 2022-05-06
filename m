Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BD8C433F5
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 06:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mqo1mgAgllIrpT9AA1EWi2YwLVWVW6fgBmgN86n4Lo=; b=V6Ye5zByKNC9HQ
	a2OuzVV4JOGogWzfA6v2gpJTiseZJEUc8q0eiab+hYBqmGKIjT/2fpYAu+ITQhLSNXSKZJzV1uGqf
	yCXiVcKqckR1XNgCsBLZRLrvRaYom8LFLUz3XnQUaMRgZ1+qQyIcGludBCzG53bXywWScbuK6osXk
	Z7G7mIjEefSQv+z3RooJIJjZdXrjpS8JdySOK5tJbH+K+8CsCFhIVUaz46401NuyLM/d46CgmbEIx
	aCv4oxNpHhvumFMINBkZ4sEShT3AxLbOKaqgyOTk987AFMfDZn8qn2sByWs4KbJ49decjoJv89dow
	RH8SV6aP+Spcd/SdhT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrHF-001Ycn-3W; Fri, 06 May 2022 06:17:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrHC-001Yc4-Cy
 for ath11k@lists.infradead.org; Fri, 06 May 2022 06:17:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EC1C61F18
 for <ath11k@lists.infradead.org>; Fri,  6 May 2022 06:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEA4C385A8;
 Fri,  6 May 2022 06:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651817837;
 bh=R/IqYMA70GKlzEAbF0SXS9SWS5hXlUKXASu1VqBpxfw=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=S1/tGnGQaxYrP0ra3aj+egoA0KODXIBEeBh+CXI7N2VXlS3CWQ0c5SfblPJhplgEm
 7a2GOUENT5KxbDAHMhRPyKLEY9JRbIKmwqySAxQ6f2SeO3oPsbid1HF+jKp2UZT2Ax
 CSr8IqvVlQaFHh7Hu87H9huxk9hUv/eUFCd62qfTUZ7xGTbMwBFbqTxJfhXULbaiW+
 w9Fy19H1ux2VHjebdLS2om4AyFWy4/PwG7cej77eANUyp3KYSE5D8sUXge+xMluwVM
 3bWER0avIVjoGCqRYUxacew8LpPU7U2TTwtaKv9aBDkwllJBfn080ebzh/5BTqpqc5
 UA37wTzk/T4vw==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: mac: fix too long line
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220503060415.24499-1-kvalo@kernel.org>
References: <20220503060415.24499-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165181783347.13324.18042669600144341850.kvalo@kernel.org>
Date: Fri,  6 May 2022 06:17:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_231718_522471_557A1A95 
X-CRM114-Status: UNSURE (   6.57  )
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

> checkpatch warns:
> 
> drivers/net/wireless/ath/ath11k/mac.c:7760: line length of 91 exceeds 90 columns
> 
> This was introduced by commit 046d2e7c50e3 ("mac80211: prepare sta handling for
> MLO support").
> 
> Compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

80c5075f3999 ath11k: mac: fix too long line
d9e441855c64 ath10k: mac: fix too long lines

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220503060415.24499-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
