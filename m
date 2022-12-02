Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C79CC4332F
	for <ath11k@archiver.kernel.org>; Fri,  2 Dec 2022 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWOuYRewjHFGmfe15vPkQr0Qq3JafBPqARwWW/SCqGc=; b=vL/bkFaBpqwo8t
	cxgdevYr4YR4UjUNjkYWWnHVIgpltPDqovZtdGp5R1xQBjQsuz8ZjyeuxCDVNarkDujbwnEdCTsEp
	NA7QNPEkicPidTkR+3/vUge8O52oeFNR/gp6m3CVlw0lDVOrrDCxWClYgulFIHPtUUQYy42efB7Wz
	Kef8OmCK7Zw3/I3IO9zYgELjnwYE2cwq6wd3+PHnxzZHKlf2cevlwixvWH0HRM5FpK/7jQwkx2+sJ
	ROYG+NOYGSn27auGcOl3cTGuA47b1a90BUsmbKPzq8dlJhmr1zrU8uv46kqjYxlCidaPBf47qCxaT
	4HQOb9yBTnnH9b75D3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Bep-000yZj-5I; Fri, 02 Dec 2022 19:25:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Bem-000yYp-7h
	for ath11k@lists.infradead.org; Fri, 02 Dec 2022 19:25:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA62A6204B;
	Fri,  2 Dec 2022 19:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350D1C433C1;
	Fri,  2 Dec 2022 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670009107;
	bh=niygrwuNu2LXyVpVbjfZ+XaxCkwfGwDgvy/CzSUqj0g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UtxFBmSgu1DXB/qeIQqJvddL4RclbJPhoqtlG00cBHMg3R9vzxVGWNf9zL5cESk68
	 nuYs7XJI53icZ2Yh4JUTvvLdVGuisJhdCcdBDYcgD6AZa1Yrc8iZqlFyxM5KGZrSIt
	 kuLDD07etFrGd46zb8CJzuFcDj5GomwjsB9ZjNJWB0WNk0/lMA+gPzrLK9WPTcPLNh
	 4pP9HICiaPD7Z3NihQm3//ZSQEjIO0kNHzkU9Lde+1K7msqo+zATCt63nP5SAy/cqb
	 Lk2JARSItaS2zdmLWfvrnggCaN1Y/dZjRZ75ajBS5RBf0AOko7r1wRws3nvBQmArXL
	 9fSOuzHT81skA==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram R <quic_srirrama@quicinc.com>
Subject: Re: [PATCHv2 1/8] wifi: dt: bindings: net: add IPQ5018 compatible entry for ath11k
References: <20221122132152.17771-1-quic_kathirve@quicinc.com>
	<20221122132152.17771-2-quic_kathirve@quicinc.com>
Date: Fri, 02 Dec 2022 21:25:03 +0200
In-Reply-To: <20221122132152.17771-2-quic_kathirve@quicinc.com> (Karthikeyan
	Kathirvel's message of "Tue, 22 Nov 2022 18:51:45 +0530")
Message-ID: <87o7sl38xc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_112508_333858_229EAFD7 
X-CRM114-Status: UNSURE (   8.46  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:

> From: Sriram R <quic_srirrama@quicinc.com>
>
> Add IPQ5018 device support for ath11k.
>
> Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1

It should be

Tested-on: ....

But no point of having it in a documentation patch anyway, so I just
removed it.

I also changed the subject to:

dt: bindings: net: ath11k: add IPQ5018 compatible

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
