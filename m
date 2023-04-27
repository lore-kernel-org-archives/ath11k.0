Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204C4C77B73
	for <ath11k@archiver.kernel.org>; Thu, 27 Apr 2023 04:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16yQNbTGl6dWmLa0KdphgrU6kFtOQRyN3fLz9n0Mq2c=; b=DTZnvKm0YhmVta
	8bsl+/D/J7usRvxIUwnuczU3BDsxtKxEvIfhbHP8VnX/aTIAeNQSXNyRn87UgzbIhoSd88JxD4anO
	YzV3WFIQYQ36tXmaksOFmcGbDrHlNguW6rfrTbgSCk7+ri7gCaIBv9sQ+4kDlppiM4CCh4yt1Vgqt
	5xpP5RYpOOl+Wjn3HJU8axi4Iafjc3Vr+N5mVmAggTmo9RCl3enT+GxNEiMe14M88+UAtyOvi9J2A
	743hDpZKp0zWwpEKrWcvR2SSRf+GOtWFGsfpQSvZkW+gEj4596x1EZSYg33AE1hIATH1XEZEeTaPF
	F93dZTiKYQtoo21je91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prtLp-005RGV-1V;
	Thu, 27 Apr 2023 04:35:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prtLm-005RG0-07
	for ath11k@lists.infradead.org;
	Thu, 27 Apr 2023 04:35:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2829963AA5;
	Thu, 27 Apr 2023 04:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEE9C433D2;
	Thu, 27 Apr 2023 04:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682570117;
	bh=ZWJxz5ju6P+OVD/7NyM+5pJxespwIzDbwPpmWrff8AQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=g0cjfv5y37f+NrSBWiH89ab/8q42L903hYb7ePaa9kPABfrRO61HbYi8vC4lkNUCs
	 bvXgXyB+CcQc9K1w6M6nkkG30PqNzKs5L9NI+u0p1vVLxY8b1xuTzSXVbKUVGMZ8/h
	 s7qfaR3rBfICkl1OSC99qK3+emSwvaRGM8Hs6aAVVDEA86pvQPGJPxWhS1BQ0t8zXG
	 mGOPMiy560BfH5hrfUzfs3MJc+1swAWe5yMVIvHjn0+Ns+Xvk9x/mKzzSJnLAZANtv
	 FlyFprBecySuLn85aHHzWXvgybWFeUzYZ2Xk/PMIq7CYIEkZ0CVp9QsdzRA59pI+Fa
	 lgs7YxiTamPOA==
From: Kalle Valo <kvalo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
References: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
Date: Thu, 27 Apr 2023 07:35:09 +0300
In-Reply-To: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
	(Christophe JAILLET's message of "Wed, 26 Apr 2023 22:48:59 +0200")
Message-ID: <87v8hiosci.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_213522_118535_1B0EA832 
X-CRM114-Status: GOOD (  13.85  )
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
> look the same as list_count_nodes(), so use the latter instead of hand
> writing it.
>
> The first ones use list_for_each_entry() and the other list_for_each(), but
> they both count the number of nodes in the list.
>
> While at it, also remove to prototypes of non-existent functions.
> Based on the names and prototypes, it is likely that they should be
> equivalent to list_count_nodes().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Un-tested

I'll run sanity tests on ath11k patches. I'll also add "Compile tested
only" to the commit log.

Oh, and ath11k patches go to ath tree, not net-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
