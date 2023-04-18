Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD4BC77B71
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9Lf2tvecO62r1Hm5iDHlHlSx50CVNoYpWpRH7eKe4U=; b=Zi75ChrEJ9nQm7
	wfdOou0gWjChSMyQf9/f2AGtJNXEUGyn08SFULRHsaxD+1anSCaLmgz1imD0g2WVjwIhYuLgIt9J4
	IJIZnrMbDTMqaUz3vRy7O/r8BOCHvoH85fK5Kv63Av+YrNbA6dmOkes+vsWv36j9fBEcHtDmSzfUM
	OhK1XDm772v949LdiExc7okiXH+r92ZkMrGFibhCtFNFNvGx5EJR5ySkhuU99lPvY80qQA6y8X/zH
	UNRA2NOlNRkZqgV8CdH9Xiea5sM/jmw08qYD/K63i8Ka5vC88s3Ht1ZxVMpszt9xfd87WYDINX8ZR
	UM8xUuw79Rzhv4rCST+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohg6-001Tro-0A;
	Tue, 18 Apr 2023 09:31:10 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohg3-001Tpe-0F
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=RKCPiQ8s8a40opzsPjb7+5NDfVGuNLfOkCTKeMQ2G24=;
	t=1681810265; x=1683019865; b=Reo0ffEO/14qAnLHSPfEEfopm5SgLegLoZiqhocWGMh2R0J
	qSyOteNQk6FnBtsVQQ3mVAQU7BiI1CZ4u1Q/2rETCrZl6VLzk7Gt5qyWnOws2Zyue2ECSbW4n8Oqa
	IoGSkSqpydSJiAqUOuKeJf00BpnMYbBUDexOoZHBFImWXzT/lXk9InkSv3+BtT4fnxPUDBNOAmLoF
	rZZWqR47OBwMZbqTGXu/JOxiDEtlQuIgLwRH1JT9zNkvOvbyrbqUYJvA7HKPSotRXEMdPy1qJn7YE
	FwBh8ToVwm8IprMrP9X4d3V3zwo+eqEsf+4BZioUS91FO0hljLjyoknDHYDawBvw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pohfx-001Z6k-29;
	Tue, 18 Apr 2023 11:31:01 +0200
Message-ID: <09b156b1ef05377ca7fa0db35e8e13beb5c60e2c.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 11:31:00 +0200
In-Reply-To: <34212873-0b71-7f39-b064-6b50d8e514b4@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
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
	 <61268d31f8a6dd4eea10fcb6048d39244bc584e2.camel@sipsolutions.net>
	 <870ce439-85b1-f02c-70e5-2d424fd73372@quicinc.com>
	 <34ed0938b69ead648da1aa250a2e081054fb49d4.camel@sipsolutions.net>
	 <34212873-0b71-7f39-b064-6b50d8e514b4@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_023107_112422_3A4D3FD1 
X-CRM114-Status: UNSURE (   9.65  )
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

On Tue, 2023-04-18 at 17:22 +0800, Wen Gong wrote:
> 
> It should work, I will test it later.
> 
> For the 1st assoc link, the data->u.mgd.assoc_data is empty in 
> ieee80211_mgd_setup_link(),

Yeah for the first link it should work.

> because ieee80211_mgd_setup_link() is called from nl80211_authenticate() 
> for the 1st assoc link.
> 
> So ieee80211_mgd_setup_link() use eth_random_addr() for the 1st assoc link.

Right.

> For the 2nd link, ieee80211_mgd_setup_link() is called from 
> nl80211_associate()

I don't think so, it should only be called from
ieee80211_assoc_success()?

> the sdata->u.mgd.assoc_data is NOT empty,
> 
> and the sdata->u.mgd.assoc_data->link[link_id].addr is valid,
> 
> it is addr by eth_random_addr(assoc_data->link[i].addr) in 
> ieee80211_mgd_assoc().
> 

Exactly, so we've already decided on the address long before we actually
add the link data structure, so your callback would be much too late.
We'd need to have it called from ieee80211_mgd_assoc() already?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
