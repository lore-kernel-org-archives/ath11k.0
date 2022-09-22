Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D229C6FA8B
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ami8+8sNnSsRa0noLO/B3v1aiParM/JjPspbFClkWc0=; b=RCkbKXkvw4OJEO
	pEaujS/fas6VwRS8kGjv4OUJj2M4rHhskHbtQNK4HdDKTZFew7KmCTl5E/0+lZr2Fxu7Atsb4BjEu
	nVo0pjBaSkmUhA+/0fAj+WPtXzUI94a72prn53g6oUmS3jAyaOCaNgi9YgZcuE+J2wPUfsEwZtXYw
	nVsN2M860Rw99pwTcRVBr5qg7GTh8Z4O6y7R1NWj4bZ2zE7zeLxhqO8ecfYq/1X0462dXx/O4/ArY
	GHR9l4HDs5KHg1dER6s9otWLw98Kz9vwqVVYoKuPEhA43yk1d2h/mNRoXrI+6WhT9zUXGLVBYNWIc
	UylGV1h/DyH77OMnDrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGTT-00Dld6-Ha; Thu, 22 Sep 2022 07:18:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGTQ-00Dlbr-Oc
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 07:18:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 299F8B834D4;
	Thu, 22 Sep 2022 07:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8C9C433D6;
	Thu, 22 Sep 2022 07:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663831093;
	bh=LczCGyYUtgLHBheWTd2v0OQvFzS3TqRlUwYWCvFwhis=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=b9IHPC/jDIKu3a1VDbmH1Jxz6eh4p4pHjK/jd8XFyvGl7wdMcUnF1cCiQpY44EIT9
	 H34rNIzr8H1b9xj/N3rj9zEd4NWtd51CGBd3/LqxbfKCpHtttKSV6brPiVpiiEoJc0
	 q5luePp66qRDtBvujzZvfLQJKNho2bNbwReYV+/6PVjd+5Mgr1i4OXGcXHFsEQU8ch
	 dMsD0uObbyZYwHmVTWIHAF8clhTVcPt2Cu1nby4TgwB57e+l1ytYTxkA1e0tGx6ZrR
	 70QZH9Wx52pz3BUeTzM0R3SwI+pH9NQmdocRNcNKVn3frV7x4bIz/IuN43LsF/brSA
	 b0YZHkV19TrTw==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: reset pointer after memory free to avoid
 potential
 use-after-free
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220505092248.787-1-quic_wgong@quicinc.com>
References: <20220505092248.787-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166383109059.28267.2524811686657433761.kvalo@kernel.org>
Date: Thu, 22 Sep 2022 07:18:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_001816_975797_0654BBF8 
X-CRM114-Status: GOOD (  11.01  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When running suspend test, kernel crash happened in ath10k, and it is
> fixed by commit b72a4aff947b ("ath10k: skip ath10k_halt during suspend
> for driver state RESTARTING").
> 
> Currently the crash is fixed, but as a common code style, it is better
> to set the pointer to NULL after memory is free.
> 
> This is to address the code style and it will avoid potential bug of
> use-after-free.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1e1cb8e0b73e wifi: ath10k: reset pointer after memory free to avoid potential use-after-free

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220505092248.787-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
