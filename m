Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B52C433FE
	for <ath11k@archiver.kernel.org>; Wed, 16 Mar 2022 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBqaZXgmISOqNHjXJNntqdoqxhcpsUuyP5ZSA1yztwA=; b=KKngjMkWsOhWWz
	xHl+oJ5CBIXxE6nSPJKSm6kYpQZBGF2ur6oWtjitJ5PDTjxxDD6icoi5jESm79Osu+FpeYqYrHAo0
	MScjoP2qa8+7u5/xyDV5Bdcv01MmBsb2e2M7C/Vbutdx4bRbI9EQSrskwHwvRC8KxewFJMCcjIO72
	wKJqg4KXUz8V1NmtTJJwXhk1rQ6x6D5nP03T1Gx0ylWikdPSFu5pELQWukQcFQp/onNzhTMNgMu+S
	ex+SZyd81raqoqRPgzOuopP0OpTD4HiZBlPCSG5g/rKGiDORSUfjwKJxRdwYkrJm6S18lp1RmrGew
	lLUvDTd46jWOmoxsElJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUjM-00DHZ1-Op; Wed, 16 Mar 2022 14:34:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUjJ-00DHYC-Sr
 for ath11k@lists.infradead.org; Wed, 16 Mar 2022 14:34:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C5F86155C;
 Wed, 16 Mar 2022 14:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB08C340EC;
 Wed, 16 Mar 2022 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647441264;
 bh=C6Lt9584D2BMdQ1sVehnMgWojMQ5SjZCZ4NdyebLiF4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=YEM9vFhKhtXshQrnM7ZeKg9DxMJc9lMJoAro7+8VXwTxKh1CsqXLzygtmnvQjHVg2
 7E6akZwNFhl16IHbfJYKg0sEvdnd6hKIVLHKHYPPbUaW43FGFwlVVitr9Nc++AAX0A
 +89sj+BIzLV33KqUT4O38CnBKnicQKfEgasHxnBYInRq+kjXvna++VO0bgMX2fnDqo
 xnDl+RoVONXz6RFWCH+BgP79mahYfZrB2YtI4592cVxy63AJgbnnZ0c1vLq9M+sZ+B
 vd7RtYozOBL9seevfR3nHxWzPAtxtTlUZrKUb8AX7AzR51FY6OHa/QHhUcgT6KEeoU
 xi0jTcv2rzLtQ==
From: Kalle Valo <kvalo@kernel.org>
To: Niels Dossche <dossche.niels@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH] ath11k: acquire ab->base_lock in unassign when finding
 the peer by addr
References: <20220314215253.92658-1-dossche.niels@gmail.com>
 <87o826pgqr.fsf@kernel.org>
 <c0874b06-116d-7471-3b50-21099c729c3d@gmail.com>
Date: Wed, 16 Mar 2022 16:34:19 +0200
In-Reply-To: <c0874b06-116d-7471-3b50-21099c729c3d@gmail.com> (Niels Dossche's
 message of "Wed, 16 Mar 2022 11:43:30 +0100")
Message-ID: <87k0cuotjo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_073426_015904_1169EA2F 
X-CRM114-Status: GOOD (  17.28  )
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

Niels Dossche <dossche.niels@gmail.com> writes:

> On 3/16/22 07:13, Kalle Valo wrote:
>> Niels Dossche <dossche.niels@gmail.com> writes:
>> 
>>> ath11k_peer_find_by_addr states via lockdep that ab->base_lock must be
>>> held when calling that function in order to protect the list. All
>>> callers except ath11k_mac_op_unassign_vif_chanctx have that lock
>>> acquired when calling ath11k_peer_find_by_addr. That lock is also not
>>> transitively held by a path towards ath11k_mac_op_unassign_vif_chanctx.
>>> The solution is to acquire the lock when calling
>>> ath11k_peer_find_by_addr inside ath11k_mac_op_unassign_vif_chanctx.
>>>
>>> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
>>> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
>> 
>> On what hardware and firmware version did you test this?
>> 
>
> Thanks for your reply.
> I am currently working on a static analyser to detect missing locks.
> This was a reported case. I manually verified the report by looking
> at the code, so that I do not send wrong information or patches.
> After concluding that this seems to be a true positive, I created this patch.
> However, as I do not in fact have this particular hardware, I was unable to test it.

Ah, I didn't realise this. If you are using a tool to find errors in the
code it's always a good idea to document that in the commit log. I'll
add an edited version of what wrote you above in the commit log, ok?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
