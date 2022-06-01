Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4526EC433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Jun 2022 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UX29lukSNe5fToTtHR56yU+Hzf139WTteL+8w3BKBnE=; b=VshTKCM83aUgVN
	TFY5o1vhu3dtTkbXQYXvj8/2cxMae1ZW1UIDWqIN80I/uI7kwLxPqHC55sUK9fKdFrLOfVlRj2vV0
	SZTCGZHlMuifmxnUVhyoONakljIU4mrSf5xyiwEWVTiQ85G4HXOo9OA6JX+qoFeIdzW7aeAHVlfb6
	vDU/9pJaqsLOxGtWon1eR97pWLnWdsZJJMFdhCk5//szR1pUftFG/G1a0mpTD+H8qebBOFsRuZAUr
	JRFCA69aAoqQtvg4nBcdQDmEyQJC3VUzrLVl1folgeZCuUJjXRImaAPYyERE6W+OGF1GfIdXUGz6z
	rNWeNScWl2+JseYNy2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwHhE-00E5qj-2I; Wed, 01 Jun 2022 06:19:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwHhA-00E5pO-RY
	for ath11k@lists.infradead.org; Wed, 01 Jun 2022 06:19:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 964ABB817DF;
	Wed,  1 Jun 2022 06:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC04C385B8;
	Wed,  1 Jun 2022 06:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654064341;
	bh=ahMPCuEzja98C3+MLmZ8Jd2FzggqehBUIJvPVQ7VFrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ieofgAtaeXVEwHv6/xMMfC6LsZGlRXwgU0WGN63NxOW68KVRKcw4oginLBIbr5qH4
	 m7vVoN9aTHIHG9EbdYuohnVVGVATwWnvCN/eMQCb1bEjoFLGHFx2eqvKjlWiDeYEh6
	 yLUWs4PDlORmjhqDWyLOQLSjBEL6a43PiE1N3m3lJGaPz1DfEM6j/E4/mmY9R04I1t
	 eHMxJI1toIpkbpc22UbZWqDTcc5rTP0q7L1yd1pPkoeub9dzYXH4mKMiDnrzvoJ+on
	 O7+F2Fulig1h2+l2JQqyoyHNTaD5QQQpt8RXM9m8slxSoYUi89TtP5BviEILphwfiM
	 wfteuSsgHI6Qw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] ath11k: fix missing skb drop on htc_tx_completion error
In-Reply-To: <cfb03aa3-1a98-8131-0090-93c8ae918e7f@quicinc.com> (Jeff
	Johnson's message of "Tue, 31 May 2022 13:32:18 -0700")
References: <20220528142516.20819-1-ansuelsmth@gmail.com>
	<20220528142516.20819-2-ansuelsmth@gmail.com>
	<cfb03aa3-1a98-8131-0090-93c8ae918e7f@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 01 Jun 2022 09:18:57 +0300
Message-ID: <87v8tkoqi6.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_231905_063062_51A018F2 
X-CRM114-Status: UNSURE (   8.86  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/28/2022 7:25 AM, Christian 'Ansuel' Marangi wrote:
>> On htc_tx_completion error the skb is not dropped. This is wrong since
>> the completion_handler logic expect the skb to be consumed anyway even
>> when an error is triggerer. Not freeing the skb on error is a memory
>
> nit: s/triggerer/triggered/
>
> Kalle can fix this when he merges so no need to post a correction

Yup, fixed now in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
