Return-Path: <SRS0=G+gt=OV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AECC433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 07:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56AA461A71
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 07:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56AA461A71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VF1CAmgs0+pZ/dduK5PyQoTHrdYXqvjtt24Fn7Cpl0M=; b=yisZ5VHFL19fyr
	EFw7QZk51eyIyVnjxxHdMwYNMvbKYe1pPzTctAnTF0SErA9pXA99jNQr8xrW1EOpfJK9axtZUFRuK
	CF1VVwZCfp6gbI/aDVo0p/Zft7d2UTA0glIqOSckMOGxzqbKQBHjJkjgPZZ0syEnfmvBcmtMQMMZD
	HTrCHnu52RA9hYKErYVWHzrIzQY4TBK9GM5MtA6LJ/my0DKuwt9piCgHKxheXj2RJhZ4DBbhFcSvy
	X2nzTrhuW7F8NWip/qe8LmUmxpbiqCzNEetSFcuSCVqwTFjAdC1ut7YqA1T4ZzZr/TXsE2mctYgd0
	OZFy0eXbWpy7mZxh1CqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWCXd-00GrVE-NP; Fri, 01 Oct 2021 07:01:09 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWCXb-00GrRs-B2
 for ath11k@lists.infradead.org; Fri, 01 Oct 2021 07:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=NJr5xpW7MZSkW7xFINyqHqDBDFCpW/nUdFRJKEADvuc=; 
 t=1633071666; x=1634281266; b=lc+bF+uLFAx9LLyCoeBiafqcWqXydduR0UjkOFKmdpmWqqP
 g70yrYVnPyKz7A8jZ7zRlv/mv2k5K8R3nhvICXIrplZJO/WYQ/50N9qX6LpRMKnTLqRjwntSsiuHf
 Ry2+yZSY/ZD3sIGOegyrdLb1V7o3M9mIjlEH+bw1iuAbIpi4Gvjc4ETG3h3tKDmJFsFFEhHLwXcdj
 iMU53gLPwVfEcPeC+Zxh1oBmZnif2ga9hCwBcHhVMGAH6WuZyjV7Cy/rR+qFERcK7gJ2bCaFImI6J
 stMzWmkr/WjzuNnhUlWghUYp6bFk2bVlPNKrornW9LYM+QL71fn2alVln3usZzaQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mWCXX-00E6g7-PG; Fri, 01 Oct 2021 09:01:03 +0200
Message-ID: <93c99a81d89aafed21e8e22157b3bf21526be716.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/2] mac80211: do intersection with he mcs and nss
 set of peer and own
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 01 Oct 2021 09:01:02 +0200
In-Reply-To: <87bl49mf02.fsf@codeaurora.org>
References: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
 <1609816120-9411-3-git-send-email-wgong@codeaurora.org>
 <b6c96c4ecdf9ec175d7f89e8600fb53768287cc2.camel@sipsolutions.net>
 <facd18458a7ecfc0afbfd06c8a57d849@codeaurora.org>
 <87bl49mf02.fsf@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_000107_449436_9B09F073 
X-CRM114-Status: GOOD (  12.35  )
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

On Fri, 2021-10-01 at 09:32 +0300, Kalle Valo wrote:
> > 
> > Add "__packed" before the "__le16 *" should solve this warning by my
> > understand like this:

[snip]
> > 
> > -static void ieee80211_he_mcs_disable(__le16 *he_mcs)
> > +static void ieee80211_he_mcs_disable(__packed __le16 *he_mcs)
> > 

[snip]

> I don't know what Johannes thinks, but to me that looks like an ugly
> hack. Wouldn't use get_unaligned() or similar be cleaner?
> 
Well, then we've have to pass an untyped pointer (void *), which I guess
is fine? Since we do all kinds of le16_to_cpu() with it anyway, that'd
just become get_unaligned_le16().

That's probably the better choice.

But regardless, would the __packed even *work*? __attribute__((packed))
is documented as:

   This attribute, attached to a struct, union, or C++ class type
   definition, specifies that each of its members (other than zero-width
   bit-fields) is placed to minimize the memory required. This is
   equivalent to specifying the packed attribute on each of the members.
   
   When attached to an enum definition, the packed attribute indicates that
   the smallest integral type should be used. Specifying the -fshort-enums
   flag on the command line is equivalent to specifying the packed
   attribute on all enum definitions. 
   
   [snip example]
   
   You may only specify the packed attribute on the definition of an enum,
   struct, union, or class, not on a typedef that does not also define the
   enumerated type, structure, union, or class. 

So I'm not convinced it would actually *do* anything here at all, in the
proposed context?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
