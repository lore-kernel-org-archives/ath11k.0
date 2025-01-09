Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC00FE77197
	for <ath11k@archiver.kernel.org>; Thu,  9 Jan 2025 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lapxNiPzy2o4jSpCSG5SFbEXFWYixPPzLFx2jpoyoVo=; b=4ZXNLqPEMzJLDwV47FOYoRS2uZ
	7XeqDCsIszhMWAEr4ydPlVH4tebW7CO//JePIdAZL7WvJg4E7UHVJlQW0mujO5pgJSQOdCYmuyupn
	aYqZnkS/IB76jGG6y3YfNYOc/aY3kk3gCErb/ZA7q2XpavLjkEghU2guOK7ebvhqewqnnwEPdjlyT
	JcDefW56DDdXYdUBBJ1Wq4m0qSuYIUrTBGH7rw5Un9rSWQEFfq6ypey9rgYfU+fbXvOYFjSg8kkoU
	N2KTS0YRDhMSepXnZzBxiQQoJdWfUM2skLkhSKCvsDTlNJ5vS+SHh2bj0n8pHPBN+H/JLxulP31o5
	Thrk2tRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsX4-0000000C0ml-1NbI;
	Thu, 09 Jan 2025 13:25:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsX2-0000000C0mK-1M87
	for ath11k@lists.infradead.org;
	Thu, 09 Jan 2025 13:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9E1FA417C0;
	Thu,  9 Jan 2025 13:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363BEC4CED2;
	Thu,  9 Jan 2025 13:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736429103;
	bh=LhdUenZrd6/uD68Zn3fDML7StxjZY1azKu975pcyTlM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kSAJyiidkUN+I7EtcEH9S25xznCQ9o6SNVWfCRh6yvXBi53GSeTDaUHCAAS8iicty
	 j4lWYkQ1ixn9wJNO24AckOdYL/J1RQc2d/2n+e2Mb/nZu1xd/wdZEoBfefrHX5nPCu
	 PuRMOE8hoIL2shSJPDjw+Xi+53lf4w2PGUIFFUuj97kWKLhJK0XAtyuZF9vtBNeyuL
	 F7dYapeXRc+wXpxx4YfRaAL9JNYnj/LsJopkbUixqh9rMwPD4NNFMEjPTTLUgWApwt
	 Ag5v/KzR6t2LdlviKcyEm9DQlNwceKnN8RuulX0TT6QOICrRJZ1yXwrJz1admu3pd7
	 cpMGk8JQMds3g==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  "Steffen Moser" <lists@steffen-moser.de>
Subject: Re: Potential Broadcast Issues After GTK Key Exchange on ath11k
 with IPQ8072A (QCN5024/QCN5054)
References: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
	<Z2Q9POuV-6MIdzRf@pilgrim>
	<b18ede18-0c33-4d14-a7c5-0066cbec39c9@steffen-moser.de>
	<D6VX7M6MGZQB.3LU3FBYJK6CZH@gmail.com>
Date: Thu, 09 Jan 2025 15:25:00 +0200
In-Reply-To: <D6VX7M6MGZQB.3LU3FBYJK6CZH@gmail.com> (Nicolas Escande's message
	of "Tue, 07 Jan 2025 15:45:52 +0100")
Message-ID: <878qrkdsr7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_052504_448941_94F49AB7 
X-CRM114-Status: GOOD (  14.07  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

"Nicolas Escande" <nico.escande@gmail.com> writes:

> On Sat Dec 28, 2024 at 11:13 AM CET, Steffen Moser wrote:
>> Dear Remi,
>>
>> thank you very much for the pointer to the patch. Sebastian integrated 
>> it into DD-WRT. Now the DynaLink DL-WRX36 runs absolutely smoothly, the 
>> WLAN links are stable, the packet loss is gone. No weird states anymore, 
>> independent from the group key exchange interval:
>>
>> https://data.saps.uni-ulm.de/index.php/s/NLNpWqjc8iGsaEM
>>
>> So your idea was a direct hit! Thank you very, very much. Several months 
>> of debugging have come to an end...
>
> So this is at least the second time this commit breaks a setup.
>  
> @ath11k why isn't this pushed to mainline ?
> This seems to be a clear regression, so even if there is no need to rush things
> in the long run this still needs to to reverted mainline right ?

Good question, I don't have an answer to that. Could someone (also
outside of Qualcomm) send a proper patch ASAP so that we can solve this?
And it's good ot include the link to this discussion and describe the
symptoms the revert is fixing.

This is the patch in question:

https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-the-keys-properly-when-DISABLE_K.patch

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

