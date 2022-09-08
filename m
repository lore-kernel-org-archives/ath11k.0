Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4FBC38145
	for <ath11k@archiver.kernel.org>; Thu,  8 Sep 2022 15:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wM11MgbZbGZJEE+4H91PLu5KSu6USr5XUQAt5yHfxWs=; b=vuHjRAmvJodB+t
	VWNA1cT102/UVgKUWUjCjbIP2AvrMCQnlJtCpaZm7df5nUKhvre4oizLB7FICvxogoS6Kqu19aEL7
	tuZEG0D814Gavto4sfJujNrHE15I/g7t3huk+WFs4dCQzDzNNpGF23EDElF3CKDxUHWj2ItFC5qnA
	Be36Njqhsz/TzsJ3rdL72VyKAa+EgOG8q/u+ZQxthtU+BNw4tKCKocBFO0MLCAnLhMz7qtlwNao+N
	CQjHgYyKzH7j/0Y3EriR9vkqHjpSpk5Bb6FJ/JDefIIX8CtXZuDm4k/GdFYzBoaD9zBDFW8nNkh0N
	0WZs/cQx4sXyFFV7LK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJjW-005NS8-ED; Thu, 08 Sep 2022 15:46:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJaU-005I8m-Bz
	for ath11k@lists.infradead.org; Thu, 08 Sep 2022 15:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=XySWOJ6DXXcakq2HM6nLg5xaD+E0DbvXQUhX/rMLrrA=;
	t=1662651422; x=1663861022; b=wzCH7GlYFOz7s3XMxH+BEnwQRb3wwgmcPUT4fK9StFM9cGA
	cn0LT0eSB8MOPUVvq8pKDYcRMY3ImaqUGYzrW0OUUu7fD5FCGy5lgoEjJiGJ5/23YBT3hjUZrskwj
	zKb8VgBCoJoDaQNtbWFijDNsBpGvnbi2fO1mqEE5v4Lf0rSClI/cCmnRAzwa1vh33tptd6ZMbe/VM
	eHioKHdlhsFkBdMNvbI5i/v6C0QYUVkKyDApm8wMw/sacJ614LlDlDflTJ+DvA2NJgcRPpIxGUohD
	GtSiYltx5nqyzRJDKBDkOJ1ShtdAsKTyhbUYLm5qcqRtS29ys9y7v3YS5OKrjdZQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oWJaI-00BFG0-10;
	Thu, 08 Sep 2022 17:36:54 +0200
Message-ID: <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Thu, 08 Sep 2022 17:36:53 +0200
In-Reply-To: <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_083706_443085_B8A29A3F 
X-CRM114-Status: GOOD (  10.67  )
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

On Thu, 2022-09-08 at 23:23 +0800, Wen Gong wrote:
> 
> Now I found it only active the primay link(the link for 
> authentication/assoc request) in my station MLO test,

Yes, that's intentional. It gives the driver choice about which links to
activate; first of all because we don't have interface/link combinations
stuff yet (waiting for your side on that), and secondly because we might
very well (want to) negotiate more links than we can concurrently have
active, e.g. a NIC that can have two active might still want to
negotiate four and switch dynamically.

> change_vif_links of struct ieee80211_ops *ops of driver will only be 
> called one time for the primary link.

Correct.

> it means only one link for MLO.

Right.

> I plan to revert this patch in my local test now.
> 
> Will you implement muti-links later?

Yes. I have patches pending to add API that the driver can call to pick
the active links (as a bitmap).

I'll send it out when I can, likely tomorrow.

johannes
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
