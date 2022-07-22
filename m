Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E48CC43334
	for <ath11k@archiver.kernel.org>; Fri, 22 Jul 2022 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKcR959e4y8pLg+raFau3KtIwpp2s8+6tgSYn8HdIs4=; b=U9g6SvEdViAliN
	Nyic7PIWRwSJsbVxZ9AX9HFcqShEUZM/0cGoy00CjkdMR0OmVHHUTgwGJ/wIp6MJUJexWtEoYs2TD
	ip4u70Cbbz/Jqs2cvZvFXvLktLGub/SNrLxOm3oi3uze9K/XtJfZXcTOWUGUfgGS+SUIog9RE9ZgT
	ALvsNrS49tRhYKBJqn9W8dCLQUc5+FDB8ODQy8Iun5K4uPbd9K7VA92CVIvm6JBZI+Dokazcx9pfL
	9lPDZUW8X1TPUf+wQp8h+Mtaw0xoSBfOj9GN6H+nFZc3+j/ytb7mtk4rJ3wEkXa6HbopRNI+iHzHn
	DYGVV7ylcrnFgWvyvsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnga-000sOy-MU; Fri, 22 Jul 2022 08:07:00 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEngY-000sO0-MT
	for ath11k@lists.infradead.org; Fri, 22 Jul 2022 08:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=fOgdifvNKN2Ggq7uhtwrt+Fqbi7IrThgIQlfWKX5neU=;
	t=1658477218; x=1659686818; b=BxLjkgJTOHSxPd+2DYs9ejb+TtOzkw1yhpderCn06doZ59F
	ypsDDvD3Uvr+eEiXE0FDn9Dd3IPzvbkZvrK725uFfnET4MuxNbgj6lFrK3tsUC+W1qcmbKgh7pD1P
	wBjiqjKElO73sCpq/mopaoRrjoCYBYOtlrdAi5spG/0GnX9eTKuJi7c3DSikMOAXfEnj6DNXAHSNS
	q/y65Ae4K1IhlxjlW0QHVc93C25xcEw1Sh+BNGkWL+Ay5UK9nP88IbT94xc/fDpj7J3q6DN33VHeC
	q12k7hNQWS/Hna6ojnBVci7cVEMZzM3FuvL3fLItBgOz/7KLkJYj9YN14IMcXXPA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oEngW-005DnT-2d;
	Fri, 22 Jul 2022 10:06:56 +0200
Message-ID: <9b2b7ae17008881d9ee35163aeaa183604f5364a.camel@sipsolutions.net>
Subject: Re: mac80211/ath11k regression in next-20220720
From: Johannes Berg <johannes@sipsolutions.net>
To: Johan Hovold <johan@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 22 Jul 2022 10:06:55 +0200
In-Reply-To: <YtpaQXhM5wuz4Zbq@hovoldconsulting.com>
References: <YtpXNYta924al1Po@hovoldconsulting.com>
	 <0a400422546112e91e087ce285ec5a532193ada3.camel@sipsolutions.net>
	 <YtpaQXhM5wuz4Zbq@hovoldconsulting.com>
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_010658_747360_3C3266EC 
X-CRM114-Status: GOOD (  11.91  )
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

On Fri, 2022-07-22 at 10:05 +0200, Johan Hovold wrote:
> > We think the "fix" is this:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/commit/?h=mld&id=dd5a559d8e90fdb9424e0580b91702c5838928dc
> > 
> > Do you want to try it?
> 
> Thanks for the quick reply. And yes, that fixes the problem.

OK great, thanks for checking!

> I apparently failed to apply all commits from that mld branch, but this
> one alone fixes it.

OK, I'll check later.

> > Note that if that fixes it, it's still a bug in the driver, but one that
> > you'd otherwise not hit.
> 
> Yeah, those warnings looked like secondary issues if that's what you're
> referring to?

No, I mean there are legitimate cases where override==true, and then the
driver breaks. It's just uncommon (I think perhaps only specific
userspace [debug] configurations), but it could happen.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
