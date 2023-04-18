Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0905CC77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YafVRrI9fys5pEqIkut+QGEjJ2m+qkggzd+5Is1GlQ=; b=g/+Y6Fio3RRMp7
	evXhVLn2DQ4wMP35wPfTS98tWUcRlyz2rIU2XQLl3TOcWB1gnB94slT5rUcnOwl2YXPoLY9qjKtLU
	nB10gLxjivFErAeSB7XZmPj5iA/9ItX8aRW3ELaDKA+QyBPbDlx//034481KjlvavQGmIgOkCcfnB
	QU9klPHT1p1tqyR+laSuMCmD92ML1w9xm27Gr729ThiI0xAVVMVS8/m0G5cp7PoVHkC8Ny9WYWP8O
	9znjNyoBIwsQZt+eY7AAT+RkdP5YnVKSGZREeGOM4A5HuZdvwHZAfF1cYcd0mMLOPVdp8cQWyIjP/
	JdafzFDiHyN5IgBbMKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pogV6-001HdW-34;
	Tue, 18 Apr 2023 08:15:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pogV3-001Hcm-27
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 08:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8UW6ybr3e1Cm4qPC9xrTWnDCBJ859mXH3+qyEx+8l3g=;
	t=1681805735; x=1683015335; b=iwS0/eCivqeBMBfIyXEEbdX8UCBGA5/vvHc6EFgBA8b4gbx
	GvQXiLfaeR8wunG7lUvbD7+7JntbpMJG8gy4O1wX3vJ5tb7LlPDJMAFitO6OQsj8xKAA9zTING+BC
	XMJohcXg3noA2O1D62cGf6UKICBGiWVb0tNIMGTlAlXAAVd8fUoOpiZUtWaZ1GJ3vx66POWbmCTCu
	3HJieeQggD3qdoNTSvDMM8SvuI4hypeBi0XCpdyf1Iy3AEmQionLYHH0lluZe7m0PWPXWm5DEACOo
	WcCe4hdCSHqDSr4zsd4cOCQXaLjyMFoRHWnVgwtGhwgfT8/+cDIZtpq38KGI5qmA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pogUr-001XWn-35;
	Tue, 18 Apr 2023 10:15:30 +0200
Message-ID: <61268d31f8a6dd4eea10fcb6048d39244bc584e2.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 10:15:29 +0200
In-Reply-To: <edfc26b5-f6d1-2ab7-f3cc-60a74c8c334d@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <2de44394-cb93-7be4-481f-2d92788b8d28@quicinc.com>
	 <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
	 <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
	 <545227cf18baac94ea8aa24dc08b250c47949541.camel@sipsolutions.net>
	 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
	 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
	 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
	 <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
	 <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
	 <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
	 <91577d586475d290e08dee9e535cb6b4896e06d4.camel@sipsolutions.net>
	 <edfc26b5-f6d1-2ab7-f3cc-60a74c8c334d@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_011541_696918_09D3604B 
X-CRM114-Status: UNSURE (   7.31  )
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

On Mon, 2023-04-17 at 22:07 +0800, Wen Gong wrote:
> 
> OK. So I will try to put this in mac80211 layer, is it OK?
> 
I guess? I'm still not really sure why you even want it, but hey, that's
up to you in a way. I really didn't like the suggestion with
wiphy_iftype_ext_capab (or any other capability for that matter), it
feels like it should be more dynamic, like maybe a new "add link"
callback or something? At least then you can't blame mac80211 for when
it breaks when you have two 5 GHz links ...

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
