Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827CCC433EF
	for <ath11k@archiver.kernel.org>; Mon, 18 Jul 2022 07:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Xa7qdmkQyvbC6LETfGIpy5zG+jVIBf0yj0cWpjLnaI=; b=uJG2MsoDkhR+ZI
	IlJapuelJJR+6yq+WWC5QG56cHmeCLA0blXJFjPap6WlCD2v0/NSocXCiBJmgDQE6LfeOwlpoiHzN
	m/7stqajI5746mJgYM8eI/fLkwngQdTgXLDCyqpK5gQPLFeLB1aX8T1vii5i3Gh9clKiXHGlyBUCs
	M7dZLIVThm3ymusn7c9F1yPE07lBfP3SFidaezlV5TcBlMUCnPqCGS9Bo8cMouBP4gkOqAZ2HTYoG
	JfRoKekbBO6bJlqty8Uzc8d8scGVI2kYVHxIZEhORvvgwuWsCov0FqpJVsEcC0pwYA82lCeOx81SB
	xQSirUqFzB+sBfLijFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLES-00BUUN-DL; Mon, 18 Jul 2022 07:31:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLEP-00BUSq-G2
	for ath11k@lists.infradead.org; Mon, 18 Jul 2022 07:31:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7335AB81018;
	Mon, 18 Jul 2022 07:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABD2C341CD;
	Mon, 18 Jul 2022 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658129510;
	bh=g8HAlHQeDhXpBJg4ov/0sp2aRCVUjeBdLioC9+VWIGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tLFu3ymiJ9zL/GML01HMxRJYqOS8Pz98comtGav+S9YADg0X06YVGBpmoHr8TcCmZ
	 ltyLuJhEFaow+6yTDQrgSO5uQXg3kUhTzkb1oB6MMwxHGhQiBXuqQ33iVaEnAgavP6
	 0QVfb4xfVtc9CDvypuLiasCPZbi0XXnuaXBBr3tHUNsDDgKROQatxEwAECEXQbvwIn
	 AzcOYBx/XC4rsPb71ngUGFsfmJP3LS1DJ/46bIWvPdh8aKQUE+UB9Jh41spwIcPpSf
	 0mVbjPIXuuPxvxsAYgR/kUq6amuXaYPaMI5LEdjcq4TA8KMnNTMftlS9XsBX2Fj1l+
	 Ou34IHBRbZH/Q==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  "Maxime Bizon" <mbizon@freebox.fr>
Subject: Re: [PATCH] ath11k: Fix register write failure on QCN9074
In-Reply-To: <fc902e10-9d99-d272-84bf-87450678982a@quicinc.com> (Manikanta
	Pubbisetty's message of "Fri, 15 Jul 2022 15:40:41 +0530")
References: <20220608062954.27792-1-quic_mpubbise@quicinc.com>
	<87wncesne8.fsf@kernel.org>
	<fc902e10-9d99-d272-84bf-87450678982a@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 18 Jul 2022 10:31:46 +0300
Message-ID: <87r12iswpp.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_003153_722574_E1E477C6 
X-CRM114-Status: UNSURE (   8.23  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

>> I refactored ath11k_pci_get_window_start() a bit, please check my
>> changes here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=95094045d7f467aa8928307ea538d1fd9d15a239
>>
>
> Refactored code looks okay to me. Just one comment though, you may
> probably remove initialization of "u32 window_start =
> ATH11K_PCI_WINDOW_START;" in ath11k_pci_window_read32? It is removed
> in ath11k_pci_window_write32.

Good point, removed that now:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=70fbceb8841910a2af9a392a6b1f4eb53c3a6716

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
