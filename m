Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF62ECAAD5
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8qtztvjErg7byXvC3QOBSeZwYVLPCxZT6aNN9JXo9o=; b=Jz3oPT9ZWOqM0V
	58PwUpKbcRnOqmeuAoY4hIIUcugyobDQCwvgfGA5sl9O8bfOWyTVgbu6cyzHPdy7gbBcFS2aUJI54
	XPWbhtBIT7a3zdEQvfnTHSt+J4IJgGQSn9O9rNk0S4Ua9nhl0cg6i2wJOwCjOTb9MGlWvHMNqvPMP
	kl0Hd9PSMvipeo/6kLlmIpNfLY6lO7yjpS9ZvKknZTVmEAud/8BKcmafoOvf3IXIX4JRXAGs1pjYE
	KZJ6EEhsfcajBlb7HPzpj1ilFwl/EkNdI1EiQSaFw0C3wRkixC/Ow4QYXXLr53cnUDiwDgo0IVHc4
	FLwvbS3mkQBobcl4a7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5lf-004W8Q-0z; Fri, 02 Sep 2022 12:27:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5lb-004W6v-MZ
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 12:27:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AE0162178;
	Fri,  2 Sep 2022 12:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54C3C433D6;
	Fri,  2 Sep 2022 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662121642;
	bh=CgLnuouAB0vCyz3vDvXg4KuFUnRYa9HnnlVwJvFlqv0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gTMKyCNlsVgaMNY0T7ffNEF1KIA4QdXETjwQBeZq7sZtWPAjHaBfhtaAw385nsaUc
	 L6C3M62ewoe+iLnW8mKPQZHKqNeqhawKUEc4hrfC4KgTCI5RB5kUbn7IIYcwJaF8it
	 AcBWmUpqqOoJYMh8OjwPJPChnEpfax7iyo2AWmfFgoimvDFKtdu4fkBAVvGusbjRqM
	 KR7mqdQgyd0wHg16m7s1VoaY1xmN3OvIkpWfJPBodsB/R2wwd8EXqF0tC4+Uck/eVP
	 3nMgBqgp8OJEOJeB8oA4J53TMvX+h7UnCCCq2zL6Wiw8KJABUCLjk8R9Tesq6g8Q68
	 XEBwonkY0UD0w==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Add TWT debugfs support for STA interface
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220720135150.22193-2-quic_mpubbise@quicinc.com>
References: <20220720135150.22193-2-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166212163953.9935.11315879224878748482.kvalo@kernel.org>
Date: Fri,  2 Sep 2022 12:27:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_052723_806625_B0400776 
X-CRM114-Status: GOOD (  11.10  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Currently TWT debugfs files required for manually testing the
> TWT feature are created only for the AP interfaces; these debugfs
> hooks are also required for the station interfaces in order to
> test the TWT feature manually, therefore create these debugfs
> hooks for station iftype as well.
> 
> In the case of station interfaces, TWT is entirely handled in the
> firmware based on input parameters passed to it during association
> via TWT enable WMI command. In order to manually test this feature,
> firmware expects to first disable the TWT feature and then send the
> enable command with sta_cong_timer_ms parameter set to 0.
> This is true for WCN6750, QCA6390 & WCN6855 hardwares.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

9e2747c31e5a wifi: ath11k: Add TWT debugfs support for STA interface
607c467eac7d wifi: ath11k: Fix hardware restart failure due to twt debugfs failure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220720135150.22193-2-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
