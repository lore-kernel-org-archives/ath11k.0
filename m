Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1632CC6FA82
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xpKy+/D23pwoNSJ+WWx4qpvDzgAaMg9shM04rhfmwo=; b=Ov53I6lb/bQD0W
	IbzoA1RoY8DXZmUR7CdZ/kzss+mCR37sz7C6tMLtjogmgG6SVACQvQBtRNWmw/9mo7ZyYw7XP5UhC
	54jcH/Wp45f/uP7lQQ4oJ6Ic8mNOqGnemy9RrwKsiMGfbYD4+nuojWyNO4+ddgh3W2sDvtmvKSZWe
	vW5/2AHR5EJIK0ncJSyICGMqGMrVkGoWuZ36jxk1GbV9xNufDhtB7CH08WRk6lJYW4Vc9H9/W3F9q
	5pLnDW4ZUyQq/pr6a48lS6HbaewFKvNy/gp68bHguGyqzoC4EQau8o4NnvaqtbbPRrt6yZ4m0712o
	R0gitwvLtfmUHgpHtL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY035-003O0Q-Sj; Tue, 13 Sep 2022 07:09:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY031-003Ny0-IK
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 07:09:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9E60612DB;
	Tue, 13 Sep 2022 07:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AA5C433D6;
	Tue, 13 Sep 2022 07:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663052970;
	bh=x6LmdKaqxICKtVErYgsixOPS4R/RpN+mwZXJAXXX2vY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tyKj5QDtVZ/GeyGAWD4NMT5xR98xuiqJ8nCDqmv4XxCFL5/uW0xs/ckCLcIGAr8oR
	 LQdfSYu1Rwfog0epk97/0l6ck7oZMNqTP3hiwkzd1at8ZyKEv8PGq5jLQ/sqsmkhf2
	 u+t8VmjrlfVL20Gtw/74lOdJRVk161uqbdThb7jkDBlVk1/1NEF6goTpJsKi79R1XS
	 +08aNh1ahi9ujkR9lpe1t8R77/rhmv5lcdQZZiKfvr91l0r8iyjkOrPpSUbDsd2K5Z
	 ngBRaoCiue2VW5Ng6EerLUX4xO8Qz7vvJqsBSC9mfgNgemy15gjADppJXkHBSWm9/+
	 qdpb0SdyloPbw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 00/15] wifi: ath11k: add support for 6 GHz station for various modes : LPI, SP and VLP
References: <20220913051518.23051-1-quic_wgong@quicinc.com>
Date: Tue, 13 Sep 2022 10:09:21 +0300
In-Reply-To: <20220913051518.23051-1-quic_wgong@quicinc.com> (Wen Gong's
	message of "Tue, 13 Sep 2022 01:15:03 -0400")
Message-ID: <87tu5b7ntq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_000931_716035_191246A0 
X-CRM114-Status: GOOD (  10.27  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> v3: 
>    1. added "ath11k: fix a possible dead lock caused by ab->base_lock".
>    3. deleted "ath11k: add support for extended wmi service bit" which is alreay upstream.
>
> v2:
>    1. change some minor comments by Kalle.
>    2. rebased to ath.git ath-202112220603
>
> Depends on one patch:
> [v5] cfg80211: save power spectral density(psd) of regulatory rule
> https://patchwork.kernel.org/project/linux-wireless/patch/20210928085211.26186-1-wgong@codeaurora.org/

The dependency is in "Changes Requested" state so I'll mark this the
same.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
