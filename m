Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FD5C77B71
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxqiUrF0is8UXtX4W8SZX8mMChwUWrHl8P65kh6f70Q=; b=ZGcs2klJcwv74l
	hGdc+z5Ox0KlOorE5LOSi98il2fs2lsoJjC1BH4LP8OZvXAFqwMk0H9ysOhfb5SRi9rY9FnXemDiO
	b/AXJRikJJglm5dsO6f8rmwv8ZztQAeK0iARfimVhNY92u/jILKPRzzvmez3CmUCn2OddurQRxNiV
	6YIZ09N38+HeMAzzS7IbvIPcxGOm4BkB8Q3G7Z2kPYaV7u753+xWlH/mgtnqn4xPHLwur85COPsVb
	8IKMMurGs+iPtIXVKi4FBbevGk48tnI7RlHjXbfzsxarAC6khDhxI72kWl6Ef4sYQNuhNBGIvOUGy
	Z9I0r0Qzsf3RPKvAXkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pois1-001qkN-2s;
	Tue, 18 Apr 2023 10:47:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poirz-001qfi-1b
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 10:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=/csC5oligwgCHuhjaAQOiaxu+yPfdLjep1iACpZYgqw=;
	t=1681814848; x=1683024448; b=b2JxfNavXBMTLiIqd+MdQSEIfAGk/XcaAQk+WFh7cAzvHUT
	7P1qFVAUTqLMgqinJ7B/Xm4ibRU4bqtBQGpryURK1g5NRd6TDE9Ds0DITyd3Re+TG7coP15dvNKf8
	DVO9q5jJCwWT455K3x27YHw+HH1LdoCkACSwGweVxXfsd6W2cnoNNWNDX01Yj8ciFf8UxZrEKoXFP
	o4BLAnnjnhH5XV80++Z6cOJdwIa+bktEJNOsddU5Pio3RYpJd+rG1vKmC3EDy2A4OYPNIEL0xZ0Lq
	2tq4YQTNxQdd/jJI/mmgXdV406gnPndR+I47YeIT1z2DwNLTUD3OMzvolOrRgkhQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1poirr-001ae2-1q;
	Tue, 18 Apr 2023 12:47:23 +0200
Message-ID: <2f06c800c45e9fa1291b83f4b54bc82aca7a5d67.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 12:47:22 +0200
In-Reply-To: <5bd1776e-0691-d0a8-d198-e5b4ee676494@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
	 <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
	 <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
	 <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
	 <91577d586475d290e08dee9e535cb6b4896e06d4.camel@sipsolutions.net>
	 <edfc26b5-f6d1-2ab7-f3cc-60a74c8c334d@quicinc.com>
	 <61268d31f8a6dd4eea10fcb6048d39244bc584e2.camel@sipsolutions.net>
	 <870ce439-85b1-f02c-70e5-2d424fd73372@quicinc.com>
	 <34ed0938b69ead648da1aa250a2e081054fb49d4.camel@sipsolutions.net>
	 <34212873-0b71-7f39-b064-6b50d8e514b4@quicinc.com>
	 <09b156b1ef05377ca7fa0db35e8e13beb5c60e2c.camel@sipsolutions.net>
	 <13980456-11a6-384c-7be2-63c005410267@quicinc.com>
	 <ab8f9ed0f04873cafb81cc1c9f5d5c804b146aa9.camel@sipsolutions.net>
	 <a371eb4f-7d79-eeb4-5208-f9a342798021@quicinc.com>
	 <949040e5e573acef1a56269983a0e930951986ca.camel@sipsolutions.net>
	 <5bd1776e-0691-d0a8-d198-e5b4ee676494@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_034731_532946_EC29C0F0 
X-CRM114-Status: UNSURE (   7.43  )
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

(removing HTML)

On Tue, 2023-04-18 at 18:42 +0800, Wen Gong wrote:
> 
> > Why, then you can have an output parameter for the address, and call
> > it
> > in mac80211 wherever it calls eth_random_addr() today, no?
> > 
> OK. Got it. So it is like this, right?
> add_link(struct ieee80211_hw *hw, struct ieee80211_vif vif, u8
> *link_local_addr, unsigned int link_id)" 

Seems like that could work, yeah.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
