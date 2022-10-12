Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957AFC433FE
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 06:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vL9RuuflYEI4oY+KWJwdV998OW82J6HICUUZWrTIdsU=; b=G1BNbAxFPSNU0I
	WkzVixFuDxlvYVVvRfND2LGaNlD2Z1NHFGFIqiUfS6e7waAk0+G0z8PKtMNPQOUktS0/dT0kU0dxz
	gqzs29wiz76tXNg9JPQhcNGHhZ9J1lcXZuXdiBady4oDWyoXN72DZMVLCyDDu4cd9KEuy3qgsOEfy
	dUkjQ13uCxdhssMbiLkhSUyJxUf9OuZFasVWWSo62UYhy+QiCduZAePzWKZLUjzm9H0o2cj7xCE4/
	g6vZASn/+Nmx0LYlkgiCp2fYa/pmobhYA6qTdqjAfgMfAi4Z8NmhcSrvFiYw9PrPZJZlmLFqEseOh
	Om2y8N9CVvFGYi4tG2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVRI-0075At-QN; Wed, 12 Oct 2022 06:42:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVR8-0074zk-BB
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 06:41:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D963A61435;
	Wed, 12 Oct 2022 06:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D460C433C1;
	Wed, 12 Oct 2022 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665556909;
	bh=VpGvA92+eNn2z/51V0SAMekoYf0jBIGTRdYI6T6dEbQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DBOKB49/xTPht4HW8y7vGwtK8ajIGafaNfSgOjKbGaOee4PYXDJuiaXQ9tK6zq0Bx
	 chDQQStdxOdmiywhZzN2L5tP6EV29yjy59TNFeVztNsRLFyWs/w+UAd5rVHB36f9Yi
	 un+N6cJXhIpNCi9WRwhHYwd5ifpohVNb5Wv+oEzS9v5lu9M2fX+jRurURsFzyEVgmt
	 UzveL0dum7nuiUFAB6n4IEwQ9TMcCRj5F61iT+oZnaPu1Hj0RQJlAPGZE0i8uEOEx6
	 w1kxu+BzvXPMPGZzcPvIjQLxYAYSg23BpB5aUND0rKfYNz3ujF+n0URESzYl0YV0ca
	 rXEn6aimvEk/w==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: add support to configure channel dwell time
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221007051130.6067-1-quic_mpubbise@quicinc.com>
References: <20221007051130.6067-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166555690629.24262.3012196197075046477.kvalo@kernel.org>
Date: Wed, 12 Oct 2022 06:41:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_234157_078567_319A05CF 
X-CRM114-Status: GOOD (  10.47  )
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

> Add support to configure channel dwell time during scan.
> Dwell time help to stay on the channel for a specified duration
> during scan and aid userspace in finding WiFi networks. Very
> useful in passive scans where longer dwell times are needed
> to find the WiFi networks.
> 
> Configure channel dwell time from duration of the scan request
> received from mac80211 when the duration is non-zero. When the
> scan request does not have duration value, use the default ones,
> the current implementation.
> 
> Advertise corresponding feature flag NL80211_EXT_FEATURE_SET_SCAN_DWELL
> to enable the feature.
> 
> Change is applicable for all ath11k hardware.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c362daa213cd wifi: ath11k: add support to configure channel dwell time

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221007051130.6067-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
