Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2C9C433F5
	for <ath11k@archiver.kernel.org>; Wed, 12 Jan 2022 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUe7zVrby5K5LfYvIX4TyyZ98d6YoGw6qhq6fKS0PTk=; b=SjHR7InkiOO91y
	hHJJdniymYB4YY5LXwNqL8yXqXB9xqOaJvH+Zqg+OSOglv5aP+Ht2z4zydPPpjNcXd8KEalOXRTUE
	ue1KjWx8Rdd9EoBQGD7QI8d4gy3EggfiNv2l82Eb3xn6XX7kalqiVXb+My6Oi9hxiHg+1LlMoenMK
	MS3lQ32FZGcCvNxCRIS+PT3eYSL/FAz2VrXWj2AKtpyP5/MEnd8jlgYsPngiBVP4n8bDvyH5N+uNg
	Aan3v9H0VEru8wSZ4isseS7bfLq+VfV/nxzZvqf/zyTJRDEQGHhluNKSwHxt0BbmRWXi2tqnNkzCL
	JcJfARUVfhlNYAP391sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Yew-001TCt-G5; Wed, 12 Jan 2022 08:07:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Yes-001TAe-0E
 for ath11k@lists.infradead.org; Wed, 12 Jan 2022 08:07:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC30BB81E00;
 Wed, 12 Jan 2022 08:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42148C36AE9;
 Wed, 12 Jan 2022 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641974819;
 bh=4tO9NzgmMk/Plk8GSck3d0toWnZ2wKiRlJW3h+gPbp4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Sb/6m0A9eixBUYaCEL7Bsn2lzkE8pDTZv5VCu8fSk0NfUz6GNzz5j5Z2n+s1kv6t8
 vtSw/+H8sUdC0ZfnGvFqnp0GUoR+GFaVYSlCVxofaBEZ2H+cC5BT2Ahu8za0QTvhUa
 bgtmp2ugee+MDp4zyin9Pgi+4okuc9MN7v200h4uzWs8FPZSEeqNqgBpYABsz/o8rx
 sHI6PPM2rb+fwxml+++PHt/VnsVDP1/8PaWQtZLE0MAafIrtqVoItX9n6Ajs4quH27
 48xjOafd6f1zhewMY8VwoEAYjKJYIX0XgTZROBgWXN1PhSmBdUG3Qsx7KDJIlzEe8l
 liBOYfvzEbBcw==
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: add LDPC FEC type in 802.11 radiotap header
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1638294648-844-3-git-send-email-quic_ppranees@quicinc.com>
References: <1638294648-844-3-git-send-email-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <johannes@sipsolutions.net>,
 <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164197478449.14338.8479462708097638703.kvalo@kernel.org>
Date: Wed, 12 Jan 2022 08:06:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_000702_216404_D6C177F8 
X-CRM114-Status: UNSURE (   7.60  )
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

P Praneesh <quic_ppranees@quicinc.com> wrote:

> LDPC is one the FEC type advertised in msdu_start info2 for HT packet
> type. Hence, add hardware specific callback for fetching LDPC
> support from msdu start and enable RX_ENC_FLAG_LDPC flag while passing
> rx status to mac80211.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b3febdccde3e ath11k: add LDPC FEC type in 802.11 radiotap header

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1638294648-844-3-git-send-email-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
