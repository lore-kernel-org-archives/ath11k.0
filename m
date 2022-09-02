Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B37EECAAD5
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhgNOtuFl+sniEhf0ZM9DNcstQFkVxwao4QFdWDGL+g=; b=G6ElDfDtieWM6+
	mJOYlWLrgNaEH5vKzayHZJxukHtogUFIj0O2nMsD+0p0qg5RBEOshDTKW5JmF4E/KY4QH9yMqXOiK
	8iJe5uMtcyOIUbGKTOpn/x2/WMso8dHDOd6hsAN1Jeudqv2Yh/4aduQoUvvq7xOOa6qv6PG6Gp0AO
	qTE1//D8DtlO9F9J6kXCXLOMZ8x06eHkpokix1Vp7bymRLkQrhuyqLk/DgCrMOrg1ZBg1N9fg8vmd
	uTh+JYlaPoE+kMZsIaAmWajnXjgdTXXSKJCFFN/+VXI1DV6kDt5VdvQ7x6hF8mTiEmV1WeK7RldcN
	X7FKYMbsEO8drMz0gRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5hO-004Tvm-Ee; Fri, 02 Sep 2022 12:23:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5hL-004Ttb-EZ
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 12:23:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E669F6211C;
	Fri,  2 Sep 2022 12:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBE4C433D7;
	Fri,  2 Sep 2022 12:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662121378;
	bh=oyHGH9UTftZEqKaUXOjKGBBK38sKQD7Du+L1lAYRoyI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ngaUmljQn+cV8AmFsr51zw9JlSriE1KyTfqrh+WZzk2v2ZlWRnI0fvS5SmFQVVhRH
	 N3FoB+DlIgMV86GdCHn70k/nL50+j1kRDcLFII3XC+hurNzitrWsTvJAFP8BJ5g9Cv
	 6qtNfVPbTHcAhI2DqspH/6tzqLzp6m/j11rajLbcknxozOffWGz4pGnEu2qvsVAWWl
	 yx25+IYK/+5FdKvpvqLq7BTDlsTDjYgzPk5g+xx4H4ML9Iiztr9s8qsiTTrF8TMnJ1
	 4rqOswsEVtN9MUm/Af593njcxtft6KEIs8AVUmA+Mc1ELWNNldpgnFPC0esUuKyjdr
	 lmroSiSwKNh/Q==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <robh@kernel.org>,  <krzysztof.kozlowski+dt@linaro.org>,  <linux-wireless@vger.kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] ath11k: Add WoW support for WCN6750
References: <20220902112520.24804-1-quic_mpubbise@quicinc.com>
	<20220902112520.24804-3-quic_mpubbise@quicinc.com>
Date: Fri, 02 Sep 2022 15:22:51 +0300
In-Reply-To: <20220902112520.24804-3-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Fri, 2 Sep 2022 16:55:20 +0530")
Message-ID: <87h71qartw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_052259_546637_EC02359D 
X-CRM114-Status: GOOD (  10.78  )
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

> Add support for WoW on WCN6750 chipset.
>
> Unlike other chips where WoW exit happens after sending WoW wakeup
> WMI command, exit from WoW suspend in the case of WCN6750 happens
> upon sending a WoW exit SMP2P (Shared memory point to point) message
> to the firmware.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

In the future please always add "wifi:" to wireless patches. No need to
resend because of this, I can fix it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
