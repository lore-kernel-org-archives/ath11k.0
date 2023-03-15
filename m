Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B8FC6FD1D
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+GMlSeZHUjbVQSPm1h7RfbUov03c8LoaJ9/IN472IA=; b=0Y6OMl4NMs7kUk
	MQ3ytLJHBevW5TpsXrG78PK8DXoDhk3V1GPCFMztmjJwG/H9Mb770iZWM4oEhMXfmrRJOfj+Ghks8
	BzG/G3eFIvEP79s4KO7nEKAoQNhjQWeFbwgYq1fPtVGRsOLkmD4cjsvyh/RBCpwodsJJWHlWOJX1h
	Jut+fVcVod3Ut4C4yfD4gpNDqI5HHs1Sx/2myj3f/L8kPLhfmIJXbi+69IcAsF0umCnlrpIRwTyvJ
	WZxvZJ+b2tlea8MCAAsaP0C4oqkcU08q+T+0jiCotpQOPRJ5KkgZ5oEJRjWka0i2JAdRy6GYY7TDJ
	mPTGp+AJtWSqdO27DK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOM1-00D3pV-2P;
	Wed, 15 Mar 2023 10:27:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOLy-00D3op-0l
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 10:27:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 18A53CE1990;
	Wed, 15 Mar 2023 10:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4512C433EF;
	Wed, 15 Mar 2023 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678876045;
	bh=Y6n/TXu8hh1tM4ooccAelO2vPTAVs6rYcU/FOUxJd2Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AbW51TSNj/x02XvINBt9ghexqeg5sfuiETPhUxzEHLcEE2U4GIWQaJPzoienCR4+4
	 pMkPl8JeED9gA97FRULajBOvZW2iip2ivUx1j6AKiEcRRThd8HZlFZg2DuOS+R3qN+
	 oU0p/SkGH/5WVL96wqsJ+KAWwi/F5S9OjNKgaLi+wxpAUMEiYeXn5g+DX60lAGQQ0T
	 RnvDnzctLnUdqabnF4Y50QaftMFYHwhZD3zI/5qeXfrIVaFtgrztPsax1MaD36y+M3
	 xpwmEZmXI4rNCfWmJ/sZwin4mo0rFZNAmj/VC6JX3fAkP3TlGOScKvj7lK5hhQcQqe
	 aGY+2mJELQ4Sg==
From: Kalle Valo <kvalo@kernel.org>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath11k: Fix incorrect update of BCC counters in peer stats
References: <20230308174703.12270-1-quic_pradeepc@quicinc.com>
	<20230308174703.12270-3-quic_pradeepc@quicinc.com>
Date: Wed, 15 Mar 2023 12:27:21 +0200
In-Reply-To: <20230308174703.12270-3-quic_pradeepc@quicinc.com> (Pradeep Kumar
	Chitrapu's message of "Wed, 8 Mar 2023 09:47:03 -0800")
Message-ID: <87mt4emhrq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_032730_617795_7F0C2B40 
X-CRM114-Status: UNSURE (   7.10  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> writes:

> Fix typos causing incorrect update of BCC counters in 11ax mode.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

What are BCC counters?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
