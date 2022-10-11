Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A528C433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWd9oD2ABIS2yodBDY0JsxWtlfwLCfdrf3W7F1RsZj8=; b=Bp+gjUwER2AAsg
	ZmbqGWO8WA8PYLjFRWkgm+EL5B05zqqlMx770vflRh/3uqUIh6iCfjQft90Yt+VOb2PMVhIpwqPQK
	VoNgg2Pyz1w2muokf458oi6TGQkENLFrvURV26mDBcJkjuEQy1ZNQhcid5j0GlgOyRmkG8RXJ0auL
	1Dr95z4MzwPibXBWMs8txtah/nRa5okRYlxEKwT/8lkSJrCgghsTlE45cKfSc3UJkuvoyW8Q5EFto
	KMliSMfqoMzPWQmN9jjs7CmRsG1grFPs5QMa7UUhQE2Liv17jvgw3vPoQou2nYj/NSwvlzBCn7FVb
	EYPdNrpwtcpTcui2lSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiOe1-006CeD-KN; Tue, 11 Oct 2022 23:26:41 +0000
Received: from mail-4324.protonmail.ch ([185.70.43.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiOdu-006Caw-2J
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 23:26:39 +0000
Date: Tue, 11 Oct 2022 23:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1665530789; x=1665789989;
	bh=rA+NqoVYdeYl69wcgzIF4DsOOkaG8J+ANO6c/mWwtGM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID;
	b=UbGJR3Ae2IpICIt5D9CLJxiVRpOCUH5/1WNgB4+1cNpLpq5dfbwF8g+EPYlOWV5DP
	 4mg+ekUIvR3xwUxbvzydbwN00vF5NELQp3Ox1zKKdJ7gqXgrqLj5V9SkFMVQQd2O3U
	 mcwZQ8pxGpxKbjcpm4+g0OjZJy1wHDOgcMf9ijG6w9HxneSYPoOK+iFUmDmN17pzCY
	 R/blkeslvFFbFkWwV98ZD4EpL0ZDMbrpU/EEjXRiKx1/MNj6DGSbX5BYhyxbUzVaYn
	 aMBVBw7XjlOaAsZRI1dCylP0GOH7+FyW2EQnlqhUZpgLiHclmu5kYeLcg8V9a4YRP0
	 s3jEhOgKeaoTg==
To: Kalle Valo <kvalo@kernel.org>
From: jloretto70 <jloretto70@proton.me>
Cc: "ath11k\\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Question about WCN6855 firmware versions
Message-ID: <YaEWb4YgE6oAMUOKmnaXv8baJqRMb2uLAEkLkUnOKeqniFwUNWae66CuL9bbOgKRA6yxNlGxYvQ_2H26aROZHQ1nprgtok_nqmmXmciwpRA=@proton.me>
In-Reply-To: <87y1tmokru.fsf@kernel.org>
References: <ozkZDmxXw0zoF9CbOu2CoxEILU4fpAb8udwK4yw-Jgwc1z7zvIZD91zIK0rxq-8vri3WDPztrozKOgZvm4-SLnBvOJoVmg_qr3s47YeckL4=@proton.me> <87y1tmokru.fsf@kernel.org>
Feedback-ID: 56744452:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_162635_475026_204E8B9B 
X-CRM114-Status: GOOD (  13.42  )
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

That's very helpful. Thank you Kalle!

------- Original Message -------
On Tuesday, October 11th, 2022 at 2:57 AM, Kalle Valo <kvalo@kernel.org> wrote:


> jloretto70 jloretto70@proton.me writes:
> 
> > I have a WCN6855 (hw2.1) card and am currently using the latest
> > firmware files from the kernel.org repo which are labeled 3.6510.9 in
> > the commit message. I see that there is a more recent set of files
> > labeled 3.6510.16 in the GitHub repo for this card. Are these firmware
> > files safe to use or is the best practice to wait until they land in
> > the official kernel.org repo?
> 
> 
> For the end users I recommend using the ath11k firmware files from the
> official linux-firmware unless you have a specific reason to update
> (reporting a bug etc). That way there's more testing by the developers
> before you get access to it.
> 
> I try update latest ath11k-firmware releases to linux-firmware roughly
> every three months, so it really comes down to if you want run bleeding
> edge or not.
> 
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
