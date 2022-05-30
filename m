Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D093DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 11:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dmx0pWWyOssfU/9C2CiVvTwu7g84siwKwNeiy4SihWo=; b=0N2YTa0fwaPUxw
	0QDs/QTBc7S2YXv2n1l9kKTZ4wATXcKXBZQW3lKJzjG6oC1ha4+ixAqkjjpi6p9qfdoYD83dPkKrg
	NLwjG5D4dUi5FyJqmumt3UzGA+ZiJ2r+jjMLDHa+G/DCUfzxHY0YW1LXsSswh+8SjGVtmz8aK16O5
	r/oLtBcF2ww7fh3QfJIw+eDl0T+eC8D8J3aaVEw9Uj1VrjP5nQA9GjSqbA1rKMtpmjiIce2iaFZK8
	KIomcV186EZrlW97m3mltbsx3PcoLmBBsq6ouuxsvP9Mc8C0BWVRljcTJmYiKOksZnn4v7flvZ6m5
	p+2JTqsz0VM5ntshy4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdd7-006MIM-8C; Mon, 30 May 2022 11:32:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdd4-006MH3-Nv
	for ath11k@lists.infradead.org; Mon, 30 May 2022 11:32:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 58C47B80B8C;
	Mon, 30 May 2022 11:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04862C385B8;
	Mon, 30 May 2022 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653910328;
	bh=LVrwAmQkYHzGF8RQ7QeyXmZ9t3aKlO9mRE+QvNW53IA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=VfOPh+Au3x9aMhtuZcCtk8jUZfm8qggVdYpMbjJUqjJCvS2rgviPCaeHWJGFZaAJr
	 tLCF+sgNbUjbxOezs5Rn8fX3VZ7wKvXeMQZAuRM+xVr3AFNCLarnB18vAZ2VgDVyVm
	 2vhb6OqUCoXVCoSfQV4EwcJkSaevqNYhVlV9Sx0CPq5gZQQaVXvg3dSV+3FBD+f+ac
	 rphhKFos6PoCmkrWMEt7Ca0ygIPwz5l3IZI+bAC2YxVVGaeXHH6FnUoHrzR0fAvjU8
	 i1E51GZChD3rmT7wxDdbJPn3o45lzDvndjtTDdLIRtMlS4DZtqLk9JsBmN3BK/QXhg
	 rNgeVJLhS2ovA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: mhi: fix potential memory leak in
 ath11k_mhi_register()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220530080610.143925-1-niejianglei2021@163.com>
References: <20220530080610.143925-1-niejianglei2021@163.com>
To: Jianglei Nie <niejianglei2021@163.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jianglei Nie <niejianglei2021@163.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165391032080.5601.13315150837208103728.kvalo@kernel.org>
Date: Mon, 30 May 2022 11:32:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_043210_979001_F5FB29DD 
X-CRM114-Status: GOOD (  11.99  )
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

Jianglei Nie <niejianglei2021@163.com> wrote:

> mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
> errors occur, mhi_ctrl should be freed by mhi_free_controller() and set
> ab_pci->mhi_ctrl = NULL because ab_pci->mhi_ctrl has a dangling pointer
> to the freed memory. But when ath11k_mhi_read_addr_from_dt() fails, the
> function returns without calling mhi_free_controller(), which will lead
> to a memory leak.
> 
> We can fix it by calling mhi_free_controller() when
> ath11k_mhi_read_addr_from_dt() fails and set ab_pci->mhi_ctrl = NULL in
> all of the places where we call mhi_free_controller().
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>

Please always include a changelog from previous version:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#changelog_missing

No need to resend because of this, a reply to this email is sufficient.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220530080610.143925-1-niejianglei2021@163.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
