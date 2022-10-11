Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3AAC433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zV4uvbGmsUV3qA70M9o3aPx6wh5E/F8BW+O8eEQ/VEg=; b=dBDsh7rYGqt8L/
	t1qlPLKoHcsoqMkfmzPjutr3600wi4z8q9DUXCVD10nR9SGmGAYgafOqWLxczZyJIO9sUnp+DVyGD
	N51YiXJ7FnFmYv0dBoeu3czF90iMeSVMsEhzDjNTNjBIHRgFksYnnqpPwYyFWHMSeIc6lqJRcwrw+
	HurPvL44c0YhF83zsmwVN8SelC9Ob30EeT0XSCyyNjZjgGQ1CEoEcLSvKlwGfLMXJ/4f9JWYe54kt
	78/tmNLAXen2xeXCcEhZQ+WJGO5sg8CueqJbZG46TDI8KIUWgcBumPodXyV5aX3VBu/HLiCcXSKYT
	NCR6ZISmh7mff0lG7igQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9tE-003cHJ-IK; Tue, 11 Oct 2022 07:41:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9tC-003cGz-8M
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 07:41:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B21F7B810CB;
	Tue, 11 Oct 2022 07:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A73C433C1;
	Tue, 11 Oct 2022 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665474079;
	bh=eZLFPz9jyULlRshtRhiac1HlUMwUZ+tJMhu0+WfBtuM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W2hguDYnF7ZN1qEErnaPXeJVrplGvzoxC9Cd8an0K8bQTHUFGlR6nTqU8OuR2xz7+
	 dgMjDUV6AUffPHK0AR6Dmy7jpAhrZoHLs4TIIhrCIbo0sh/dW7Ds1oz56ivbI1peJT
	 ex93zS96QKGcTvkK7LON5ruryrFC4lPo5oFlMItF8IJ/hY1GwD5PwuFvN9GiNTIO1s
	 TLlfeUi3Lveqaw8Lm7fZCsXvNfCjfY911mpYn6H6Lx/jJSE2qWQIQzZ3Tee4YWV/Sp
	 4Kma3Oc98XWl1pHpOsqH+SbUkFNSbrw63LXdbNTYyNkTWZ8/zdUpXEKXnlwxbBkUc3
	 jXP6BIz6ySVww==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH 1/8] wifi: dt: bindings: net: add IPQ5018 compatible entry for ath11k
References: <20221006105913.18356-1-quic_kathirve@quicinc.com>
	<20221006105913.18356-2-quic_kathirve@quicinc.com>
Date: Tue, 11 Oct 2022 10:41:16 +0300
In-Reply-To: <20221006105913.18356-2-quic_kathirve@quicinc.com> (Karthikeyan
	Kathirvel's message of "Thu, 6 Oct 2022 16:29:06 +0530")
Message-ID: <8735buq02r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_004122_462095_0C75E9C2 
X-CRM114-Status: UNSURE (   8.93  )
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

> Add IPQ5018 device support for ath11k.
>
> Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.5.0.1-01192-QCAHKSWPL_SILICONZ-1 v1
>
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 1 +
>  1 file changed, 1 insertion(+)

Remember to include devicetree@vger.kernel.org list as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
